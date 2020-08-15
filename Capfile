# frozen_string_literal: true

require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git
require 'capistrano/rails'
require 'capistrano/passenger'
require 'capistrano/rvm'

set :rvm_type, :mnr # Defaults to: :auto
set :rvm_ruby_version, '2.6.6' # Defaults to: 'default'
set :rvm_custom_path, '~/.rvm' # only needed if not detected

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
