#https://www.codewars.com/api/v1/code-challenges/:id_or_slug

require "httparty"
require "JSON"
#require "pp"

url = "https://www.codewars.com/api/v1/code-challenges/"

puts "Enter the slug"
slug = gets.chomp

response = HTTParty.get("#{url}#{slug}")

result = JSON.parse(response.body)

#pp result

if response["success"] == false
	puts "This kata is #{response["reason"]}"
else

    puts "Name: #{result["name"]}" 
    languages = result["languages"].map! {|language| language.capitalize!}.join(", ")
    puts "Language: #{languages}"
    puts "Url: #{result["url"]}" 
    puts "Created By: #{result["createdBy"]["username"]}" 
    puts "Description: #{result["description"]}"
    puts "Total Attempts: #{result["totalAttempts"]}" 
    puts "Tags: #{result["tags"].join(", ")}"
end

