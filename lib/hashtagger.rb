class Hashtagger
  def initialize(user_name, twitter_client)
    @user_name      = user_name
    @twitter_client = twitter_client
  end

  def hashtags
    hashtag_list.uniq.map { |tag|
      {
        text: tag,
        weight: hashtag_list.count(tag),
        link: { href: TwitterSearch.url_for(tag), target: '_blank', title: tag }
      }
    }.to_json
  end

  private

    attr_reader :user_name, :twitter_client

    def hashtag_list
      @hashtag_list ||= tweets.map { |tweet| tweet.hashtags.map(&:text) }.flatten
    end

    def tweets
      @twitter_client.user_timeline(user_name, { count: 200, include_entities: true })
    end
end
