require 'sinatra'

get '/' do 
	erb :splash
end

get '/contact' do
	erb :contact
end