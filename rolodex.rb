class Rolodex
  attr_reader :contacts
  @@index = 1000

  def initialize
    @contacts = []
  end

  def add_contact(contact)
    contact.id = @@index
    @contacts << contact
    @@index += 1
  end

  def find(id) #search method to be reused in several other methods.
    # .select returns specific contact as a new array and .first returns it as an object.
    @found = @contacts.select{|contact| contact.id == id }.first 
  end
end