using Test

using MyStatsPackage

@testset "unit tests for rse_sum" begin
    @test rse_sum([1, 2, 3]) == 6
    @test rse_sum(1:36) == 666
end

@testset "unit tests for rse_mean" begin
    @test rse_mean([1, 2, 3]) == 2
    @test rse_mean([1, 2, 3, 4, 7, 10]) == 4.5
    @test rse_mean(1:99) == 50
end

@testset "unit tests for rse_std" begin
    @test rse_std(1:10) ≈ 3.027 rtol = 1e-3
    @test rse_std(range(1, stop=100, length=21)) == 30.71394227382737
end

@testset "unit tests for rse_tstat" begin
    x = collect(range(1, stop=100, length=21))
    mean = 50.5
    std = 30.71394227382737
    @test rse_tstat(2:3) == 5
    @test rse_tstat(x) == mean / (std / sqrt(length(x)))
end