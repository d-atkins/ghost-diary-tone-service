require "./controllers/tone_app"
require "rack/test"
require "rspec-html-matchers"
require 'rspec'
require 'simplecov'

SimpleCov.start

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include RSpecHtmlMatchers
  config.mock_with :rspec
end

RSpec::Matchers.define(:redirect_to) do |url|
  match do |response|
    response.status == 302 && response.headers['Location'] == url
  end
end
