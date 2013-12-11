# JSON Parsing example
require "rubygems"
require "json"
require 'nokogiri'
require 'open-uri'



def getWikiLink(playerName, playerLastName, league)

    
    searchString =  playerLastName + "+"  + playerName + "+" + league +'+site:en.wikipedia.org'

    puts searchString

    doc = Nokogiri::HTML(open('https://www.google.com/search?q=' + searchString, "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9) AppleWebKit/537.71 (KHTML, like Gecko) Version/7.0 Safari/537.71"))


    ####
    # Search for all the fighters in the page
    links = doc.css('.r a')


    wikiLink = links.first['href']


    puts wikiLink


    return wikiLink
end

league = "nba"
# Read JSON from a file, iterate over objects
 file = open("nba.json")
 json = file.read
 
 parsed = JSON.parse(json)
 
 parsed["rows"].each do |player|
       p player['id']
       id = player['id']
       firstName =  player['first_name']
       lastName = player['last_name']
       r = Random.new
       secs = r.rand(40...92)
       getWikiLink(firstName, lastName, league)
       puts secs
       sleep(secs)
 end
 
# sudo gem install json
