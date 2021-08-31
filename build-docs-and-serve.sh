#!/usr/bin/env zsh

echo "To run this, you need Xcode 13.0. Make sure you run \`sudo xcode-select -s /path/to/Xcode13.app\`"

if (( # < 2 )); then
   print >&2 "Usage: $0 /path/to/swift/Workspace.xcworkspace Scheme"
   exit 1
fi

workspace=$1
scheme=$2
BUILD_DIR="/tmp/docc"
LOG_PATH="./build.log"

if [ ! -d $BUILD_DIR ] 
then
    mkdir $BUILD_DIR
fi

echo "Bulding scheme $scheme in workspace $workspace. Log saved in $LOG_PATH"
xcodebuild docbuild -scheme $scheme -sdk iphonesimulator15.0 -workspace $workspace -derivedDataPath $BUILD_DIR &> $LOG_PATH
docc=$(find "$BUILD_DIR" -type d -name '*.doccarchive' | grep $scheme)


if [ -d $BUILD_DIR ] 
then
    rm -rf Public/*.doccarchive
else
    mkdir Public
fi

mv $docc Public

echo "Preparing to run server."
swift build &> /dev/null

echo "Running!"
swift run
