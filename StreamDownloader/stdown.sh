#!/bin/sh

[ "$#" -eq 2 ] || (echo "Usage: ./stdown.sh <link> <file-name-without-extension>" ; exit 1)

link=$1
name=$2

# link=https://example.com/file.m3u8
# link=https://example.com/dash.mpd

systemd-inhibit ffmpeg -i $link -codec copy $name.mp4
