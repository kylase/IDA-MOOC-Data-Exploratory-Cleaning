import nltk, io
from nltk.tokenize import sent_tokenize, word_tokenize
from nltk import bigrams, trigrams, ngrams

def tokenise(n, file_path):
    f = io.open(file_path, encoding = 'utf8')
    content = f.read()
    sentence_tokens_list = [ngrams(word_tokenize(sentence), n) for sentence in sent_tokenize(content)]
    gram_list = []

    for sentence_tokens in sentence_tokens_list:
        for token in sentence_tokens:
            gram_list.append(token)

    return gram_list
