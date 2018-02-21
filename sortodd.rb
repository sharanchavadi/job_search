numbers =[5, 3, 2, 8, 1, 4]

even_array = []
odd_array = []
result_array = []

numbers.each do |number|

	if number.odd?
       odd_array.push(number)
       
	else
	   even_array.push(number)
	   
	end

end
puts "Given array: #{numbers}"
odd_sort = odd_array.sort!
puts "Odd array: #{odd_sort}"

puts "Even array: #{even_array}"

i = 0
j=0
numbers.each do |number|
	
	if number.odd?
		 val = odd_sort[i]
		 result_array.push(val)
		 i+=1
	else
		 val = even_array[j]
		 result_array.push(val)
		 j+=1
    end

end
puts "#{result_array}"



	




