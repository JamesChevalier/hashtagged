require 'sinatra'
require 'twitter'
Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each { |file| require file }

get '/' do
  erb :index
end

post '/hashtags' do
  @user_name = params[:user_name]
  client     = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
  end

  timeline     = client.user_timeline(@user_name, { count: 200, include_entities: true })
  hashtag_list = timeline.map { |tweet| tweet.hashtags.map(&:text) }.flatten
  @hashtags    = hashtag_list.uniq.map { |tag|
    { text: tag,
      weight: hashtag_list.count(tag),
      link: { href: "https://twitter.com/search?q=%23#{tag}", target: '_blank', title: "#{tag}" } }
  }.to_json

  erb :hashtags
end
