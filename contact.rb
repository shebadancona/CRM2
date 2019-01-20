gem 'activerecord', ='4.2.10'
require 'active_record'
require 'mini_record'
ActiveRecord::Basee.establish_connection(adapter:'sqlite3', database:'crm.sqlite3')

class Contact

    @@contact_list = []
    @@id = 1
    attr_reader :id
    attr_accessor :first_name, :last_name, :email, :note
  
  
    # This method should initialize the contact's attributes
    def initialize(first_name, last_name,email,note)
      @first_name = first_name
      @last_name = last_name
      @email = email
      @note = note
      @id = @@id
      @@id +=1
  
    end
  
    # This method should call the initializer, 
    # store the newly created contact, and then return it
    def self.create(first_name, last_name, email, note)
      new_contact = Contact.new(first_name, last_name, email, note)
      @@contact_list << new_contact
    return new_contact
    end
  
    # This method should return all of the existing contacts
    def self.all
      return @@contact_list
    end
  
    # This method should accept an id as an argument
    # and return the contact who has that id
    def self.find(id)
      @@contact_list.each do |x|
          if x.id == id
          return  x
          end
        end
    end
  
    # This method should allow you to specify 
    # 1. which of the contact's attributes you want to update
    # 2. the new value for that attribute
    # and then make the appropriate change to the contact
    def update(item, new_item)
        if item == "first_name"
          self.first_name = new_item
        elsif item == "last_name"
            self.last_name = new_item
        elsif item == "email"
          self.email = new_item
        elsif item == "note"
            self.note = new_item
        end
    end
  
    # This method should work similarly to the find method above
    # but it should allow you to search for a contact using attributes other than id
    # by specifying both the name of the attribute and the value
    # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
    def self.find_by(attribute, value)
      @@contact_list.each do |x|
        if attribute == 'first_name' && value == x.first_name
          return x
        elsif attribute == 'last_name' && value == x.last_name
          return x
        elsif attribute == 'email' && value == x.email
          return x
          elsif attribute == 'note' && value == x.note
         return  x
        end
      end
  
    end
  
    # This method should delete all of the contacts
    def self.delete_all
      @@contact_list = []
    end
  
    def full_name
       return "#{first_name}  #{last_name}"
    end
  
    # This method should delete the contact
    # HINT: Check the Array class docs for built-in methods that might be useful here
    def delete
  @@contact_list.delete(self)
    end
  
    # Feel free to add other methods here, if you need them.
  end
  
  sarah=Contact.create("Sara", "Imeinu", "sara@gmail.com", "best person ever")
  chana=Contact.create("Chana", "Imeinu", "chana@gmail.com", "made se")
  # p Contact.find 2
  # sarah.update("first_name", "Sarah")
  # # sarah.update("last_name", "Sarah")
  # # sarah.update("email", "Sarah")
  # # sarah.update("note", "Sarah")
  # p Contact.find_by(@last_name, "Imeinu")
  
  
  Contact.delete_all
  p  sarah
  
  p Contact.all
  
  p Contact.find 2