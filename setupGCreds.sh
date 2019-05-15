#!/bin/bash

# get file path
FILE=`echo $GOOGLE_APPLICATION_CREDENTIALS`

# make array of path tokens
IFS='/' read -r -a CHUNKS <<< "$FILE"

unset CHUNKS[0]

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
        echo `pwd`
done

echo { \"key\": \"`echo $GOOGLE_SECRET`\" } > $FILE_NAME
