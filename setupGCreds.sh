#!/bin/bash

FILE=`echo $GOOGLE_APPLICATION_CREDENTIALS`

echo { \"key\": \"`echo $GOOGLE_SECRET`\" } > $FILE
