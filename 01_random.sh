#!/bin/bash
WARNING_LIM=70
CRITICAL_LIM=90

echo "======================================"
echo "        Lab 01 - Disk Usage          |"
echo "======================================"

df | tail -n +2 | while read -r filesystem total used available percent mount_point
do
    used_percent=${percent%\%}

    if [ "$used_percent" -lt "$WARNING_LIM" ]; then
        status="OK"
    elif [ "$used_percent" -lt "$CRITICAL_LIM" ]; then
        status="WARNING"
    else
        status="CRITICAL"
    fi

    printf "%-15s %s%%\t\t%s\n" "$mount_point" "$used_percent" "$status"
done

echo "======================================"
echo "      Done checking disk usage       |"
echo "======================================"