#!/bin/bash

# move project dir
PROJECT_HOME=`pwd`
echo "cd $PROJECT_HOME" > /tmp/tmp.sh

# pod init & update
echo "pod update" >> /tmp/tmp.sh

chmod +x /tmp/tmp.sh
open -a Terminal /tmp/tmp.sh
