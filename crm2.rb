require_relative 'contact'
class CRM 

  def initialize

  end

  def main_menu
while true
  print_main_menu
  user_selected = gets.to_i
call_option(user_selected)
  end
end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_option)
    case user_option
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    # Finish off the rest for 3 through 6
    # To be clear, the methods add_new_contact and modify_existing_contact
    # haven't been implemented yet
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp
  
    print 'Enter Last Name: '
    last_name = gets.chomp
  
    print 'Enter Email Address: '
    email = gets.chomp
  
    print 'Enter a Note: '
    note = gets.chomp

   contact = Contact.create(first_name: first_name, last_name: last_name, email: email, note: note)
  end

  def modify_existing_contact
puts "enter the id you'd like to modify"
a = gets.chomp.to_i
my_contact = Contact.find(a)
puts " enter the attribute you'd like to modify"
b = gets.chomp
puts "enter new value"
c = gets.chomp
my_contact.update(b,c)
  end

  def delete_contact
puts " enter the idd you'd like to delete"
a = gets.chomp.to_i
my_contact = Contact.find(a)
my_contact.delete
  end

  def display_all_contacts
  p Contact.all
 end

  def search_by_attribute
    puts "enter the attribute you are searching"
    a = gets.chomp
    puts "enter the value you are searching"
    b= gets.chomp
    p Contact.find_by(a,b)
  end

 
end

     at_exit do
    ActiveRecord::Base.connection.close
      end

a = CRM.new
a.main_menu
