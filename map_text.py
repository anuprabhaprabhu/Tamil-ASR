with open('file1_te') as f:
    word_mapper = {}
    for line in f.readlines():
        key, val = line.strip().split()
        word_mapper[key] = val

with open('file2_te') as f:
    input_lines = f.readlines()

f = open('file3_te', 'w')
for line in input_lines:
    line = line.strip().split()
    line = [word_mapper[word] for word in line if word in word_mapper]
    f.write(" ".join(line) + "\n")
f.close()

print("completed !!!!")