require 'sinatra'
require 'twitter'

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
  hashtag_list = []
  timeline.each { |tweet| tweet.hashtags.each { |tag| hashtag_list << tag.text } unless tweet.hashtags.empty? }

  @hashtags = []
  hashtag_list.uniq.each do |tag|
    @hashtags << { text: tag,
                   weight: hashtag_list.grep(tag).size,
                   link: { href: "https://twitter.com/search?q=%23#{tag}", target: '_blank', title: "#{tag}" } }
  end
  @hashtags = @hashtags.to_json

  erb :hashtags
end
