# Bookmarks

[![Build Status](https://travis-ci.org/Amay22/Bookmarks.svg?branch=master)](https://travis-ci.org/Amay22/Bookmarks)
[![Code Climate](https://codeclimate.com/github/Amay22/Bookmarks/badges/gpa.svg)](https://codeclimate.com/github/Amay22/Bookmarks)


Bookmark Manager Devise Authentication and AngularJS.

Work in Progress.

A bookmark Manager that runs completely on Angular JS inlcuding the authentication.

Currently User can only Register and Login and create sessions. Cannot edit their details.

Bookmarks can be Added Edited or deleted.

Will be updated soon for RSpec Testing and Jasmine for JS.

Also I have used Asset pipeline using bower.

All the JS files are in Coffee for better coding and stylesheets are in Sass.

## Installation

```sh
$ bundle install
```

## Database Setup

```sh
$ rake db:migrate
```
## Database Setup

```sh
$ rails s
```

Toolchain Setup

```ruby
gem 'bower-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'jasmine-rails'
end
```

### Commands

```sh
$ bundle install
$ rails g rspec:install
$ rails g jasmine_rails:install
$ rake bower:install:deployment
```

## Rakefile

Coming Soon