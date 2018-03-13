#!/bin/sh

sumfile=/tmp/md5list
file=${1##*/}
echo $file

if [ -z "$file" -o ! -f "$file" ]; then
  echo "I need a file."
  exit 1
elif ! grep -q "($file)" $sumfile; then
  echo "ERROR: Unknown file: $1."
  exit 1
fi

newsum="`md5 $1`"

if grep -q "$newsum" $sumfile; then
  echo "$1 matches"
else
  echo "$1 IS MODIFIED"
fi
