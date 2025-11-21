#!/bin/bash

path_to_logs="$1"

find_top_strings() {
  # The function prints top 5 strings depends on value that user gives to it
  # Params: 1 param, number of column
  # Return: Nothing

  local col="$1"


  # Take 5 strings with most repeats (most requested)
  awk -v col="$col" '{print $col}' "$path_to_logs" | sort | uniq -c | sort -nr | head -5 | awk '{ print $2, "-", $1, "requests" }'
}

echo "Top 5 IP addresses with the most requests:"
find_top_strings 1
echo -e "\n\nTop 5 most requested paths:"
find_top_strings 7
echo -e "\n\nTop 5 response status codes:"
find_top_strings 9
