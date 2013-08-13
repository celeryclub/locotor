require 'rack-rewrite'
require 'resque/server'
require './app'

run Rack::URLMap.new \
  "/"       => Locotor.new,
  "/resque" => Resque::Server.new

use Rack::Rewrite do

  # Redirect from Heroku subdomain and remove www
  r301 %r{.*}, "http://locotor.com$&", :if => Proc.new { |rack_env| rack_env['SERVER_NAME'] == 'locotor.herokuapp.com' || rack_env['SERVER_NAME'] == 'www.locotor.com' }

  # Strip trailing slashes
  r301 %r{^/(.*)/$}, '/$1'

end
