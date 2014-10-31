class Rolodex
  attr_reader :contacts
  @@id = 1000

  def initialize
    @contacts = []
  end

  def add_contact(contact)
    contact.id = @@id
    @contacts << contact
    @@id += 1
  end

  def delete_contact(contact)
    @contacts.delete(contact)
  end

  def find(id) #search method to be reused in several other methods.
    # .select returns specific contact as a new array and .first returns it as an object.
    @found = @contacts.select{|contact| contact.id == id }.first 
  end
end