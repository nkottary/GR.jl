using GR
using Base.Test

@test tick(1.2,3.14) == 0.5

tests = [ "ex", "griddata" ]

for t in tests
    tp = joinpath(dirname(@__FILE__), "$(t).jl")
    println("running $(tp) ...")
    inline("pdf")
    include(tp)
    file_path = ENV["GKS_FILEPATH"]
    @test isfile(file_path)
    rm(file_path)
end
