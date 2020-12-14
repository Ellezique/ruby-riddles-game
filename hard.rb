#PUT EACH CLASS IN THEIR OWN FILE, good for reusability
#no tips. 3 attempts

=begin
puts "I speak without a mouth and hear without ears. 
I have no body, but I come alive with wind. 
What am I?" 

ANSWER = "echo"
response = gets.chomp

until response == ANSWER
	puts "Nope! Try again."
	response = gets.chomp
end

sleep (1)
puts "Yes! #{ANSWER}."
=end
