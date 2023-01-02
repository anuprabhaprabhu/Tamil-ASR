src_fld=$1
src_fmt=$2
tot_dur=$3   # in hrs
train=$4    #create this  folder
test=$5

check=0
dur=0.0
tot_dur=$(echo "scale = 3; $tot_dur*3600" | bc)  # to sec
echo $tot_dur


for file in $(find $src_fld -type f -name "*.$src_fmt"); 
do
    check=$((check+1))
    t=$(soxi -D $file)
    tot_dur=$(echo "$tot_dur - $t" | bc)
    comp=$(echo "$tot_dur > $dur" | bc)

    if [ $comp = '1' ]; then 
        file_name=$(basename "${file}")
        b=`echo $file_name | cut -d '.' -f1 `
        
        utter="`echo $file | cut -d '.' -f1 `.txt"
        if [[ ! -f "$utter" ]]
        then
            mv $file $src_fld/no_txt/
            continue
        fi
        value=$(<"$utter")
        echo  -e  ${b} '\t' $value  >> $train/text

        echo  -e  ${b} '\t' $file  >> $train/wav.scp
        echo  -e  ${b} '\t' ${b}  >> $train/utt2spk


        #echo $check
    else     
        file_name=$(basename "${file}")
        b=`echo $file_name | cut -d '.' -f1 `

        utter="`echo $file | cut -d '.' -f1 `.txt"
        if [[ ! -f "$utter" ]]
        then
            mv $file $src_fld/no_txt/
            continue
        fi

        value=$(<"$utter")
        echo  -e  ${b} '\t' $value  >> $test/text

        echo  -e  ${b} '\t' $file  >> $test/wav.scp
        echo  -e  ${b} '\t' ${b}  >> $test/utt2spk
    fi    
done

echo $check