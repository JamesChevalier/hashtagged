class TwitterSearch
  SEARCH_URL = 'https://twitter.com/search?q=%23'

  def self.url_for(search_term)
    "#{SEARCH_URL}#{search_term}"
  end
end
