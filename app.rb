require 'sinatra/base'
require 'resque'
require 'redis'
require 'slim'
require './api_mailer'

class Locotor < Sinatra::Base
  get "/" do
    slim :index
  end

  post "/" do
    email_address = params["from"]
    text = params["text"]

    origin = text.lines.first.strip
    destination = text.lines.last.strip

    puts "origin: #{origin}"
    puts "destination: #{destination}"
    puts "email_address: #{email_address}"

    Resque.enqueue(APIMailer, email_address, origin, destination)
  end
end
