require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'	# database config
require './models/model'	# model class

# So... this web server accepts three urls:
# ex.com/				=> form where user can add a record
# ex.com/submit (POST)	=> form contents submitted, new record created
# ex.com/models			=> displays list of models

get '/' do
	erb :index
end

post '/submit' do
	@model = Model.new(params[:model])
	if @model.save
		redirect '/models'
	else
		"Sorry, there was an error!"
	end
end

get '/models' do
	@models = Model.all
	erb :models
end
