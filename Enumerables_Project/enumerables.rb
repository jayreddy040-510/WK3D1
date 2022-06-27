
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
    def my_flatten
        return [data] if !data.is_a?(Array)

#         self.my_flatten
    end
end

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
