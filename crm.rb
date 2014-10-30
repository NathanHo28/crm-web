require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

$rolodex = Rolodex.new

$rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

get '/' do  #route
	@crm_app_name = "My CRM"
	erb :index
end

# get '/layout' do 
# 	erb :layout => :layout
# end

get '/square/:number' do
	@square = params[:number].to_i**2
end

get "/contacts" do 
	@contacts = []
	@contacts << Contact.new("Nathan", "Ho", "nathan.ho28@gmail.com", "Student")
	# @contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
	# @contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")
	erb :contacts
end

get '/contacts/new' do 
	erb :new_contact
end

get '/contacts/modify' do
	erb :modify_contact
end

get '/contacts/search' do
	erb :search_contact
end

get 'contacts/delete' do
	erb :delete_contact
end

get "/contacts/:index" do
  @contact = $rolodex.find(params[:index].to_i)
  if @contact 
  	erb :show_contact
  else
  	raise Sinatra::NotFound
  end
end

get '/help' do
	erb :help
end

post '/contacts' do
  # puts params
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to ('/contacts')
end

get '/array' do
	@my_array = [12, 15, 18, 10]
end



