#!/bin/bash
  
# get file path
FILE=`echo $GOOGLE_APPLICATION_CREDENTIALS`

# make array of path tokens
IFS='/' read -r -a CHUNKS <<< "$FILE"

LESS_CHUNKS=${CHUNKS[@]:2}

lastIndex=${#LESS_CHUNKS[@]}-1

FILE_NAME=${LESS_CHUNKS[lastIndex]}

unset LESS_CHUNKS[lastIndex]

FILE_PATH=${LESS_CHUNKS[@]}

for c in ${LESS_CHUNKS[@]}
    do
        if [[ ! -d $c ]]
            then
                mkdir $c
        fi
        cd $c
        echo `pwd`
done

echo { \"key\": \"`echo $GOOGLE_SECRET`\" } > $FILE_NAME
