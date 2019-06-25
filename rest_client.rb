require 'rest-client'

class BingSearch

    def initialize(string_query)
      @string_query = string_query
    end

    def response
    @response ||=  RestClient.get 'http://bing.com/search', {params: {q: @string_query}}
    end

    def display_results
        puts "Response Code: #{response.code}"

        puts "Response Cookies:"
        puts "#{response.cookies}"

        puts "Response Headers:"
        puts "#{response.headers}"

        puts "Response Body:"
        puts "#{response.body}"
    end
  
end

puts "Enter a search: "
search_string = gets.chomp
search_bing = BingSearch.new(search_string)
search_bing.display_results

