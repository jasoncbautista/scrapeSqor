# JSON Parsing example
require "rubygems"
require "json"

string = '{"desc":{"someKey":"someValue","anotherKey":"value"},"main_item":{"stats":{"a":8,"b":12,"c":10}}}'
parsed = JSON.parse(string) # returns a hash

p parsed["desc"]["someKey"]
p parsed["main_item"]["stats"]["a"]

# Read JSON from a file, iterate over objects
file = open("nba.json")
json = file.read

parsed = JSON.parse(json)

parsed["rows"].each do |player|
      p player['id']
      p player['first_name']
      p player['last_name']

end

# sudo gem install json
