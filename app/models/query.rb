class Query < ActiveRecord::Base
 before_save :find_restaurants

 	#Method below works to access venue information from FourSquare's API.
 	#API Documentation for the venue response can be found here: https://developer.foursquare.com/docs/responses/venue
	def find_restaurants
 		require 'foursquare2'
		client = Foursquare2::Client.new(:client_id => 'YSQG41AQAJQ1OORJNEKL100YNLT1WU1ANTZQIGMRBHWYRJ3E', :client_secret => 'D44KN20IQPAAF41HZVB0SOZPVQULSGRLZACCXKTZAUAURO0K', :api_version => '20120505')
		results = client.search_venues(:ll => '36.142064,-86.816086', :query => self.input).venues
		puts " #{results.length} Results for search term '#{self.input}' "
		total_results = []
		results.each do |venue|
			puts "Restaurant Name: #{venue.name}"
			puts "Address: #{venue.location.address}"
			total_results.push("#{venue.name} - #{venue.location.address}")
		end
		self.result = total_results.join(",")
 	 end
end
