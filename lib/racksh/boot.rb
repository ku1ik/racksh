dir = File.expand_path(File.dirname(__FILE__))
%w(session version init).each { |f| require File.join(dir, f) }
Rack::Shell.start!
