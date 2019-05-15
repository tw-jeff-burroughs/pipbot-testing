#!/bin/bash

# get file path
FILE=`echo $GOOGLE_APPLICATION_CREDENTIALS`

# make array of path tokens
IFS='/' read -r -a CHUNKS <<< "$FILE"

cd /

lastIndex=${#CHUNKS[@]}-1

FILE_NAME=${CHUNKS[lastIndex]}

unset CHUNKS[lastIndex]

FILE_PATH=${CHUNKS[@]}

for c in ${CHUNKS[@]}
    do
        if [[ ! -d $c ]]
            then 
                mkdir $c
        fi
        cd $c
done

echo { \"key\": \"`echo $GOOGLE_SECRET`\" } > $FILE_NAME
