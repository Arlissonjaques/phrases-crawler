
class CrawlerService
  require 'open-uri'

  def initialize(tag)
    @tag = tag
    @base_url = 'http://quotes.toscrape.com/'
    @page = Nokogiri::HTML(open("#{@base_url}/tag/#{@tag}/"))
  end

  def run
    crawler if valid_tag?
  end

  private

  def valid_tag?
    message = @page.css('div.col-md-8')[1].text.strip
    message != 'No quotes found!'
  end

  def quote(element)
    element.css('span.text').inner_html
  end

  def author(element)
    {
      'name': element.css('small.author')[0].inner_html,
      'url': @base_url + element.css('small.author')[0]
        .next_element.attributes['href'].value
    }
  end

  def tags(element)
    element.css('meta.keywords')[0]
      .attributes['content']
      .value.split(',')
  end

  def crawler
    data_crawled = []
    elements_crawled = {}

    page_elements = @page.css('div.quote')

    page_elements.each do |element|
      elements_crawled[:author] = author(element)
      elements_crawled[:quote] = quote(element)
      elements_crawled[:tags] = tags(element)

      data_crawled << elements_crawled
    end
    data_crawled
  end
end
