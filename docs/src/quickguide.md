# Quick Start Guide

Once Gas Models is installed, Juniper is installed, and a network data file (e.g. `"test/data/gaslib-40.m"`) has been acquired, a Gas Flow with the second order cone (SOC) relaxation can be executed with,

```julia
using GasModels
using Juniper
using Ipopt
using HiGHS
using JuMP

juniper_solver = JuMP.optimizer_with_attributes(Juniper.Optimizer,
    "nl_solver" => JuMP.optimizer_with_attributes(Ipopt.Optimizer, "tol" => 1e-4, "print_level" => 0, "sb" => "yes"),
    "mip_solver" => highs_solver, "log_levels" => [])
GasModels.run_soc_gf("test/data/matgas/gaslib-40.m", juniper_solver)
```

Similarly, a full non-convex Gas Flow can be executed with an MINLP optimizer like

```julia
using GasModels
using Juniper
using JuMP

juniper_solver = JuMP.optimizer_with_attributes(Juniper.Optimizer,
    "nl_solver" => JuMP.optimizer_with_attributes(Ipopt.Optimizer, "tol" => 1e-4, "print_level" => 0, "sb" => "yes"),
    "mip_solver" => highs_solver, "log_levels" => [])
GasModels.run_dwp_gf("test/data/matgas/gaslib-40.m", juniper_solver)

```
## Getting Results

The run commands in GasModels return detailed results data in the form of a dictionary.
This dictionary can be saved for further processing as follows,

```julia
result = GasModels.run_soc_gf("test/data/matgas/gaslib-40.m", juniper_solver)
```

For example, the algorithm's runtime, final objective value, and status can be accessed with,

```
result["solve_time"]
result["objective"]
result["termination_status"]
```

The `"solution"` field contains detailed information about the solution produced by the run method.
For example, the following dictionary comprehension can be used to inspect the junction pressures in the solution,

```
Dict(name => data["p"] for (name, data) in result["solution"]["junction"])
```

For more information about GasModels result data see the [GasModels Result Data Format](@ref) section.


## Accessing Different Formulations

The function ```run_soc_gf``` and ```run_minl_gf``` are shorthands for a more general formulation-independent gas flow execution, ```run_gf```.
For example, ```run_soc_gf``` is equivalent to,

```julia
run_gf("test/data/matgas/gaslib-40.m", CRDWPGasModel, juniper_solver)
```

where "CRDWPGasModel" indicates an SOC formulation of the gas flow equations.  This more generic `run_gf()` allows one to solve a gas flow feasibility problem with any gas network formulation implemented in GasModels.  For example, the full non convex Gas Flow can be run with,

```julia
run_gf("test/data/matgas/gaslib-40.m", DWPGasModel, couenne_solver)
```

## Modifying Network Data
The following example demonstrates one way to perform multiple GasModels solves while modify the network data in Julia,

```julia
network_data = GasModels.parse_file("test/data/matgas/gaslib-40.m")

run_gf(network_data, CRDWPGasModel, juniper_solver)

network_data["junction"]["24"]["p_min"] = 0.0

run_gf(network_data, CRDWPGasModel, juniper_solver)
```

For additional details about the network data, see the [GasModels Network Data Format](@ref) section.

## Inspecting the Formulation
The following example demonstrates how to break a `run_gf` call into separate model building and solving steps.  This allows inspection of the JuMP model created by GasModels for the gas flow problem,

```julia
gm = instantiate_model("test/data/matgas/gaslib-40.m", CRDWPGasModel, GasModels.build_gf)
print(gm.model)
JuMP.set_optimizer(gm.model, juniper_solver)
JuMP.optimize!(gm.model, juniper_solver)
```

## Solution conversion

The default behavior of GasModels produces solution results in non-dimensionalized units. To recover solutions in SI units, the following function can be used

```julia
GasModels.make_si_units!(result["solution"])
```
