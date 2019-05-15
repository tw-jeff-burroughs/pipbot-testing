#!/bin/bash
  
# get file path
FILE=`echo $GOOGLE_APPLICATION_CREDENTIALS`

# make array of path tokens
CHUNKS=$(echo $FILE | tr "/" "\n")

# set counter up to get final array location
lastIndex=-1;

# set variable to hold path to file for creating dir if not exist
FILE_PATH=''

# create value for lastIndex ---- there may be a better way to do this. -----
for c in ${CHUNKS[@]}; do
    (( lastIndex++ ))
done

# setup current index counter
currentIndex=0;

# loop over tokens creating path to mkdir on
for c in ${CHUNKS[@]}; do
    if [[ $currentIndex -lt  $lastIndex ]]
        then
            FILE_PATH="$FILE_PATH/$c"
    fi
    (( currentIndex++ ))
done

if [[ ! -d $FILE_PATH ]]
    then
        mkdir -p $FILE_PATH
fi

cd $FILE_PATH

# read secrets from env var and setup google's required file
echo { \"key\": \"`echo $GOOGLE_SECRET`\" } > $FILE_NAME
