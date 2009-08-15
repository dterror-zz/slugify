require 'rake'
require "spec/rake/spectask"
require 'echoe'

desc 'Default: run the spec'
task :default => :spec

Echoe.new('resource_identifier', '0.1.0') do |p|
  p.summary = "Have trully beautiful URLS in your Rails RESTful routes"
  p.description = "An ActiveRecord plugin that allows you to specify a different table identifier (AR's default is the :id field)."
  p.url = 'http://github.com/dterror/resource_identifier/'
  p.author = 'Diogo Terror'
  p.email = 'ranccis@gmail.com'
  p.development_dependencies = []
end

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.spec_opts = ["-c", "-fs"]
end