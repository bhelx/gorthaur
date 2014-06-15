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

  1. `gorthaur server -d`
  2. `gorthaur client -d`

The default time between between images is 5 seconds (you can change this by setting `GORTHAUR_RATE=...` or as the first argument).
It writes all the images to the `~/Pictures/gorthaur/frames` directory with the format `%d.jpg` where `%d` is the timestamp (you can change this directory as documented below).
Example:

``` shell
# Settings via arguments
$ gorthaur server -d --rate 4 --path ~/Videos/gorthaur
```

``` shell
# Settings with lazy-people arguments
$ gorthaur client -d -r 4 -p ~/Videos/gorthaur
```

``` shell
# Settings using environment variables
$ GORTHAUR_RATE=4 GORTHAUR_PATH=~/Videos/gorthaur gorthaur client -d
```

``` shell
# Settings with real environment variables
$ export GORTHAUR_RATE=4
$ export GORTHAUR_PATH=~/Videos/gorthaur
$ gorthaur client -d
```

For the advanced users you can also determine the `pid` file and log file:

``` shell
$ gorthaur server -d -P tmp/gorthaur.pid -l tmp/gorthaur.log
```

If you want to run these without going to the background just avoid using the `-d` flag.

For macs you can use the `caffeinate` binary to keep your computer from truly sleeping.

Videos
------

We recommend you use `ffmpeg`, which can be installed via `brew install ffmpeg`.
To compile to video just use the following:

``` shell
$ ffmpeg -r 80 -f image2 -s 1280x720 -i LOCATION_OF_IMAGES/%d.jpg -vcodec libx264 -crf 15 output.mp4

# The -r stands for rate, adjust if you're not using the default:
$ ffmpeg -r 40 -f image2 -s 1280x720 -i LOCATION_OF_IMAGES/%d.jpg -vcodec libx264 -crf 15 output.mp4
```

To add audio track:

```
ffmpeg -i output.mp4 -i mytrack.mp3 -vcodec copy -acodec copy -acodec copy -shortest output_with_audio.mp4
```
