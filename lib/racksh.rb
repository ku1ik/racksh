ENV['RACK_ENV'] ||= 'development'

def use(*args, &blk); end
def run(*args, &blk); end
def map(*args, &blk); end

config_ru = ENV['CONFIG_RU'] || 'config.ru'

begin
  load config_ru
  version = File.read(File.join(File.dirname(__FILE__), '..', 'VERSION'))
  puts "Rack::Shell v#{version} started in #{ENV['RACK_ENV']} environment."
rescue LoadError => e
  if e.message =~ /config\.ru$/
    puts "Rack::Shell couldn't find #{config_ru}"
    exit(1)
  else
    raise e
  end
end