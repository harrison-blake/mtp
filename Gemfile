source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.8"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "faraday"
gem "vcr"
gem "webmock"
gem "openssl"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem 'rspec-rails', '~> 6.0.0'
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
end


gem "byebug", "~> 11.1", :groups => [:development, :test]
