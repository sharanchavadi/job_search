require 'httparty'
require 'JSON'

url = "http://api.indeed.com/ads/apisearch?v=2&format=json&co=in&limit=25"
publisher_id = "7277146494571922"

url += "&publisher=#{publisher_id}"

puts "Enter technology"
tech = gets.chomp

puts "Enter location"
location = gets.chomp

response = HTTParty.get("#{url}&q=#{tech}&l=#{location}")

result = JSON.parse(response.body)
jobs = result["results"]
puts "Total Results : #{result["totalResults"]}"
jobs.each do |job|
	puts "#{job["jobtitle"]} - #{job["company"]} - #{job["snippet"]}"
	puts "-" * 50
end