#! /usr/bin/bash

src_fld=$1    #give absolute path --- important
src_fmt=$2
dest_fld=$3   #create this file in the folder

for file in $(find $src_fld -type f -name "*.$src_fmt"); do
    file_name=$(basename "${file}")
    b=`echo $file_name | cut -d '.' -f1 `
    echo  -e  ${b} '\t' $file  >> $dest_fld/wav.scp
    echo  -e  ${b} '\t' ${b}  >> $dest_fld/utt2spk
done
