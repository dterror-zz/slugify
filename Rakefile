require 'rake'
require "spec/rake/spectask"
require 'echoe'

desc 'Default: run the spec'
task :default => :spec

Echoe.new('slugify', '0.1.0') do |p|
  p.summary = "Generates a slug - a URI compliant string - based on an attribute you specify."
  p.description = "An ActiveRecord plugin generates a slug based on another attribute you specify"
  p.url = 'http://github.com/dterror/slugify/'
  p.author = 'Diogo Terror'
  p.email = 'ranccis@gmail.com'
  p.development_dependencies = []
end

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.spec_opts = ["-c", "-fs"]
end