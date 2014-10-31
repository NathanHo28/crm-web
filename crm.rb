require_relative 'rolodex'

require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
	include DataMapper::Resource 

	property :id, Serial 
	property :first_name, String 
	property :last_name, String 
	property :email, String 
	property :note, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do  #route
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts/new' do 
	erb :new_contact
end

get "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact 
   	erb :show_contact
  	# @contact.first_name = params[:first_name]
  	#  @contact.last_name = params[:last_name]
  	#  @contact.email = params[:email]
  	#  @contact.note = params[:note]
    # redirect to("/contacts")
  else
  	raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
	@contact = $rolodex.find(params[:id].to_i)
	if @contact
		@contact.first_name = params[:first_name]
		@contact.last_name = params[:last_name]
		@contact.email = params[:email]
		@contact.note = params[:note]	

		redirect to("/contacts")	
	else
		raise Sinatra::NotFound
	end
end

delete "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    $rolodex.delete_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/modify' do
	@contact = $rolodex.find(params[:id].to_i)
	if @contact
		erb :modify_contact
	else
		raise Sinatra::NotFound
	end
end

get "/contacts" do 
	# @contacts = []
	# @contacts << Contact.new("Nathan", "Ho", "nathan.ho28@gmail.com", "Student")
	# @contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
	# @contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")
	erb :contacts
end

post '/contacts' do
  # puts params
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to ('/contacts')
end

# get '/layout' do 
# 	erb :layout => :layout
# end

# get '/square/:number' do
# 	@square = params[:number].to_i**2
# end

get '/help' do
	erb :help
end
