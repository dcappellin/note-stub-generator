#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Provide the title of the note."
    exit 1
fi

EXTENSION=".md"
SHA256SUM="shasum -a 256"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    SHA256SUM="sha256sum"
fi

FILENAME="`date +%s | ${SHA256SUM} | head -c 20 ; echo`_$1${EXTENSION}"

touch "${FILENAME}"
echo -e "# $1" > ${FILENAME}
echo "File ${FILENAME} created."