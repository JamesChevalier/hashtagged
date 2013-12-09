require 'sinatra'
require 'twitter'
Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each { |file| require file }

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/hashtags' do
    @user_name = params[:user_name]
    @hashtags  = Hashtagger.new(@user_name, twitter_client).hashtags
    erb :hashtags
  end

  private

    def twitter_client
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
    end
end
