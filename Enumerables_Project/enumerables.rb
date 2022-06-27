
#Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and returns the original array.
#  Do not use Enumerable's each method. I want to be able to write:

class Array

    def my_each(&prc)

        i = 0
        while i < self.size
            prc.call(self[i])            
        
            i += 1
        end
        self
    end
    
    
end



# calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#     puts num
# end.my_each do |num|
#     puts num
#    end
#    # => 1
#     #    2
#     #    3
#     #    1
#     #    2
#     #    3
   
#    p return_value  # => [1, 2, 3]




#    My Select

# Now extend the Array class to include my_select that takes a block and returns a new array
# containing only elements that satisfy the block. Use your my_each method!
class Array
    def my_select(&prc)
        output_arr = []
        self.my_each {|ele| output_arr << ele if prc.call(ele)}

        output_arr
        
        
    end
end


# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


=begin
My Reject
Write my_reject to take a block and return a new array excluding elements that satisfy the block.
=end
class Array
    def my_reject(&prc)
        output_arr = []
        self.my_each {|ele| output_arr << ele if !prc.call(ele)}

        output_arr
        
        
    end
end

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

=begin
My Any
Write my_any? to return true if any elements of the array satisfy the block and my_all? to return true only if all elements satisfy the block.
=end

class Array
    def my_any?(&prc)
        output_arr = []
        self.my_each {|ele| return true if prc.call(ele)}
        
        return false
    end
end

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false

class Array
    def my_all?(&prc)
        output_arr = []
        self.my_each {|ele| return false if !prc.call(ele)}
        
        return true
    end
end

# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!

class Array
    def my_flatten(data = self)
        return [data] if !data.is_a?(Array)
        data.inject([]) {|acc, cur| acc + self.my_flatten(cur)}
#         self.my_flatten
    end
end

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


# My Zip
# Write my_zip to take any number of arguments. It should return a new array containing self.length elements. Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index. If the size of any argument is less than self, nil is returned for that location.
class Array
    def my_zip(*arrays)

        self.map.with_index {|ele, i| arrays.inject(ele) { |acc, cur| acc + cur[i]}}    
        
    end
end





a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
[1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
[1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
[1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]