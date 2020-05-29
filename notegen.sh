#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -t|--template)
    TEMPLATE="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [ $# -eq 0 ]
  then
    echo "No argument(s) supplied. Provide the title of the note."
    exit 1
fi

EXTENSION=".md"
SHA256SUM="shasum -a 256"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    SHA256SUM="sha256sum"
fi

FILENAME="`date +%s | ${SHA256SUM} | head -c 20 ; echo`_$1${EXTENSION}"

touch "${FILENAME}"

if [ -z "$TEMPLATE" ]; then
	echo -e "# $1" > ${FILENAME}
else
	cp -f "${TEMPLATE}" "${FILENAME}"
fi

echo "File ${FILENAME} created."
