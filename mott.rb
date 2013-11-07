require 'sinatra'
require 'pony'

Pony.options = {
  :from => 'info@199mott.com',
  :headers => { 'Content-Type' => 'text/html' },
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => 'info@199mott.com',
    :password             => '199mottst',
    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
  }
}


get '/' do 
	erb :splash
end

get '/contact' do
	erb :contact
end

post '/mail_to' do
  Pony.mail :subject => "Mott St. | New Inquiry Received",
            :body    => erb(:email),
            :to => params["Email Address"],
            :bcc => 'info@199mott.com'
end