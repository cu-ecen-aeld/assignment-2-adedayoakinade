#!/bin/sh
# Writer script for assignment 1 
# Author: Adedayo Akinade

# Example usage:
                # writer.sh /tmp/aesd/assignment1/sample.txt ios

set -e
set -u

# Check if the number of arguments is not equal to 2

if [ $# -ne 2 ]
then
    echo "Usage: writer.sh <file> <string>"
    exit 1
fi

FILE=$1
WRITESTR=$2

# Check if the path exists and create it if it doesn't

if [ ! -d "$(dirname "$FILE")" ]
then
    mkdir -p "$(dirname "$FILE")"
fi

# Check if the file exists and create it if it doesn't

if [ ! -f "$FILE" ]
then
    touch "$FILE"
fi

# Check if the file is readable

if [ ! -r "$FILE" ]
then
    echo "File $FILE is not readable"
    exit 1
fi

# Check if the file is writable

if [ ! -w "$FILE" ]
then
    echo "File $FILE is not writable"
    exit 1
fi

# Check if the string is empty

if [ -z "$WRITESTR" ]
then
    echo "String $WRITESTR is empty"
    exit 1
fi

# Write the string to the file

echo "$WRITESTR" > "$FILE"

# Check if the string was written to the file

if [ ! "$(cat "$FILE")" = "$WRITESTR" ]
then
    echo "String $WRITESTR was not written to $FILE"
    exit 1
fi

