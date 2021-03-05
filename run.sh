#!/bin/bash

export ANDROID_HOME=/users/runner/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home


$ANDROID_HOME/platform-tools/adb wait-for-device shell 'while [[ -z $(getprop sys.boot_completed) ]]; do sleep 1; done;'
./node_modules/.bin/wdio 
$ANDROID_HOME/platform-tools/adb -s emulator-5554 emu kill
