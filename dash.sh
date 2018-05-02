#!/usr/bin/env bash

# ffmpeg -i ./data/test.mp4 \
#   -c:v libx264 \
#   -x264opts keyint=60:no-scenecut \
#   -s 640x360 \
#   -r 30 \
#   -b:v 1000k \
#   -profile:v main -preset veryfast \
#   -c:a aac \
#   -sws_flags bilinear \
#   -hls_playlist_type vod \
#   ./vod2/twitch.m3u8

# https://www.ffmpeg.org/ffmpeg-formats.html#Options-4

ffmpeg -re -i  ./data/test.mp4 \
  -map 0 -map 0 \
  -c:a aac \
  -c:v libx264 \
  -b:v:0 800k \
  -b:v:1 300k \
  -s:v:1 320x170 \
  -profile:v:1 baseline \
  -profile:v:0 main \
  -bf 1 \
  -keyint_min 120 -g 120 -sc_threshold 0 \
  -b_strategy 0 \
  -ar:a:1 22050 \
  -use_timeline 1 -use_template 1 \
  -window_size 5 \
  -adaptation_sets "id=0,streams=v id=1,streams=a" \
  -f dash ./dash/out.mpd
