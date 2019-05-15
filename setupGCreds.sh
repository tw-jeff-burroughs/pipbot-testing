#!/bin/bash
  
# get file path
FILE=`echo $GOOGLE_APPLICATION_CREDENTIALS`

# make array of path tokens
CHUNKS=$(echo $FILE | tr "/" "\n")

# set counter up to get final array location
lastIndex=-1;

# set variable to hold path to file for creating dir if not exist
FILE_PATH=''

# set variable to hold just the file name
FILE_PATH=''

# create value for lastIndex ---- there may be a better way to do this. -----
for c in ${CHUNKS[@]}; do
    (( lastIndex++ ))
done

# setup current index counter
currentIndex=0;

# loop over tokens creating path to mkdir on
for c in ${CHUNKS[@]}; do
    if [[ $currentIndex-1 == $lastIndex ]]
        then
            # if doens't exist build dir structure and go inside
            if [[ ! -d $c ]]
                then
                    mkdir $c
            fi
            cd $c
        else
            # read secrets from env var and setup google's required file
            echo { \"key\": \"`echo $GOOGLE_SECRET`\" } > $c
    fi
    (( currentIndex++ ))
done



