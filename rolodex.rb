class Rolodex
  attr_reader :contacts
  @@index = 1000

  def initialize
    @contacts = []
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end
end