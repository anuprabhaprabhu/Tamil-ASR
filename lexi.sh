 #! /usr/bin/bash

unique_words=$1
desti=$2
code=$3

words_file=$(cat $unique_words)  #read unique words
for word in $words_file
do
   
    valgrind ./unified-parser "$word" 1 0 0 0    #code is not working
    value=$(<wordpronunciation)
    echo "$value"
    echo -e $word '\t' ${value:24:-9} | sed 's/\" "/ /g' | sed 's/\" ) 0) (( "/ /g'  >> $desti
    #break  # remove
done
