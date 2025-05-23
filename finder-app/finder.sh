#!/bin/bash

# Argument validation
if [ $# -ne 2 ]; then
  echo "Error: Two arguments required - <directory path> and <search string>"
  exit 1
fi

filesdir=$1
searchstr=$2

# Check if the directory exists and is a directory
if [ ! -d "$filesdir" ]; then
  echo "Error: '$filesdir' is not a valid directory"
  exit 1
fi

# Count the number of files (regular files) in the directory and subdirectories
file_count=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines containing the search string
match_count=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Output result
echo "The number of files are $file_count and the number of matching lines are $match_count"
exit 0