require_relative 'spec_helper'

describe 'Hashtagger' do
  let(:tag_text) { 'baxter' }

  it 'returns an array of unique hashtags' do
    user_name = 'RonBurgundy'
    result    = Hashtagger.new(user_name, stubbed_client).hashtags

    expect(result).to eq(
      [
        {
          text: tag_text,
          weight: 1,
          link: { href: TwitterSearch.url_for(tag_text), target: '_blank', title: tag_text }
        }
      ].to_json
    )
  end

  def stubbed_client
    hashtag = double(text: tag_text)
    tweet   = double(hashtags: [hashtag])
    client  = double(user_timeline: [tweet])
  end
end
