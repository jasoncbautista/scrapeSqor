require 'net/http'




 currentOffset = 0;
 $ii = 0;
 $max = 23

 File.open("nba.json", 'w') { |file| 
    while $ii < $max do
        response = Net::HTTP.get_response("cms-dev.sqor.com","/rest/sports/players/?sport=nba&offset=" + currentOffset.to_s)
        currentOffset = currentOffset + 25;
        arrayName = "offsets['" + currentOffset.to_s + "'] = ";
        file.write(arrayName)
        file.write(response.body)
        file.write(";")
        puts response.body
        $ii = $ii +  1
    end
 }


