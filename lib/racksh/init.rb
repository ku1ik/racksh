require 'rack'

module Rack
  module Shell
    def self.start!
      # build Rack app
      config_ru = ENV['CONFIG_RU'] || 'config.ru'
      rack_app = Object.class_eval("Rack::Builder.new { #{::File.read(config_ru)} }")
      $rack = Rack::Shell::Session.new(rack_app)
      
      # print startup info
      if STDOUT.tty? && ENV['TERM'] != 'dumb' # we have color terminal, let's pimp our info!
        env_color = ($rack.env == 'production' ? "\e[31m\e[1m" : "\e[36m\e[1m")
        puts "\e[32m\e[1mRack\e[0m\e[33m\e[1m::\e[0m\e[32m\e[1mShell\e[0m v#{VERSION} started in #{env_color}#{$rack.env}\e[0m environment."
      else
        puts "Rack::Shell v#{VERSION} started in #{$rack.env} environment."
      end
    rescue Errno::ENOENT => e
      if e.message =~ /config\.ru$/
        puts "Rack::Shell couldn't find #{config_ru}"
        exit(1)
      else
        raise e
      end
    end
  end
end
