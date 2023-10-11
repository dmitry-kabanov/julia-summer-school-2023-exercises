using ProgressMeter

"""
    rse_sum(arr)::Number

Return the sum of all the elements of the array `arr`.

# Arguments

- `arr` -- array of numbers

# Output

The sum of all the numbers in the array.

# Notes

Make sure that all elements of the array are numbers.

# Examples

```julia-repl
julia>rse_sum([1, 2, 3])
6
\```

See also [`rse_mean`](@ref), [`rse_std`](@ref).
"""
function rse_sum(arr)
    s = 0
    @showprogress for i = 1:length(arr)
        s += arr[i]
    end

    return s
end

"""
    rse_mean(arr)::Number

Return the mean of all elements in the array.

# Arguments

- `arr` -- array of numbers

# Output

The mean value.

# Notes

If the array empty, return zero.

# Examples

```julia-repl
julia>rse_mean([1, 2, 3])
2
\```

See also [`rse_sum`](@ref), [`rse_std`](@ref).
"""
function rse_mean(arr)
    if length(arr) == 0
        return 0
    end
    s = rse_sum(arr)
    return s / length(arr)
end

"""
    rse_std(arr)::Float64
    
# Arguments

- `arr` -- array of numbers

# Output

Standard deviation:
\[
    \sigma = \sqrt{\frac{\sum_i^N x_i - \bar x}{N}
\],
where $\bar x$ is the mean value, $N$ the number of elements in the array.

See also [`rse_sum`](@ref), [`rse_mean`](@ref).
"""
function rse_std(arr)
    mean = rse_mean(arr)
    return sqrt(+((arr .- mean) .^ 2...) / (length(arr) - 1))
end
## Test case rse_std(1:3) == 1
#---

function rse_tstat(arr; σ=rse_std(arr))
    return rse_mean(arr) / (σ / sqrt(length(arr)))
end
## Test case: rse_tstat(2:3) == 5