
=begin 
sample data format 

{
   "destination_addresses" : [ "Hubballi, Karnataka, India" ],
   "origin_addresses" : [ "Bengaluru, Karnataka, India" ],
   "rows" : [
      {
         "elements" : [
            {
               "distance" : {
                  "text" : "410 km",
                  "value" : 410369
               },
               "duration" : {
                  "text" : "6 hours 9 mins",
                  "value" : 22158
               },
               "status" : "OK"
            }
         ]
      }
   ],
   "status" : "OK"
}
=end 

require 'httparty'
require 'JSON'

url = "http://maps.googleapis.com/maps/api/distancematrix/json?mode=driving&language=en-EN"

puts "Enter the origin"
origin = gets.chomp

puts "Enter the destination"
destination = gets.chomp

response = HTTParty.get("#{url}&origins=#{origin}&destinations=#{destination}")
result = JSON.parse(response.body)

#elements = result["rows"][0]["elements"][0]

puts "The distance from #{result["origin_addresses"].join(", ")} to #{result["destination_addresses"].join(", ")} is #{result["rows"][0]["elements"][0]["distance"]["text"]} the travel time is #{result["rows"][0]["elements"][0]["duration"]["text"]}"

#puts elements["duration"]["text"]
