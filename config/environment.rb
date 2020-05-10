# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.initialize!

# Mail Gun Configuration

ActionMailer::Base.smtp_settings = {
  :port => ENV['MAILGUN_SMTP_PORT'],
  :address => ENV['MAILGUN_SMTP_SERVER'],
  :user_name => ENV['MAILGUN_SMTP_LOGIN'],
  :password => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain => 'cdc-on-rails.herokuapp.com',
  :authentication => :plain,
  } 
  ActionMailer::Base.delivery_method = :smtp
