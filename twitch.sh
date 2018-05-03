#!/usr/bin/env bash

# https://blog.twitch.tv/live-video-transmuxing-transcoding-ffmpeg-vs-twitchtranscoder-part-i-489c1c125f28
#  -x264params='-x264-params keyint='+keyint+':min-keyint='+min_keyint+':scenecut='+scenecut+':rc-lookahead='+keyint
# -x264opts keyint=60:no-scenecut \


ffmpeg -i ./data/test2.mp4 \
  -c:v libx264 \
  -x264-params keyint=120:min-keyint=60:scenecut=50:rc-lookahead=300 \
  -s 640x360 \
  -r 30 \
  -b:v 1000k \
  -profile:v main -preset veryfast \
  -flags +cgop \
  -c:a aac \
  -sws_flags bilinear \
  -hls_playlist_type vod \
  ./vod/twitch.m3u8
