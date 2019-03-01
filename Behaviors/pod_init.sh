#!/bin/bash

# move project dir
PROJECT_HOME=`pwd`
echo "cd $PROJECT_HOME" > /tmp/tmp.sh

# search .xcodeproj file and strip filename
PROJECT_NAME=""
for f in *.xcodeproj; do
    PROJECT_NAME="${f%.*}"
    break
done

if [[ -z "$PROJECT_NAME" ]] || [ "$PROJECT_NAME" == "*" ]; then
    osascript -e 'tell application (path to frontmost application as text) to display dialog "Cannot find project file" buttons {"OK"} with icon stop'
    exit
fi

# pod init & update
echo "pod init" >> /tmp/tmp.sh
echo "pod install" >> /tmp/tmp.sh
echo "clear" >> /tmp/tmp.sh

# reload workspace file
echo "echo \"Close '$PROJECT_NAME' Xcode window\""  >> /tmp/tmp.sh
echo "echo"  >> /tmp/tmp.sh
echo "read -p \"Press enter to continue...\"" >> /tmp/tmp.sh
echo "open $PROJECT_NAME.xcworkspace" >> /tmp/tmp.sh

chmod +x /tmp/tmp.sh
open -a Terminal /tmp/tmp.sh
