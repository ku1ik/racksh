require 'rubygems'
dir = File.join(File.expand_path(File.dirname(__FILE__)), 'racksh')
%w(session version init).each { |f| require File.join(dir, f) }

Rack::Shell.start!
