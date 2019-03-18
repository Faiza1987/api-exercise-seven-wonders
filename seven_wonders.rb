require "httparty"
require "ap"
require "json"

#Starter Code:
seven_wonders = ["Great Pyramid of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Pharos of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

key = "731aa2c61a09ed"
BASE_URL = "https://us1.locationiq.com/v1/search.php"

seven_wonders_locations = seven_wonders.map do |wonder|
  query_parameters = {
    key: key,
    q: wonder,
    format: "json",
  }

  sleep(1)

  response = HTTParty.get(BASE_URL, query: query_parameters)
end

# puts seven_wonders_locations[0][0]["lat"]
seven_wonders_hash = {}
seven_wonders_locations.each do |wonder|
  wonder.each do |wonder_at|
    seven_wonders.each do |wonder_name|
      seven_wonders_hash[wonder_name] = { "lat" => wonder_at["lat"], "lon" => wonder_at["lon"] }

      # puts "Name: #{wonder_at["display_name"]}"
      # puts "Latitude: #{wonder_at["lat"]}"
      # puts "Longitude: #{wonder_at["lon"]}"

    end
  end
end

# puts "#{seven_wonders_locations}"
puts "#{seven_wonders_hash}"

#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Pharos of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}
