FestivalAdmin::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "mail.rockmotrus.no",
    :port                 => 25,
    :domain               => 'rockmotrus.no',
    :user_name            => 'festival@rockmotrus.no',
    :password             => '***REMOVED***',
    :authentication       => 'plain',
    :enable_starttls_auto => false
  }
 
  # Expands the lines which load the assets
  config.assets.debug = true

  config.eager_load = false

  Paperclip.options[:command_path] = "/opt/local/bin/"

  Cocaine::CommandLine.runner = Cocaine::CommandLine::BackticksRunner.new
end

