require "rubygems"
require "rack"
require "rack/test"

ENV['RACK_ENV'] ||= 'development'

module Rack
  class Shell
    include Rack::Test::Methods
    attr_reader :app
    def initialize(app)
      @app = app
    end
  end
end

begin
  config_ru = ENV['CONFIG_RU'] || 'config.ru'
  rack_application = eval("Rack::Builder.new { #{File.read(config_ru)} }")
  $rack = Rack::Shell.new(rack_application)
  version = File.read(File.join(File.dirname(__FILE__), '..', 'VERSION')).strip
  puts "Rack::Shell v#{version} started in #{ENV['RACK_ENV']} environment."
rescue Errno::ENOENT => e
  if e.message =~ /config\.ru$/
    puts "Rack::Shell couldn't find #{config_ru}"
    exit(1)
  else
    raise e
  end
end
