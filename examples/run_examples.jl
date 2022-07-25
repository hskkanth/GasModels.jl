using GasModels

using JuMP
using Ipopt
using HiGHS
using Juniper
using Gurobi
using SCIP
using Test
#using ECOS
#using SCS
#using CPLEX
#using AmplNLWriter

ipopt_solver = JuMP.optimizer_with_attributes(Ipopt.Optimizer, "tol" => 1e-6, "print_level" => 0, "sb" => "yes")
highs_solver = JuMP.optimizer_with_attributes(HiGHS.Optimizer, "output_flag"=>false)
juniper_solver = JuMP.optimizer_with_attributes(Juniper.Optimizer, "nl_solver" => ipopt_solver, "mip_solver" => highs_solver, "log_levels" => [])

env = Gurobi.Env()
gurobi_solver = JuMP.optimizer_with_attributes(() -> Gurobi.Optimizer(env))
scip_solver = JuMP.optimizer_with_attributes(SCIP.Optimizer)
#ecos_solver = JuMP.optimizer_with_attributes(ECOS.Optimizer, "verbose" => false, "maxit" => 10000)
#scs_solver = JuMP.optimizer_with_attributes(SCS.Optimizer)
#cplex_solver = JuMP.optimizer_with_attributes(CPLEX.Optimizer, "CPX_PARAM_SCRIND" => 0)
#couenne_solver = JuMP.optimizer_with_attributes(AmplNLWriter.Optimizer("couenne.exe"))
#bonmin_solver = JuMP.optimizer_with_attributes(AmplNLWriter.Optimizer("bonmin.exe"))

misocp_solver = gurobi_solver
mip_solver = gurobi_solver
lp_solver = gurobi_solver
minlp_solver = scip_solver
nlp_solver = scip_solver

@testset "Examples" begin
    include("gf.jl")
    include("ls.jl")
    include("ne_A1.jl")
    include("ne_A2.jl")
    #include("ne_A3.jl")
    include("ne_gaslib-40.jl")
    include("ne_gaslib-135.jl")
    include("ne_gaslib-582.jl")
end
