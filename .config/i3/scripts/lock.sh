#!/bin/bash

#depends on: imagemagick, i3lock, scrot

IMAGE=/tmp/lockscreen.png
TEXT=/tmp/locktext.png
ICON=/home/hugh/.config/i3/scripts/lock.png

scrot $IMAGE
convert $IMAGE -scale 10% -scale 1000% -fill black -colorize 25% $IMAGE
[ -f $TEXT ] || {
    convert -size 800x60 xc:white -font Liberation-Sans -pointsize 26 -fill black -gravity center -annotate +0+0 'Type password to unlock' $TEXT;
    convert $TEXT -alpha set -channel A -evaluate set 50% $TEXT;
}
convert $IMAGE $TEXT -gravity center -geometry +0+200 -composite $IMAGE
convert $IMAGE $ICON -gravity center -composite -matte $IMAGE
i3lock -i $IMAGE
