#!/bin/bash

FILE=`echo $GOOGLE_APPLICATION_CREDENTIALS`

FILE_PATH=`echo $FILE | awk -F"/" '{print $NF}'`

mkdir -p $FILE_PATH

echo { \"key\": \"`echo $GOOGLE_SECRET`\" } > $FILE
