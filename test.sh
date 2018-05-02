#!/usr/bin/env bash

ffmpeg -y \
    -i ./data/test.mp4 \
    -hls_time 3 \
    -hls_segment_filename "./vod/sequence%d.ts" \
    -hls_playlist_type vod \
    ./vod/prog_index.m3u8
