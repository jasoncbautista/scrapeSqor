require 'net/http'

require "json"



 currentOffset = 0
 $ii = 0
 $max = 70
 # max = 22

 sport = "nba"
 $playerCount = 0
 begin
     File.open(sport + ".json", 'w') { |file| 

        file.write(' {"' + sport + '": [')
        while $ii < $max do
            response = Net::HTTP.get_response("cms-dev.sqor.com","/rest/sports/players/?sport="  + sport + "&offset=" + currentOffset.to_s)
            currentOffset = currentOffset + 25;
            arrayName = "offsets['" + currentOffset.to_s + "'] = ";
            # puts response.body

            json = response.body
            parsed = JSON.parse(json)

            parsed['rows'].each do  |row|
                if $playerCount != 0 
                    file.write(",")
                end
                $playerCount = $playerCount + 1
                # p row.to_json
                player = {}
                player["id"] = row["id"]
                player["first_name"] = row["first_name"]
                player["last_name"] = row["last_name"]
                file.write(player.to_json)
            end

            $ii = $ii +  1

        end
        file.write(" ]} ")
     }
     puts $playerCount

 rescue
     p 'error'
 ensure
 end


