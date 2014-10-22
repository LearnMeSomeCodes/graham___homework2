def menu
	puts "0 - Review entries"
	puts "1 - New entry"
	choice = gets.chomp

	if choice == 0
		index
	end

	if choice == 1
		new
	end
end

def new
	puts "First Name:"
	first_name = gets.chomp 
	puts "Last Name:"
	last_name = gets.chomp 
	puts "Phone Number:"
	phone = gets.chomp 
	puts "E-mail:"
	email = gets.chomp
end

def index


menu