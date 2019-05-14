#!/bin/bash

echo { "key": "$GOOGLE_SECRET" } > $GOOGLE_APPLICATION_CREDENTIALS
node index.js

exit 0;
