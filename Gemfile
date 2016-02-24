source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# I don't like front-end so what better way to escape than bootstrap-sass
gem 'bootstrap-sass', '~> 3.3.6'
# Need it for authentication and session management
gem 'devise', '~> 3.5.6'
# Best way to handle dependencies
gem 'bower-rails'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Do need testing and what better than rails
  gem 'rspec-rails'
  # AngularJS project so I am gonna put in jasmine too
  gem 'jasmine-rails'
  # Static code check
  gem 'rubocop', require: false
  # Coverage of specs
  gem 'simplecov', require: false
end

group :production do
  # For Postgres Config
  gem 'pg'
end
