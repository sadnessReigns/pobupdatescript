#! /bin/bash\

url=$(pbpaste)
filename="PathOfBuilding.app"
zipname="PathOfBuilding.zip"
downloadspath="/Users/$(id -un)/Downloads/"
applicationspath="/Applications/"

zippath=$downloadspath$zipname
filepath=$downloadspath$filename
fixdestination=$applicationspath$filename

rm -rf $applicationspath$filename
cd $downloadspath
curl -LO $url
unzip $zippath
echo "unzipped"

mv $filepath $applicationspath
echo "moved to applications"

xattr -d com.apple.quarantine $fixdestination
echo "fixed PoB"

rm -rf $downloadspath"__MACOSX"
rm -rf $zippath

arg=$1
if [ $arg == "-open" ]
then
open $fixdestination
fi
