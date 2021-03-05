#!/bin/bash

# The uploaded user files are always in /submission/user
# and named identically to config.yaml regardless of the uploaded file names.

# The mount directory from config.yaml is in /exercise.
# Append the required support files to test user solution.

# "capture" etc description in https://github.com/apluslms/grading-base
export ANDROID_HOME=/users/runner/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
#export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools
#export LD_LIBRARY_PATH=$ANDROID_HOME/emulator/lib64
#cp $STUDENT/application.apk /home/codegrade/application.apk
cd 
#output=''
#while [[ ${output:0:7} != 'stopped' ]]; do
#  output=`$ANDROID_HOME/platform-tools/adb shell getprop init.svc.bootanim`
#  sleep 1
#done


./node_modules/.bin/wdio 
$ANDROID_HOME/platform-tools/adb -s emulator-5554 emu kill
#kill $server_pid
#wait $server_pid 2>/dev/null
