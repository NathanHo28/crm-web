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
end