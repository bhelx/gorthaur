require 'drb'

SERVER_URI = "druby://localhost:8787"

photoserver = DRbObject.new_with_uri SERVER_URI

sleep_time = ARGV[0].to_i || 3
index = ARGV[1].to_i || 1
while true do
  print "#{index} "
  IO.write("imgs/#{index}.jpg", photoserver.take_photo)
  sleep sleep_time
  index += 1
end
