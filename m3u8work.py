import m3u8

m3u8_obj = m3u8.loads('https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8')
# m3u8_obj = m3u8.loads('http://www.streambox.fr/playlists/test_001/stream.m3u8')
# m3u8_obj = m3u8.loads('/home/rustam/projects/microservice/video/vod2/twitch.m3u8')
print (m3u8_obj.keys)
print (m3u8_obj.segments)
print (m3u8_obj.target_duration)
