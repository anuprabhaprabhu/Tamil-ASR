#! /usr/bin/bash


readarray -t my_array < <(jq -c '.[]' data.json)

# iterate through the Bash array
for item in "${my_array[@]}"; do
    #file_name=$(jq '.audioFilename' <<< "$item")
    a=`echo $(jq '.audioFilename' <<< "$item") | cut -c 2- | cut -d '.' -f1 `
    b=`echo $(jq '.text' <<< "$item") `
    echo  -e  ${a} '\t' ${b}   >> text
done