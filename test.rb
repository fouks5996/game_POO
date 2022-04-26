def reject (arr)
    res = arr.reject{|el| el > 2}
    puts res
end

array = [1,2,3]

reject(array)