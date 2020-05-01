#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Provide the title of the note."
    exit 1
fi

FILENAME="`date +%s | shasum -a 256 | head -c 20 ; echo`_$1.md"
touch "${FILENAME}"
echo -e "# $1" > ${FILENAME}
echo "File ${FILENAME} created."