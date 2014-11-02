### Nice trick!
puts "\e[H\e[2J"

### And, good job using a Class instead of a Hash.
class Person
	attr_accessor :first_name, :last_name, :phone, :email

  ### Thought: since you're using a Class instead of a Hash,
  ###          you can define some methods to make the rest
  ###          of your code easier.  Some examples:
  ###
  ###            * full_name:      --> "Bob Dole"
  ###            * last_first:     --> "Dole, Bob"
end

def new(book)
	person = Person.new()

	puts "\n-+-+-+-New Entry-+-+-+-\n\n"
	print "First Name: "
	person.first_name = gets.chomp
	print "Last Name: "
	person.last_name = gets.chomp
	print "Phone: "
	person.phone = gets.chomp
	print "Email: " 
	person.email = gets.chomp
	puts "\nAdded #{person.first_name} #{person.last_name} to the address book!\n\n"

	book.push person
end

def view(book)
	if book.count > 0
	puts "\e[H\e[2J"
	list(book)
	print "View? "
	num = gets.chomp.to_i

  ### TODO: What if the user specifies an invalid index?
  ### TODO: What if the user specifies a negative index?
	
	print "First Name: "
	puts book[num].first_name

	print "Last Name: "
	puts book[num].last_name

	print "Phone: "
	puts book[num].phone

	print "Email: " 
	puts book[num].email
	else
	puts "\nNo entries exist to view!\n\n"	
	end
end

def delete(book)
	if book.count > 0
	puts "\e[H\e[2J"
	list(book)
	print "\nDelete? "
	num = gets.chomp.to_i

  ### TODO: What if the user specifies an invalid index?
  ### TODO: What if the user specifies a negative index?

	puts "\nDeleted #{book[num].first_name} #{book[num].last_name}!\n\n"
	book.delete_at(num)
	else
	puts "\nNo entries exist to delete!\n\n"	
	end

end

def list(book)
	n = 0
	puts "-+-+-+-Entries-+-+-+-"
	book.each do |person|
		puts "#{n} - #{person.last_name}, #{person.first_name}"
	n += 1
	end
end

book = []
menu = 4


### Nice job at recognizing that this form of the "while"
### loop was a better match for the desired main menu behavior.
begin
	puts "-+-+-+-Menu-+-+-+-"
	puts "0 - Create new entry"
	puts "1 - View existing entry"
	puts "2 - Delete existing entry"
	puts "3 - Quit Application"
	print "\n? "
	menu = gets.to_i
	if menu == 0
		new(book)
	elsif menu == 1
		view(book)
	elsif menu == 2
		delete(book)
	elsif menu == 3
		puts "\nQuitting application…\n\n"

    ### Note: This 'break' statement is actually unnecessary
    ###       since your loop will exit in a few lines anyway.
    ###       Alternatively, you can create an 'infinite' loop
    ###       like this:
    ###
    ###         loop do
    ###           # body
    ###         end
		break
	else
		puts "\nStop wasting time!\n\n"
	end

end while menu != 3
