Here is some code you can use to capture some webcam shots periodically then compile to a timelapse video.

I hardly wrote any of it. [@tenderlove](http://tenderlovemaking.com/2014/03/26/webcam-photos-with-ruby.html) wrote it

First you need the av_capture gem
```
gem install av_capture
```

Then you need ffmpeg to compile to video
```
brew install ffmpeg
```

Run the server in a session or another terminal off in the distance
```
ruby server.rb
```

Run the client in a session or in another terminal off in the distance. 3 is the number of seconds between images. Defaults to 3.
```
ruby client.rb 3
```

It writes all the images to the imgs/ directory with the format %d.jpg where %d is the frame number.

To compile to video, -r is the frame rate:
```
ffmpeg -r 5 -f image2 -s 1280x720 -i imgs/%d.jpg -vcodec libx264 -crf 15 test.mp4
```

