require 'httparty'
require 'json'
require 'nokogiri'
require 'mail'

class APIMailer

  @queue = :jobs

  def self.perform(email_address, origin, destination)

    api_query_string = URI.encode("http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&region=us&sensor=false&mode=walking")

    response = HTTParty.get(api_query_string)
    api_hash = JSON.parse(response.body)
    request_status = api_hash["status"]

    directions_message = if request_status == "OK"
      steps = api_hash["routes"].first["legs"].first["steps"]
      steps_with_time = steps.map do |step|
        instructions = Nokogiri::HTML(step["html_instructions"]).inner_text
        duration = step["duration"]["text"]
        "#{instructions} (#{duration})"
      end
      steps_with_time.join("\n")
    else
      request_status
    end

    Mail.defaults do
      delivery_method :smtp, {
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :domain => 'locotor.com',
        :address => 'smtp.sendgrid.net',
        :port => 587,
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    end

    mail_success = Mail.deliver do
      to email_address
      from 'directions@locotor.com'
      body directions_message
    end

    if mail_success
      puts "Delivered directions to #{email_address}"
    else
      puts "ERROR: Unable to deliver directions to #{email_address}"
    end

  end

end
