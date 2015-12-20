#!/usr/bin/python

from python_tokenise import tokenise
from nltk.probability import FreqDist

grams = tokenise(2, 'str3.txt')

fd = FreqDist(grams)

for gram, count in fd.items():
    print unicode(' '.join(gram[0:-1])).encode("utf8"), unicode(gram[-1]).encode("utf8"), str(count)
