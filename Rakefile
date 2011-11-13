require 'rubygems'
require 'rake'
require 'rubygems/package_task'

task :default => [:repackage]

spec = eval(File.read('racksh.gemspec'))

Gem::PackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end
