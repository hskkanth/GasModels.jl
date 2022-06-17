"Constraint: fixing slack node density value"
function constraint_slack_junction_density(gm::AbstractGasModel, nw::Int, slack_junction_id::Int, fixed_density::Float64)
    rho = var(gm, nw, :density, slack_junction_id)
    _add_constraint!(gm, nw, :slack_junction_density, slack_junction_id, JuMP.@constraint(gm.model, rho == fixed_density))
end

"Constraint: nodal balance"
function constraint_nodal_balance(gm::AbstractGasModel, junction_id::Int, nw::Int = nw_id_default)
    net_in = var(gm, nw, :net_nodal_injection, junction_id)
    net_out = var(gm, nw, :net_nodal_edge_out_flow, junction_id)
    _add_constraint!(gm, nw, :nodal_balance, junction_id, JuMP.@constraint(gm.model, net_in == net_out))
end

"Constraint: slack junction mass balance"
function constraint_slack_junction_mass_balance(gm::AbstractGasModel, nw::Int, slack_junction_id::Int, net_injection, net_edge_out_flow)
    _add_constraint!(gm, nw, :slack_junction_mass_balance, slack_junction_id, JuMP.@constraint(gm.model, net_injection == net_edge_out_flow))
end

"Constraint: pipe mass balance"
function constraint_pipe_mass_balance(gm::AbstractGasModel, nw::Int, pipe_id::Int, fr_junction::Int, to_junction::Int, L::Float64)

    p_fr_dot = var(gm, nw, :density_derivative, fr_junction)
    p_to_dot = var(gm, nw, :density_derivative, to_junction)
    phi = var(gm, nw, :pipe_flux_neg, pipe_id)
    _add_constraint!(gm, nw, :pipe_mass_balance, pipe_id, JuMP.@constraint(gm.model, L * (p_fr_dot + p_to_dot) + 4 * phi == 0))
end

"Constraint: pipe momentum balance"
function constraint_pipe_momentum_balance(gm::AbstractGasModel, nw::Int, pipe_id::Int, fr_junction::Int, to_junction::Int, resistance::Float64)
    p_fr = var(gm, nw, :density, fr_junction)
    p_to = var(gm, nw, :density, to_junction)
    f = var(gm, nw, :pipe_flux_avg, pipe_id)
    _add_constraint!(gm, nw, :pipe_momentum_balance, pipe_id, JuMP.@NLconstraint(gm.model, p_fr^2 - p_to^2 - resistance * f * abs(f) == 0))
end

"Constraint: inclined pipe momentum balance.
The constraint takes the following form:
`` \\rho_to^2 - e^{r_2} \\cdot \\rho_fr^2 = r_1 \\cdot (e^{r_2} - 1) \\cdot f \\cdot |f|``
This is based on the work presented in the following paper:
S.K.K. Hari et al., Operation of Natural Gas Pipeline Networks With Storage Under Transient Flow Conditions"

function constraint_inclined_pipe_momentum_balance(gm::AbstractGasModel, nw::Int, pipe_id::Int, fr_junction::Int, to_junction::Int, resistance_1::Float64, resistance_2::Float64)
    p_fr = var(gm, nw, :density, fr_junction)
    p_to = var(gm, nw, :density, to_junction)
    f = var(gm, nw, :pipe_flux_avg, pipe_id)

    r_1 = resistance_1
    r_2 = resistance_2
    _add_constraint!(gm, nw, :inclined_pipe_momentum_balance, pipe_id, JuMP.@NLconstraint(gm.model, p_to^2 - exp(r_2)*p_fr^2 == r_1*(exp(r_2) - 1)*f*abs(f)))
end

"Constraint: non-slack junction mass balance"
function constraint_non_slack_junction_mass_balance(gm::AbstractGasModel, nw::Int, slack_junction_id::Int, derivative, net_injection, net_edge_out_flow)
    _add_constraint!(gm, nw, :non_slack_junction_mass_balance, slack_junction_id, JuMP.@constraint(gm.model, derivative + 4.0 * (net_edge_out_flow - net_injection) == 0))
end

"Constraint: pipe physics with an ideal gas assumption"
function constraint_pipe_physics_ideal(gm::AbstractGasModel, nw::Int, pipe_id::Int, fr_junction::Int, to_junction::Int, resistance::Float64)
    p_fr = var(gm, nw, :density, fr_junction)
    p_to = var(gm, nw, :density, to_junction)
    f = var(gm, nw, :pipe_flux, pipe_id)
    _add_constraint!(gm, nw, :pipe_physics_ideal, pipe_id, JuMP.@NLconstraint(gm.model, p_fr^2 - p_to^2 - resistance * f * abs(f) == 0))
end

