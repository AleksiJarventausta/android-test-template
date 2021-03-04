#!/bin/bash

#cp test*.js /home/codegrade/
#cp wdio.conf.js /home/codegrade/

#Chmod next sh file(s)
chmod u+x ./run.sh
chmod u+x ./global_setup.sh

#Appium
cd
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
#Android sdk

#export AVD_VERSION=25
#export ANDROID_BUILD_TOOLS_VERSION=25.0.3 
#export SDK_VERSION=25.2.3
export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
export ANDROID_HOME=/users/runner/Library/Android/sdk
#mkdir -p $ANDROID_HOME
#cd $ANDROID_HOME
#wget -q -O tools.zip https://dl.google.com/android/repository/tools_r${SDK_VERSION}-linux.zip > /dev/null && \
#    unzip tools.zip > /dev/null && rm tools.zip > /dev/null && \
#    chmod a+x -R $ANDROID_HOME 
#
#
#echo "updating..."
#echo y | ${ANDROID_HOME}/tools/android -s update sdk -a -u -t platform-tools,build-tools > /dev/null
#
#
#echo "updating again..."
#echo y | ${ANDROID_HOME}/tools/android -s update sdk --all --force --no-ui --filter android-$AVD_VERSION,sys-img-x86-google_apis-$AVD_VERSION > /dev/null 
#
#export JAVA_HOME=/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64

#echo "installing avd:"
#echo y | ${ANDROID_HOME}/tools/android -s create avd --force --name android-${AVD_VERSION} \
#  --device "Nexus S" --name "nexus" --abi "google_apis/x86" >/dev/null
  #--device "Nexus S" --name "nexus" --abi "default/x86" --skin WVGA800

#$ANDROID_HOME/tools/bin/sdkmanager "system-images;android-27;google_apis;x86" >/dev/null
#yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

#echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n nexus -k "system-images;android-27;google_apis;x86" >/dev/null

#echo "android devices:"
#/usr/local/lib/android/sdk/tools/emulator -list-avds
#echo "############################################ END OF SETUP ###########################################################"

#cd
#echo "avds:"
$ANDROID_HOME/tools/bin/sdkmanager --install 'build-tools;30.0.3' platform-tools 'platforms;android-29' > /dev/null
$ANDROID_HOME/tools/bin/sdkmanager --install emulator > /dev/null
$ANDROID_HOME/tools/bin/sdkmanager --install 'system-images;android-29;default;x86' > /dev/null
$ANDROID_HOME/tools/bin/avdmanager create avd --force -n test --abi 'default/x86' --package 'system-images;android-29;default;x86'
$ANDROID_HOME/tools/bin/avdmanager list avd
echo "Everything installed, starting emulator...."
$ANDROID_HOME/tools/emulator -avd test -no-window -gpu swiftshader_indirect -no-snapshot -noaudio -no-boot-anim &
output=''
while [[ ${output:0:7} != 'stopped' ]]; do
  output=`$ANDROID_HOME/platform-tools/adb shell getprop init.svc.bootanim`
  sleep 1
done
echo "############################################ END OF SETUP ###########################################################"