require 'sinatra' 
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/model' 



get '/'  do
	"Hello World!" 
end

get '/submit' do
	@model = Model.new(params[:model])
	if @model.save
		redirect '/models'
	else
		"Sorry, there was an error" 
	end
end
get '/models' do
	@models = Model.all
	erb :models
end
