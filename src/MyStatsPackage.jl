module MyStatsPackage

include("statistic_functions.jl")

export rse_sum, rse_mean, rse_std, rse_tstat, printOwner

function printOwner()
    println("Owner of the package is Dmitry Kabanov")
end

end # module
