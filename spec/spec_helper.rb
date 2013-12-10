require 'coveralls'
Coveralls.wear!
ENV['RACK_ENV'] = 'test'
require_relative '../app'
require 'rspec'
require 'rack/test'

module RSpecMixin
  include Rack::Test::Methods
  def app() App end
end

RSpec.configure { |c| c.include RSpecMixin }
