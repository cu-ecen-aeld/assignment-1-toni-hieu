#!/bin/bash

# Check for exactly two arguments
if [ $# -ne 2 ]; then
  echo "Error: Two arguments required - <file path> and <string to write>"
  exit 1
fi

writefile=$1
writestr=$2

# Extract directory path from the file path
dirpath=$(dirname "$writefile")

# Create the directory path if it doesn't exist
mkdir -p "$dirpath"
if [ $? -ne 0 ]; then
  echo "Error: Could not create directory path '$dirpath'"
  exit 1
fi

# Try writing to the file
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
  echo "Error: Could not write to file '$writefile'"
  exit 1
fi

# Success
exit 0