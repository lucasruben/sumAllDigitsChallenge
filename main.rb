#sumAllDigits in Ruby
#Auxiliar function
def number_or_nil(string)
  Integer(string || '')
rescue ArgumentError
  nil
end
#Converts a number into an array
def numbers_in(value)
    numbers = Array.new
	if value==0 then numbers end
	numbers = numbers_in(value/10)
	numbers.push(value%10)
	return numbers
end
#Sums the digits of a number
def aux_sum(n)
	result = 0
	array_n = Array.new
	array_n = numbers_in(n)
	for i in 0..array_n.length
		result += array_n[i]
	end
	return result
end
#Given N, sums all the numbers (digits only) including N	
def sum_all_digits(n)
	sum = 0
	if n==1
		sum = 1
	elsif n>1
		for i in 1..n
			if i.to_s.size > 1
				sum+=aux_sum(i)
			else
				sum+=i
			end
		end
	else
		puts "N should be greater than 1."
	end
    puts sum
	return sum
end

input_number = number_or_nil("BMC_TEST_INPUT_MAGIC")
sum_all_digits(input_number)