"Constraint: aggregate withdrawal at transfer points computation"
function constraint_transfer_separation(gm::AbstractGasModel, transfer_id::Int, nw::Int = nw_id_default)
    s = var(gm, nw, :transfer_injection)[transfer_id]
    d = var(gm, nw, :transfer_withdrawal)[transfer_id]
    t = var(gm, nw, :transfer_effective)[transfer_id]

    _add_constraint!(gm, nw, :effective_transfer_withdrawal, transfer_id, JuMP.@constraint(gm.model, t == d - s))
end

"Constraint: compressor physics"
function constraint_compressor_physics(gm::AbstractGasModel, nw::Int, compressor_id::Int, fr_junction::Int, to_junction::Int, type::Int, min_ratio::Float64, max_ratio::Float64)
    p_fr = var(gm, nw, :density, fr_junction)
    p_to = var(gm, nw, :density, to_junction)
    alpha = var(gm, nw, :compressor_ratio, compressor_id)
    f = var(gm, nw, :compressor_flow, compressor_id)

    if type == 0
        if (min_ratio <= 1.0 && max_ratio >= 1)
            pk = JuMP.@variable(gm.model)
            alpha_1 = JuMP.@variable(gm.model)
            alpha_2 = JuMP.@variable(gm.model)
            JuMP.set_lower_bound(pk, 0.0)
            JuMP.set_lower_bound(alpha_1, 1.0)
            JuMP.set_lower_bound(alpha_2, 1.0)
            _add_constraint!(gm, nw, :compressor_physics_ratios_1, compressor_id, JuMP.@constraint(gm.model, pk - max_ratio^2 * p_fr^2 <= 0))
            _add_constraint!(gm, nw, :compressor_physics_ratios_2, compressor_id, JuMP.@constraint(gm.model, min_ratio^2 * p_fr^2 - pk <= 0))
            _add_constraint!(gm, nw, :compressor_physics_ratios_3, compressor_id, JuMP.@constraint(gm.model, f * (p_fr - pk) <= 0))
            _add_constraint!(gm, nw, :compressor_physics_ratios_4, compressor_id, JuMP.@constraint(gm.model, pk - max_ratio^2 * p_to^2 <= 0))
            _add_constraint!(gm, nw, :compressor_physics_ratios_5, compressor_id, JuMP.@constraint(gm.model, min_ratio^2 * p_to^2 - pk <= 0))
            _add_constraint!(gm, nw, :compressor_physics_ratios_6, compressor_id, JuMP.@constraint(gm.model, -f * (p_to - pk) <= 0))
            _add_constraint!(gm, nw, :compressor_physics_ratios_7, compressor_id, JuMP.@constraint(gm.model,  p_fr * alpha_1 == pk))
            _add_constraint!(gm, nw, :compressor_physics_ratios_8, compressor_id, JuMP.@constraint(gm.model,  p_to * alpha_2 == pk))
            _add_constraint!(gm, nw, :compressor_physics_ratios_9, compressor_id, JuMP.@constraint(gm.model,  alpha == alpha_1 + alpha_2 - 1))
            # There is a disjunction, so we have to use a binary variable for this one
        else
            Memento.error(_LOGGER, "For bidirectional compressor c_ratio_min needs to be <= 1.0 and c_ratio_max needs to be >= 1.0")
        end
        return
    end
    _add_constraint!(gm, nw, :compressor_physics_boost, compressor_id, JuMP.@constraint(gm.model, p_to == alpha * p_fr))
    (type == 1) && (return)
    if (type == 2)
        _add_constraint!(gm, nw, :compressor_physics_flow, compressor_id, JuMP.@constraint(gm.model, f * (p_fr - p_to) <= 0))
    end
end

"Constraint: compressor power"
function constraint_compressor_power(gm::AbstractGasModel, nw::Int, compressor_id::Int, compressor_power_expr, compressor_power_var)
    _add_constraint!(gm, nw, :compressor_power, compressor_id, JuMP.@NLconstraint(gm.model, compressor_power_var == compressor_power_expr))
end

"Constraint: well compression/pressure-reduction"
function constraint_storage_compressor_regulator(gm::AbstractGasModel, nw::Int, storage_id::Int, junction_id::Int)
    rho_junction = var(gm, nw, :density, junction_id)
    rho_well_head = var(gm, nw, :well_density, storage_id)[1]
    alpha = var(gm, nw, :storage_compressor_ratio, storage_id)
    GasModels._add_constraint!(gm, nw, :well_compressor_regulator, storage_id, JuMP.@constraint(gm.model, rho_junction == alpha * rho_well_head))
end

"Constraint: well momentum balance"
function constraint_storage_well_momentum_balance(gm::AbstractGasModel, nw::Int, num_discretizations::Int, storage_id::Int, beta::Float64, resistance::Float64)
    for i = 1:num_discretizations
        rho_top = var(gm, nw, :well_density, storage_id)[i]
        rho_bottom = var(gm, nw, :well_density, storage_id)[i+1]
        phi_avg = var(gm, nw, :well_flux_avg, storage_id)[i]
        GasModels._add_constraint!(gm, nw, :well_ideal_momentum_balance, storage_id * 1000 + i, JuMP.@NLconstraint(gm.model, exp(beta) * rho_bottom^2 - rho_top^2 == (-resistance * phi_avg * abs(phi_avg)) * (exp(beta) - 1) / beta))
    end
