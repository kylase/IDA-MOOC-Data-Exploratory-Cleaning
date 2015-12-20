library(tm)

sample = c('There is “something” going on right now, like right… now. He’s there.', 
           'There is "something" going on right now, like right... now. He\'s there.')

corpus = VCorpus(VectorSource(sample), readerControl = list(reader = readPlain))

# NLP's Bigram Tokeniser
NLPBigramTokenizer <- function(x) {
  unlist(lapply(ngrams(words(x), 2), paste, collapse = " "), use.names = FALSE)
}

dtm_nlp = DocumentTermMatrix(corpus, control = list(tokenize = NLPBigramTokenizer))
inspect(dtm_nlp)
dtm_nlp_mat = as.data.frame(colSums(as.matrix(dtm_nlp)))

# RWeka's Bigram Tokeniser
library(RWeka)
WekaBigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))

dtm_weka = DocumentTermMatrix(corpus, control = list(tokenize = WekaBigramTokenizer))
inspect(dtm_weka)
dtm_weka_mat = as.data.frame(colSums(as.matrix(dtm_weka)))
