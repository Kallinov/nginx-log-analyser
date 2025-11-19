#!/bin/bash

# Get statistics about cpu via vmstat and give it as an argument to "awk" command using pipe symbol (|). The command prints 15th column of third line. 
CPU_IDLE=$(vmstat | awk 'NR==3 {print $15}')
CPU_USAGE=$((100 - CPU_IDLE))

echo "Cpu usage: $CPU_USAGE%"

get_line_of_memory_usage() {
  # The function gets first column of n-th line from "vmstat -s" output.
  # Arguments: 1 argument - number of column


  vmstat -s | awk -v line="$1" 'NR==line { print $1 }'
}

TOTAL_MEMORY=$(get_line_of_memory_usage 1)
USED_MEMORY=$(get_line_of_memory_usage 2)
FREE_MEMORY=$(get_line_of_memory_usage 5)

USED_MEMORY_PERCENTAGE=$(( USED_MEMORY * 100 / TOTAL_MEMORY ))
FREE_MEMORY_PERCENTAGE=$(( FREE_MEMORY * 100 / TOTAL_MEMORY ))

echo "Used memory: $USED_MEMORY_PERCENTAGE%"
echo -e "Free memory: $FREE_MEMORY_PERCENTAGE%\n\n"

# Get 6 lines of processes with custom output: pid, command, % of cpu usage. Sorted in reverse order by % of cpu usage
TOP_CPU_USAGE_PROCESSES=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)
TOP_MEM_USAGE_PROCESSES=$(ps -eo pid,comm,%mem --sort=-%mem | head -n 6)

echo -e "Top processes by cpu usage:\n$TOP_CPU_USAGE_PROCESSES\n\n"
echo -e "Top processes by memory usage:\n$TOP_MEM_USAGE_PROCESSES"

