#!/bin/bash

# Fix the CircleCI path
function getAndroidSDK(){
  export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"

  DEPS="$ANDROID_HOME/installed-dependencies"

  if [ ! -e $DEPS ]; then
    cp -r /usr/local/android-sdk-linux $ANDROID_HOME &&
    echo y | android update sdk -u -a -t platform-tools &&
    echo y | android update sdk -u -a -t tools &&
    echo y | android update sdk -u -a -t android-25 &&
    echo y | android update sdk -u -a -t extra-android-m2repository &&
    echo y | android update sdk -u -a -t extra-android-support &&
    echo y | android update sdk -u -a -t build-tools-25.0.2 &&
    echo y | android update sdk -u -a -t sys-img-armeabi-v7a-android-18 &&
    ##echo no | android create avd -n testAVD -f -t android-19 --abi default/x86 &&
    touch $DEPS
  fi
}