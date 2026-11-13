#!/bin/bash

echo "==== Memory Monitoring ===="

free -b | awk 'NR==2 {
       total=$2
       used=$3

      if (total > 0) {
          printf "Total Memory: %.2f GB\n",
total/1024/1024/1024
          printf "Used Memory: %.2f GB\n",
used/1024/1024/1024
          printf "Memory Usage: %.2f%%\n",
used*100/total
         }
}'
