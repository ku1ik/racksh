# -*- encoding: utf-8 -*-
require File.join(File.dirname(__FILE__), "lib", "racksh", "version.rb")

Gem::Specification.new do |s|
  s.name = %q{racksh}
  s.version = "" + Rack::Shell::VERSION
  s.platform = Gem::Platform::RUBY
  s.date = %q{2010-02-01}
  s.authors = ["Marcin Kulik"]
  s.email = %q{marcin.kulik@gmail.com}
  s.has_rdoc = false
  s.homepage = %q{http://github.com/sickill/racksh}
  s.summary = %q{Console for any Rack based ruby web app}
  s.executables = ["racksh"]
  s.files = Dir["bin/*"] + Dir["lib/**/*.rb"] + ["README.markdown", "CHANGELOG.txt"]
  s.add_dependency 'rack', '>= 1.0'
  s.add_dependency 'rack-test', '>= 0.5'
end
