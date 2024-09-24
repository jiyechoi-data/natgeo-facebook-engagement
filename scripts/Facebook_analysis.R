# Load required libraries
library(tm)
library(Rfacebook)
library(wordcloud)
library(SnowballC)
library(lda)

# Step 1: Facebook API Data Collection
token <- "YOUR_FACEBOOK_API_TOKEN"
N_timeline <- getPage(page = "NatGeo", token, n = 2000)
test <- N_timeline$message
test <- test[!is.na(test)]

# Step 2: Text Cleaning
myCorpus <- Corpus(VectorSource(test))
myCorpus <- tm_map(myCorpus, content_transformer(tolower))
myCorpus <- tm_map(myCorpus, removePunctuation)
myCorpus <- tm_map(myCorpus, removeNumbers)
myCorpus <- tm_map(myCorpus, removeWords, stopwords("english"))

# Step 3: Word Cloud
TDM <- TermDocumentMatrix(myCorpus, control=list(wordLengths=c(2, Inf)))
m <- as.matrix(TDM)
wordFreq <- sort(rowSums(m), decreasing=TRUE)
wordcloud(words=names(wordFreq), freq=wordFreq, scale=c(5, 0.5), min.freq=40)

# Step 4: Bar Plot
barplot(subset(wordFreq, wordFreq>=40), las=2)

# Step 5: Clustering (Dendrogram)
plot(hclust(dist(wordFreq)))

# Step 6: Topic Modeling (LDA)
corpusLDA <- lexicalize(myCorpus)
ldaModel <- lda.collapsed.gibbs.sampler(corpusLDA$documents, K=10, vocab=corpusLDA$vocab, burnin=9999, num.iterations=1000, alpha=1, eta=0.1)
top.words <- top.topic.words(ldaModel$topics, 10, by.score=TRUE)
