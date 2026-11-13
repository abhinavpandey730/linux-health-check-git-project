
#!/bin/bash

echo "==== CPU Monitoring ===="

read -r cpu user nice system idle iowait irq  softirq steal rest < /proc/stat 
total1=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle1=$(( idle + iowait ))

sleep 1
 
read -r cpu user nice system idle iowait irq softirq steal rest < /proc/stat
total2=$((user + nice + system + idle + iowait + irq +softirq + steal))
idle2=$((idle + iowait))

total_diff=$((total2 - total1))
idle_diff=$((idle2 - idle1))

cpu_usage=$(awk -v total="$total_diff" -v idle="$idle_diff" \
'BEGIN { if (total > 0) printf "%.2f",(total-idle)*100/total; else print "0.00" }')

echo "CPU Usage: $cpu_usage%"
