#! /usr/bin/bash

src_fld=$1
src_fmt=$2
dur=0.0

for file in $(find $src_fld -type f -name "*.$src_fmt"); 
do
   
    t=$(soxi -D $file)
        
    if [[ $t =~ ^[0-9]+\.?[0-9]*$ ]] ; then
        dur=$(echo "$dur + $t" | bc)
    else     # to handle empty files -- when "RIFF header not found"
        continue
    fi    
done
echo  "Duration in sec: $dur" 
echo  "Duration in min: $(echo "scale = 3; $dur/60" | bc)"  # get it in mins/hrs
echo  "Duration in hrs: $(echo "scale = 3; $dur/3600" | bc)"  # get it in mins/hrs