end

"Constraint: well mass balance"
function constraint_storage_well_mass_balance(gm::AbstractGasModel, nw::Int, num_discretizations::Int, storage_id::Int, L::Float64, is_end::Bool)
    for i = 1:num_discretizations
        rho_dot_top = var(gm, nw, :well_density_derivative, storage_id)[i]
        rho_dot_bottom = var(gm, nw, :well_density_derivative, storage_id)[i+1]
        phi_neg = var(gm, nw, :well_flux_neg, storage_id)[i]
        if is_end
            phi_neg = 0.5 * (var(gm, nw, :well_flux_neg, storage_id)[i] + var(gm, nw + 1, :well_flux_neg, storage_id)[i])
        end
        GasModels._add_constraint!(gm, nw, :well_ideal_mass_balance, storage_id * 1000 + i, JuMP.@constraint(gm.model, L * (rho_dot_top + rho_dot_bottom) + 4 * phi_neg == 0))
    end
end

"Constraint: storage well nodal balance"
function constraint_storage_well_nodal_balance(
    gm::AbstractGasModel, storage_id::Int, nw::Int = nw_id_default;
    num_discretizations::Int = 4, )

    f_wh = var(gm, nw, :well_head_flow, storage_id)
    f_bh = var(gm, nw, :bottom_hole_flow, storage_id)
    flow_from_wh = var(gm, nw, :well_flow_fr, storage_id)[1]
    flow_to_bh = var(gm, nw, :well_flow_to, storage_id)[num_discretizations]

    GasModels._add_constraint!(gm, nw, :wh_flow_balance, storage_id, JuMP.@constraint(gm.model, f_wh == flow_from_wh))

    GasModels._add_constraint!(gm, nw, :bh_flow_balance, storage_id, JuMP.@constraint(gm.model, f_bh == flow_to_bh))


    for i = 1:(num_discretizations-1)
        flux_to = var(gm, nw, :well_flux_to, storage_id)[i]
        flux_fr = var(gm, nw, :well_flux_fr, storage_id)[i+1]

        GasModels._add_constraint!(gm, nw, :well_nodal_balance, storage_id * 1000 + i, JuMP.@constraint(gm.model, flux_fr == flux_to))

    end
end

"Constraint: equivalence of bottom hole density and reservoir density"
function constraint_storage_bottom_hole_reservoir_density(
    gm::AbstractGasModel, storage_id::Int, nw::Int = nw_id_default;
    num_discretizations::Int = 4, )
    rho_bh = var(gm, nw, :well_density, storage_id)[num_discretizations+1]
    rho_reservoir = var(gm, nw, :reservoir_density, storage_id)

    GasModels._add_constraint!(gm, nw, :reservoir_and_well_density_equivalence, storage_id, JuMP.@constraint(gm.model, rho_bh == rho_reservoir))
end

"Constraint: reservoir physics"
function constraint_storage_reservoir_physics(
    gm::AbstractGasModel, storage_id::Int, nw::Int = nw_id_default;
    is_end::Bool = false, )
    volume = ref(gm, nw, :storage, storage_id)["reservoir_volume"]
    rho_dot = var(gm, nw, :reservoir_density_derivative, storage_id)
    f_bh = var(gm, nw, :bottom_hole_flow, storage_id)
    if is_end
        f_bh = 0.5 * (var(gm, nw, :bottom_hole_flow, storage_id) + var(gm, nw + 1, :bottom_hole_flow, storage_id))
    end

    GasModels._add_constraint!(gm, nw, :reservoir_physics, storage_id, JuMP.@constraint(gm.model, volume * rho_dot == f_bh))
end

"Constraint: reservoir initial condition"
function constraint_initial_condition_reservoir(gm::AbstractGasModel, storage_id::Int, nw::Int, initial_density)
    rho = var(gm, nw, :reservoir_density, storage_id)
    GasModels._add_constraint!(gm, nw, :reservoir_initial_condition, storage_id, JuMP.@constraint(gm.model, rho == initial_density))
end

"Constraint: time periodicity of well head flow"
function constraint_wh_flow_time_periodicity(gm::AbstractGasModel, storage_id::Int, nw_start::Int, nw_end::Int)
    f_wh_start = var(gm, nw_start, :well_head_flow, storage_id)
    f_wh_end = var(gm, nw_end, :well_head_flow, storage_id)
    GasModels._add_constraint!(gm, nw_start, :wh_flow_periodicity, storage_id, JuMP.@constraint(gm.model, f_wh_start == f_wh_end))
end
