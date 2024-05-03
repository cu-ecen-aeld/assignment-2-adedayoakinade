#!/bin/sh
# Finder script for assignment 1 
# Author: Adedayo Akinade

# Example usage:
                # finder.sh /tmp/aesd/assignment1 linux

set -e
set -u

# Check if the number of arguments is not equal to 2

if [ $# -ne 2 ]
then
    echo "Usage: finder.sh <dir> <string>"
    exit 1
fi

DIRECTORY=$1
SEARCHSTR=$2

# Check if the directory exists

if [ ! -d "$DIRECTORY" ]
then
    echo "Directory $DIRECTORY does not exist"
    exit 1
fi

# Check if the directory is readable

if [ ! -r "$DIRECTORY" ]
then
    echo "Directory $DIRECTORY is not readable"
    exit 1
fi

# Check if the directory is searchable

if [ ! -x "$DIRECTORY" ]
then
    echo "Directory $DIRECTORY is not searchable"
    exit 1
fi

# Check if the directory is empty

if [ ! "$(ls -A $DIRECTORY)" ]
then
    echo "Directory $DIRECTORY is empty"
    exit 1
fi

# Check if the string is empty

if [ -z "$SEARCHSTR" ]
then
    echo "String $SEARCHSTR is empty"
    exit 1
fi

# Check if the string is not a string

if [ ! -z "$SEARCHSTR" ] && [ ! -n "$SEARCHSTR" ]
then
    echo "String $SEARCHSTR is not a string"
    exit 1
fi

# Count the number of files in the directory and subdirectories

NUMFILES=$(find $DIRECTORY -type f | wc -l)

# Count the number of lines containing the string in the directory and subdirectories

NUMLINES=$(grep -r "$SEARCHSTR" $DIRECTORY | wc -l)

# Print the output

echo "The number of files are $NUMFILES and the number of matching lines are $NUMLINES"



