#!/bin/bash
export ANDROID_HOME=/users/runner/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

#cp test*.js ~/
#cp wdio.conf.js ~/
#cp application.apk ~/

#Chmod next sh file(s)
chmod u+x ./run.sh
chmod u+x ./global_setup.sh

#Appium
npm init -y
npm install --silent -y \
	appium

#Webdriver.io
npm install --silent -y --save-dev \
	@wdio/cli \
	chai \
	chai-webdriverio \
	@wdio/appium-service \
	@wdio/local-runner \
	@wdio/mocha-framework

#$ANDROID_HOME/tools/bin/sdkmanager --install 'build-tools;30.0.3' platform-tools 'platforms;android-29' > /dev/null
#$ANDROID_HOME/tools/bin/sdkmanager --install emulator > /dev/null
$ANDROID_HOME/tools/bin/sdkmanager --install 'system-images;android-29;default;x86' > /dev/null
echo "installing avd..."
echo no | $ANDROID_HOME/tools/bin/avdmanager create avd --force -n test --abi 'default/x86' --package 'system-images;android-29;default;x86'
echo "############################################ END OF SETUP ###########################################################"