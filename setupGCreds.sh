#!/bin/bash
  
# get file path
FILE=`echo $GOOGLE_APPLICATION_CREDENTIALS`

# make array of path tokens
CHUNKS=$(echo $FILE | tr "/" "\n")

# set counter up to get final array location
lastIndex=-1;

# create value for lastIndex ---- there may be a better way to do this. -----
for c in ${CHUNKS[@]}; do
    (( lastIndex++ ))
done

mkdir .data
cd .data
echo { \"key\": \"`echo $GOOGLE_SECRET`\" } > ${CHUNKS[lastIndex]}
