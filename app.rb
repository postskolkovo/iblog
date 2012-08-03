require "bundler/setup"
require 'sinatra'
require 'slim'

get '/' do
   slim :index
end


post '/' do
    require 'pony'
    Pony.mail(
      from: "mail@yegorov.info",
      to: 'nickolay@yegorov.info',
      subject: "A message from the yegorov.info",
      body: params[:message],
      port: '587',
      via: :smtp,
      via_options: { 
        :address              => 'smtp.sendgrid.net', 
        :port                 => '587', 
        :enable_starttls_auto => true, 
        :user_name            => ENV['SENDGRID_USERNAME'], 
        :password             => ENV['SENDGRID_PASSWORD'], 
        :authentication       => :plain, 
        :domain               => 'heroku.com'
      })
    redirect '/' 
end