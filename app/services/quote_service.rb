require 'open-uri'
class QuoteService
  def initialize
    @base_url = 'http://quotes.toscrape.com/tag/'    
  end

  def find_by_tag(tag)    
    quotes = Quote.all_in(tags: [tag])   
    if quotes.count < 10
      url = @base_url << tag    
      doc = Nokogiri::HTML(open(url))
      http_quotes = doc.css('div.quote')    
      http_quotes.each do |http_quote|
        local_quote = http_quote.css('span.text').text.delete("“" "”")      
        exists = quotes.select {|q| q.quote == local_quote}.any?
        if !exists
          quote = Quote.new
          quote.quote = local_quote
          quote.author = http_quote.css('small.author').text
          quote.author_about = http_quote.css('a')[0]['href']
          quote.tags = http_quote.css('div.tags').css('meta.keywords')[0].attributes['content'].value.split(',')
          quote.save
          quotes << quote
          break if quotes.count == 10
        end
      end
    end
    quotes  
  end
end