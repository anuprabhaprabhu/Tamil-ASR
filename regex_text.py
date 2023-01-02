import re
import fileinput



# punct = '!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~'
num2str = {'1':'one ', '2':'two ', '3':'three ', '4':'four ', '5':'five ', '6':'six ','7':'seven ', '8':'eight ', '9':'nine ', '10':'ten '}
with fileinput.FileInput('test_text', inplace=True, backup='.bak') as f:
    # lines = f.readlines()

    for l in f:
        k, v = l.split('\t')
        y = re.sub(r"[^a-zA-Z\d\s:]", '', v)
        y = re.sub(r"[0-9]", lambda a: num2str[a.group()], y)
        print(l.replace(v, y.lower()), end='')


