#!/bin/bash

if [ "$#" == 0 ] ;
then
	echo "Error: File path is missing"
	exit 1
elif [ "$#" == 1 ];
then
 cd "$1"
 git shortlog -sn | awk '{print $2, "-", $1}' > ../output.txt
else 
   cd "$1"
   for name in "${@:2}" ; do
		fullName=$(git shortlog -sn  | grep -i "$name" | awk '{print $2}') 
        count=$(git shortlog -sn | grep -i "$name" | awk '{print $1}')
        echo "$fullName - $count" >> ../output.txt
   done		
fi

#! output
#! Alia - 2
#! Chi - 9
