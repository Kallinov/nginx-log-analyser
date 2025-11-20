#!/bin/bash

log-archive() {
  # A function fo archive log directories
  # Params: 1 param, a path to log directory
  # Return: nothing, just creates a "tar.gz" file

  local path="$1"


  # Check if param is a directory
  if [[ -d "$path" ]]; then

  # If it is then creates a "tar.gz" file via tar command and "-z" flag.
    local date_time=$(date +"%Y%m%d_%H%M%S")
    sudo tar -czf logs_archive_"$date_time" "$path"

  # The function can also show information about the command if given argument is "--help"
  elif [[ "$path" == "--help" ]]; then
    echo "The command is archive log files. It's accept only 1 parametr, a path to the log files."
  else
    echo "Incorrect arguments. Type '--help' to see more information"
  fi
}
