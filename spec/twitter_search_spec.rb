require_relative 'spec_helper'

describe 'TwitterSearch' do
  let(:search_term) { 'baxter' }

  it 'returns the correct Twitter search url' do
    result = TwitterSearch.url_for(search_term)
    expect(result).to eq("https://twitter.com/search?q=%23#{search_term}")
  end
end
