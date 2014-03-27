require 'drb'

SERVER_URI = "druby://localhost:8787"

photoserver = DRbObject.new_with_uri SERVER_URI

sleep_time = ARGV[0].to_i || 3
i = 0
while true do
  i += 1
  IO.write("imgs/#{i}.jpg", photoserver.take_photo)
  sleep sleep_time
end
