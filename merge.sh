#!/usr/bin/env bash

ffmpeg -i ./vod2/twitch.m3u8 -c copy -bsf:a aac_adtstoasc output.mp4
