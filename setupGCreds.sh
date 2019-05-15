#!/bin/bash

# This script assumes that the path for storing the json file
# will be under the app directory
# we also know that since we're in postbuild in heroku that the 
# current path when executing this script is not /app
# it is /tmp/A_VERY_LONG_ID_VALUE/app which is why we dump the 
# app from the beginning of the path

# get file path
FILE=`echo $GOOGLE_APPLICATION_CREDENTIALS`

# make array of path tokens
IFS='/' read -r -a CHUNKS <<< "$FILE"

# remove app from the front since we're in postbuild in the app dir
app=(app)
tail=(${CHUNKS[@]/$app})

# get file name
tailLen=${#tail[@]}
fileName=${tail[tailLen-1]}

# remove file name leaving just the path to create if it's not there
fn=(fileName)
justPath=(${tail[@]/$fn})

if [[ ! -d $justPath ]]; then
    mkdir -p $justPath
fi

# write the file at the path in GOOGLE_APPLICATION_CREDENTIALS
echo { \"key\": \"`echo $GOOGLE_SECRET`\" } > "$justPath/$fileName"
