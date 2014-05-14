require 'rack-rewrite'
require 'resque/server'
require './app'

uri = URI.parse(ENV["REDISTOGO_URL"] || 'redis://localhost:6379/')
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Resque.redis.namespace = "resque:locotor"
# set :redis, ENV["REDISTOGO_URL"]

run Rack::URLMap.new \
  "/"       => Locotor.new,
  "/resque" => Resque::Server.new

use Rack::Rewrite do

  # Redirect from Heroku subdomain and remove www
  r301 %r{.*}, "http://locotor.com$&", :if => Proc.new { |rack_env| rack_env['SERVER_NAME'] == 'locotor.herokuapp.com' || rack_env['SERVER_NAME'] == 'www.locotor.com' }

  # Strip trailing slashes
  r301 %r{^/(.*)/$}, '/$1'
end
