function longestRange(v)

    bestRange = []
    longestLength = 0
    nums = Dict()

    for num in v

        nums[num] = true

    end

    for num in v

        if !(nums[num])

            continue

        end

        nums[num] = false

        currentLength = 1
        left = num - 1
        right = num + 1

        while left ∈ keys(nums)

            nums[left] = false
            currentLength += 1
            left -= 1

        end

        while right ∈ keys(nums)

            nums[right] = false
            currentLength += 1
            right += 1

        end

        if currentLength > longestLength

            longestLength = currentLength
            bestRange = [left + 1, right - 1]

        end

    end

    return bestRange

end


# Test
v_test = [1, 11, 3, 0, 12, 13, 15, 16, 14, 18, 19, 20, 15, 5, 2, 4, 10, 7, 12, 6];
println(longestRange(v_test))
