#!/usr/bin/env bash

# Get CPU usage percentage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
CPU_USAGE=${CPU_USAGE%.*}  # Remove decimal

# Get temperature from sensors command
TEMP=$(sensors | grep "Package id 0" | awk '{print $4}' | sed 's/+//;s/°C//;s/\..*//')
if [ -z "$TEMP" ]; then
    TEMP="N/A"
fi

# Get per-core usage
CORE_USAGE=$(mpstat -P ALL 1 1 | awk '/Average:/ && $2 ~ /[0-9]/ {printf "Core %d: %.1f%%\n", $2, 100-$NF}')

echo "| CPU:$CPU_USAGE%/$TEMP°C"
