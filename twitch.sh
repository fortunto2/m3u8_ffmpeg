#!/usr/bin/env bash

# https://blog.twitch.tv/live-video-transmuxing-transcoding-ffmpeg-vs-twitchtranscoder-part-i-489c1c125f28

ffmpeg -i ./data/test.mp4 \
  -c:v libx264 \
  -x264opts keyint=60:no-scenecut \
  -s 640x360 \
  -r 30 \
  -b:v 1000k \
  -profile:v main -preset veryfast \
  -flags +cgop \
  -c:a aac \
  -sws_flags bilinear \
  -hls_playlist_type vod \
  ./vod2/twitch.m3u8
