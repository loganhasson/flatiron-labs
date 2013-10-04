require 'open-uri'

loop do 
  time = Time.now
  open('http://www.loganhasson.com') { |f| f.status.first == "200" }
  time2 = Time.now
  puts time2-time
end