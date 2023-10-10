using ProgressMeter
#---
function rse_sum(arr)
    s = 0
    @showprogress for i = 1:length(arr)
        s += arr[i]
    end

    return s
end
## Test case: rse_sum(1:36) == 666
#---
function rse_mean(arr)
    if length(arr) == 0
        return 0
    end
    s = rse_sum(arr)
    return s / length(arr)
end

#---
function rse_std(arr)
    mean = rse_mean(arr)
    return sqrt(+((arr .- mean) .^ 2...) / (length(arr) - 1))
end
## Test case rse_std(1:3) == 1
#---

function rse_tstat(arr; σ = rse_std(arr))
    return rse_mean(arr) / (σ / sqrt(length(arr)))
end
## Test case: rse_tstat(2:3) == 5
