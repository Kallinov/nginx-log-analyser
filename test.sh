#!/bin/bash

path="$1"

if [[ -f "$path" || -d "$path" ]]; then
  echo "file or dir"
elif [[ "$path" == "help" ]]; then
  echo "help"
else
  echo "unknown"
fi
