require "byebug"
def no_dupes?(arr)
    no_dupes_arr = []
    arr.each { |ele| no_dupes_arr << ele if arr.one?(ele) }
    no_dupes_arr
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    i = 0
    while i < arr.length - 2
        return false if arr[i] == arr[i+1]
        i += 1
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    indices_hash = Hash.new { |h, k| h[k] = [] }

    str.each_char.with_index { |char, i| indices_hash[char] << i }

    indices_hash
end
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    streak_count = Hash.new(0)
    i = str.length - 1

    while i > 0
        streak_count[str[i]] += 1 if str[i] == str[i+1]
        i -= 1
    end

    max_value = streak_count.values.max
    return str[0] if max_value == nil
    streak_count.each { |k, v| return k * (v + 1) if v == max_value }

end
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'




#RECURSIVE PROBLEMS
def multiply(a, b)
    return 0 if b == 0
     
    b.times
    multiply(a, b - 1)

end