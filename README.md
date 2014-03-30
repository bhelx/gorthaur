gorthaur
========

Here is some code you can use to capture some webcam shots periodically then compile to a timelapse video.

I hardly wrote any of it.
[@tenderlove](http://tenderlovemaking.com/2014/03/26/webcam-photos-with-ruby.html) wrote it


Installing
----------

  1. Have `ruby` available
  2. Have `gem` available
  3. Have `ffmpeg` availble (`brew install ffmpeg` for mac)
  4. `gem install gorthaur`


Using
-----

  1. `gorthaur listener -d`
  2. `gorthaur watcher -d`

The default time between between images is 3 seconds (you can change this by setting `GORTHAUR_RATE=...` or as the first argument).
The default start frame is 1 (you can change this by setting `GORTHAUR_FRAME=...` or as the second argument).
It writes all the images to the `imgs/` directory with the format `%d.jpg` where `%d` is the frame (you can change this directory by setting `GORTHAUR_DIRECTORY=...` or as the third argument).
Example:

``` shell
# Settings via arguments
$ gorthaur watcher -d --rate 4 --frame 2 --directory ~/Videos/gorthaur
```

``` shell
# Settings with lazy-people arguments
$ gorthaur watcher -d -r 4 -f 2 -D ~/Videos/gorthaur
```

``` shell
# Settings using environment variables
$ GORTHAUR_RATE=4 GORTHAUR_FRAME=2 GORTHAUR_DIRECTORY=~/Videos/gorthaur gorthaur watcher -d
```

``` shell
# Settings with real environment variables
$ export GORTHAUR_RATE=4
$ export GORTHAUR_FRAME=2
$ export GORTHAUR_DIRECTORY=~/Videos/gorthaur
$ gorthaur watcher -d
```

For the advanced users you can also determine the `pid` file and log file:

``` shell
$ gorthaur listener -d -P tmp/gorthaur.pid -l tmp/gorthaur.log
```

If you want to run these without going to the background just avoid using the `-d` flag.

For macs you can use the `caffeinate` binary to keep your computer from truly sleeping.

Videos
------

We recommend you use `ffmpeg`, which can be installed via `brew install ffmpeg`.
To compile to video just use the following:

``` shell
$ ffmpeg -r 30 -f image2 -s 1280x720 -i LOCATION_OF_IMAGES/%d.jpg -vcodec libx264 -crf 15 output.mp4

# The -r stands for frame rate, adjust if you set it yourself:
$ ffmpeg -r 40 -f image2 -s 1280x720 -i LOCATION_OF_IMAGES/%d.jpg -vcodec libx264 -crf 15 output.mp4
```

To add audio track:

```
ffmpeg -i output.mp4 -i mytrack.mp3 -vcodec copy -acodec copy -acodec copy -shortest output_with_audio.mp4
```
