#!/bin/bash
#Start the script

#welcome the user to the script.
echo "🔥🔥🔥  Beginning build!! 🔥🔥🔥"

# verify with the user that they have updated changelog.md with the current release version.
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building version" $version
#User Input
echo 'Do you want to continue? (enter "1" for yes, "0" for no)'
read versioncontinue
if [ $versioncontinue -eq 1 ]
then
  echo "OK"
else
  echo "Please come back when you are ready"
fi
#Copying files
for filename in source/*
do
  #echo $filename
  if [ "$filename" == "source/secretinfo.md" ]
  then
    echo "Not copying" $filename
  else
    echo "Copying" $filename
    cp $filename build/.
  fi
done

#Changing directory & listing copied files
cd build/
echo "Build version $version contains:"
ls

#RdEl00
