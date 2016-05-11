require 'timeout'

#sumAllDigits in Ruby
#Sums the digits of a number
def aux_sum(n)
    result = 0
	array_n = n.to_s.split('').map(&:to_i)
	for i in 0..array_n.length-1
		result += array_n[i]
	end
	return result
end

#Given N, sums all the numbers (digits only) including N	
def sum_all_digits(n)
	sum = 0
	time = 3
	begin
    	Timeout::timeout(time) do
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
        end
	rescue Timeout::Error
	    puts 'Process not finished in time, killing it'
	    Process.kill('TERM', Process.pid)
	end
	puts sum
	return sum
end

#sum_all_digits(10)
