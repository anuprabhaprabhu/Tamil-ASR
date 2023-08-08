import os
import pandas as pd

# load text file into  
with open('text') as f:
    word_mapper = {}
    for line in f.readlines():
        key, val = line.strip().split('\t')
        word_mapper[key] = val

    # print(word_mapper)

for i in word_mapper:
    # print(i, word_mapper[i])
    f = open(i+'.txt', 'w')
    f.write(word_mapper[i])
    f.close
    
print('completed !!!!!!!!')