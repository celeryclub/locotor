require 'sinatra/base'
require 'resque'
require 'slim'
require_relative 'api_mailer'

class Locotor < Sinatra::Base

  configure do
    uri = URI.parse(ENV["REDISTOGO_URL"] || 'redis://root:password@127.0.0.1:6379/')
    Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
    Resque.redis.namespace = "resque:locotor"
    set :redis, ENV["REDISTOGO_URL"]
  end

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
