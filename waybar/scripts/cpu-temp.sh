#!/usr/bin/env bash

# Get CPU usage percentage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
CPU_USAGE=${CPU_USAGE%.*}  # Remove decimal

# Get temperature
TEMP_PATH="/sys/devices/platform/coretemp.0/hwmon/hwmon4/temp1_input"
if [ -f "$TEMP_PATH" ]; then
    TEMP_RAW=$(cat "$TEMP_PATH")
    TEMP=$((TEMP_RAW / 1000))
else
    TEMP="N/A"
fi

# Get per-core usage
CORE_USAGE=$(mpstat -P ALL 1 1 | awk '/Average:/ && $2 ~ /[0-9]/ {printf "Core %d: %.1f%%\n", $2, 100-$NF}')

echo "| CPU:$CPU_USAGE%/$TEMP°C"
