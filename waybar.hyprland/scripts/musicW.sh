#!/usr/bin/env bash

MUSIC=mpd
BROWSER=chromium

BROWSER_STATUS=$(playerctl --player=$BROWSER status 2>/dev/null)
MUSIC_STATUS=$(playerctl --player=$MUSIC status 2>/dev/null)

[[ $MUSIC_STATUS == "Playing" ]] && ICON="🎵 " || ICON="❚❚ "

if [[ $BROWSER_STATUS == "Playing" ]]; then
    PLAYER=$BROWSER
    ICON="󰖟 "
    NORMAL=$(playerctl metadata --player=$PLAYER --format '{{ trunc(title,25) }}' 2>/dev/null)
    ALTERNATE=$(playerctl metadata --player=$PLAYER --format '{{ trunc(artist,17) }} - {{ trunc(title,17) }}' 2>/dev/null)
else
    PLAYER=$MUSIC
    NORMAL=$(playerctl metadata --player=$PLAYER --format '{{ trunc(artist,17) }} - {{ trunc(title,17) }}' 2>/dev/null)
    ALTERNATE=$(playerctl metadata --player=$PLAYER --format '{{ trunc(album,17) }} - {{ trunc(title,17) }}' 2>/dev/null)
fi

FORMAT_FILE="/tmp/waybar_mus_format"
[ ! -f "$FORMAT_FILE" ] && echo "0" > "$FORMAT_FILE"

read FORMAT < "$FORMAT_FILE"
[ "$FORMAT" -eq 0 ] && INFO="$NORMAL" || INFO="$ALTERNATE"

echo -e "$ICON$INFO"
