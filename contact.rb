gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'
ActiveRecord::Base.establish_connection(adapter:'sqlite3', database:'crm.sqlite3')

class Contact < ActiveRecord::Base

  
    field :first_name, as: :string
    field :last_name,  as: :string
    field :email,      as: :string
    field :note,       as: :text
  
    def full_name
       return "#{first_name}  #{last_name}"
    end
end
Contact.auto_upgrade!


 
#   sarah=Contact.create("Sara", "Imeinu", "sara@gmail.com", "best person ever")
#   chana=Contact.create("Chana", "Imeinu", "chana@gmail.com", "made se")
#   # p Contact.find 2
#   # sarah.update("first_name", "Sarah")
#   # # sarah.update("last_name", "Sarah")
#   # # sarah.update("email", "Sarah")
#   # # sarah.update("note", "Sarah")
#   # p Contact.find_by(@last_name, "Imeinu")
  
  
#   Contact.delete_all
#   p  sarah
  
#   p Contact.all
  
#   p Contact.find 2