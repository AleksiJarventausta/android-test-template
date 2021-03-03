#!/bin/bash

# The uploaded user files are always in /submission/user
# and named identically to config.yaml regardless of the uploaded file names.

# The mount directory from config.yaml is in /exercise.
# Append the required support files to test user solution.

# "capture" etc description in https://github.com/apluslms/grading-base
export ANDROID_HOME=/usr/local/lib/android/sdk
#export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools
#export LD_LIBRARY_PATH=$ANDROID_HOME/emulator/lib64
#cp $STUDENT/application.apk /home/codegrade/application.apk
cd
adb start-server
adb devices

echo "android tools bin:"
ls $ANDROID_HOME/tools/

echo "android platforms:"
ls $ANDROID_HOME/platforms/
xvfb-run $ANDROID_HOME/tools/emulator -avd nexus -netdelay none -netspeed full &
server_pid=$!
output=''
while [[ ${output:0:7} != 'stopped' ]]; do
  output=`$ANDROID_HOME/platform-tools/adb shell getprop init.svc.bootanim`
  sleep 1
done


./node_modules/.bin/wdio 
kill $server_pid
wait $server_pid 2>/dev/null
