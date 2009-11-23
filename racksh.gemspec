# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{racksh}
  s.version = "0.9.4.2"
  s.platform = Gem::Platform::RUBY
  s.date = %q{2009-11-23}
  s.authors = ["Marcin Kulik"]
  s.email = %q{marcin.kulik@gmail.com}
  s.has_rdoc = false
  s.homepage = %q{http://github.com/sickill/racksh}
  s.summary = %q{Console for any Rack based ruby web app}
  s.executables = ["racksh"]
  s.files = [ "bin/racksh", "lib/racksh/boot.rb", "lib/racksh/init.rb", "lib/racksh/session.rb", "lib/racksh/version.rb", "README.markdown" ]
  s.add_dependency 'rack', '>= 1.0'
  s.add_dependency 'rack-test', '>= 0.5'
end
