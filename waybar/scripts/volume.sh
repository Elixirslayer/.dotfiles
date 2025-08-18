#!/bin/sh

# Get output volume
output_vol=$(pamixer --get-volume)
output_muted=$(pamixer --get-mute)

# Get input (mic) volume
input_vol=$(pamixer --default-source --get-volume)
input_muted=$(pamixer --default-source --get-mute)

# Icons
if [ "$output_muted" = "true" ]; then
    output_icon=""
elif [ "$output_vol" -eq 0 ]; then
    output_icon=""
elif [ "$output_vol" -lt 50 ]; then
    output_icon=""
else
    output_icon=""
fi

if [ "$input_muted" = "true" ]; then
    input_icon=""
else
    input_icon=""
fi

echo "{\"text\":\"$output_icon $output_vol% / $input_icon $input_vol%\", \"alt\":\"$output_muted\"}"
