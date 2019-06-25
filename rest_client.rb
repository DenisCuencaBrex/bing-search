require 'rest-client'
require 'nokogiri'

class BingSearch

  def initialize(string_query)
    @string_query = string_query
  end

  def response
    @response ||=  RestClient.get 'http://bing.com/search', {params: {q: @string_query}}
  end

  def process_results
    display("Response Code: #{response.code}")
    display("Response Cookies: \n #{response.cookies}")
    display("Response Headers: \n #{response.headers}")
    parse_result(response.body)
  end

  def parse_result(string)
    display("Response Body:")
    Nokogiri::HTML(string).css('ol h2 a').each_with_index do |node, index|
      display("[#{index + 1}] #{node.content} \n #{node.attr('href')} \n\n")
    end
  end
  
  private

  def display(string)
    puts string
  end

end

puts "Enter a search: "
search_string = gets.chomp
search_bing = BingSearch.new(search_string)
search_bing.process_results

