require 'net/http'

require "json"



 currentOffset = 0;
 $ii = 0
 $max = 5
 # max = 22

 begin
     File.open("nba.json", 'w') { |file| 

        file.write(" { rows: [")
        while $ii < $max do
            if $ii != 0 
                file.write(",")
            end

            response = Net::HTTP.get_response("cms-dev.sqor.com","/rest/sports/players/?sport=nba&offset=" + currentOffset.to_s)
            currentOffset = currentOffset + 25;
            arrayName = "offsets['" + currentOffset.to_s + "'] = ";
            # puts response.body

            #json = response.body
            parsed = JSON.parse(json)

            parsed['rows'].each do  |row|
                # p row.to_json
                file.write(row.to_json)
            end

            $ii = $ii +  1

        end
        file.write(" ]} ")
     }

 rescue
     p 'error'
 ensure
 end


