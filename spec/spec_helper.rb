ENV["SESSION_SECRET"] = "abcdefghjij"
ENV["HEROKU_OAUTH_ID"] = "12345"
ENV["HEROKU_OAUTH_SECRET"] = "klmnopqrstu"

require "rubygems"
require "bundler"
Bundler.setup(:default, :test)
require "omniauth/strategies/heroku"

require "cgi"
require "rspec"
require "rack/test"
require "sinatra"
require "webmock/rspec"

Dir["./spec/support/*.rb"].each { |f| require f }

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.expect_with :minitest

  def app
    TestApp
  end
end