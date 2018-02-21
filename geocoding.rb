#https://maps.googleapis.com/maps/api/geocode/json?
#url = "https://maps.googleapis.com/maps/api/geocode/json?address=Adigas Jayanagar"

require "httparty"
require "JSON"

url = "https://maps.googleapis.com/maps/api/geocode/json?"


businesses = ["Dct Academy", "Star Bucks Indiranagar", "Bangalore Central JP Nagar", "Manyata Tech Park"]

businesses.each do |business|
  response = HTTParty.get("#{url}address=#{business}")
  result = JSON.parse(response.body)
  puts business
  puts "Address: #{result["results"][0]["formatted_address"]}"
  puts "Lat: #{result["results"][0]["geometry"]["location"]["lat"]}"
  puts "lng: #{result["results"][0]["geometry"]["location"]["lng"]}"
  puts "\n"
end
