#! /usr/bin/bash

src_fld=$1
src_fmt=$2
tot_dur=$3   # in hrs
dur=0.0
tot_dur=$(echo "scale = 3; $tot_dur*3600" | bc)  # to sec
echo $tot_dur


for file in $(find $src_fld -type f -name "*.$src_fmt"); 
do
   
    t=$(soxi -D $file)
    tot_dur=$(echo "$tot_dur - $t" | bc)
    comp=$(echo "$tot_dur > $dur" | bc)

    if [ $comp = '1' ]; then 
           
        #echo $tot_dur

        # file transfer
        cp $file new_1hr   # Destination folder
        
    else     
        break 
    fi    
done

echo $tot_dur
