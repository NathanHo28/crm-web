require 'sinatra'

get '/' do  #route
	@crm_app_name = "My CRM"
	erb :index
end