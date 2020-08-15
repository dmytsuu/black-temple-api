# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'capistrano', '~> 3.11'
gem 'capistrano-passenger', '~> 0.2.0'
gem 'capistrano-rails', '~> 1.4'
gem 'capistrano-rails-logs-tail'
gem 'capistrano-rvm'
gem 'mysql2', '>= 0.4.4'
gem 'rack-cors'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'

group :development, :test do
  gem 'awesome_print'
  gem 'pry'
  gem 'puma'
  gem 'rubocop'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'passenger', '~> 6.0', group: :production
