#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
Rottenpotatoes::Application.load_tasks
require 'rspec/core/rake_task'
task(:default).clear
task :default => :spec
RSpec::Core::RakeTask.new
