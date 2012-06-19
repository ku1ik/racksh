require 'rack'

ENV['RACK_ENV'] ||= 'development'
ENV['CONFIG_RU'] ||= 'config.ru'

dir = File.expand_path(File.dirname(__FILE__))
%w(session version init).each { |f| require File.join(dir, f) }

def reload!
  puts "Rack::Shell reloading..."
  ENV['RACKSH_SKIP_INTRO'] = "1"
  exec $0
end

module Rack
  module Shell
    File = ::File

    def self.init
      config_ru = ENV['CONFIG_RU']

      # build Rack app
      rack_app = Rack::Builder.parse_file(config_ru).first
      $rack = Rack::Shell::Session.new(rack_app)

      # run ~/.rackshrc
      rcfile = File.expand_path("~/.rackshrc")
      eval(File.read(rcfile)) if File.exists?(rcfile)

      # run local .rackshrc (from app dir)
      rcfile = File.expand_path(File.join(File.dirname(config_ru), ".rackshrc"))
      eval(File.read(rcfile)) if File.exists?(rcfile)

      # print startup info
      unless ENV['RACKSH_SKIP_INTRO']
        if STDOUT.tty? && ENV['TERM'] != 'dumb' # we have color terminal, let's pimp our info!
          env_color = ($rack.env == 'production' ? "\e[31m\e[1m" : "\e[36m\e[1m")
          puts "\e[32m\e[1mRack\e[0m\e[33m\e[1m::\e[0m\e[32m\e[1mShell\e[0m v#{VERSION} started in #{env_color}#{$rack.env}\e[0m environment."
        else
          puts "Rack::Shell v#{VERSION} started in #{$rack.env} environment."
        end
        @reloaded = true
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
