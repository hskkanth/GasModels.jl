using GasModels
using Logging

# suppress warnings during testing
Logging.configure(level=ERROR)

using Pavito
using Ipopt
using CoinOptServices
using AmplNLWriter
using Cbc
using GLPKMathProgInterface
using Juniper

bonmin_solver = AmplNLSolver(CoinOptServices.bonmin)
couenne_solver =  AmplNLSolver(CoinOptServices.couenne)
ipopt_solver = IpoptSolver(tol=1e-6, print_level=0)
cbc_solver = CbcSolver()
glpk_solver = GLPKSolverMIP()
juniper_solver = JuniperSolver(ipopt_solver)

pavito_solver_cbc = PavitoSolver(mip_solver=cbc_solver, cont_solver=ipopt_solver, mip_solver_drives=false, log_level=1)
pavito_solver_glpk = PavitoSolver(mip_solver=glpk_solver, cont_solver=ipopt_solver, mip_solver_drives=false, log_level=1)


using Base.Test

# default setup for solvers
misocp_solver = pavito_solver_cbc
minlp_solver = juniper_solver

@testset "GasModels" begin

include("data.jl")
include("ls.jl") # this one is unstable with Pajarito... dependent on ordering of variables and constraints
include("nels.jl")
include("gf.jl")
include("ne.jl")

end