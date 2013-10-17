require 'sinatra'
require 'pony'

Pony.options = {
  :to => 'bhaity@gmail.com',
  :from => 'village.green.west.mailer@gmail.com',
  :headers => { 'Content-Type' => 'text/html' },
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => 'village.green.west.mailer@gmail.com',
    :password             => '245w14st',
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
  Pony.mail :subject => "Mott St. | New Enquiry Received",
            :body    => erb(:email)
end