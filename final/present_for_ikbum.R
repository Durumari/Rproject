dat = read.csv("WordCloud.csv", header = TRUE)
dat
#Generate the word cloud
library(RColorBrewer); library(wordcloud)
wordcloud(words=dat$Word, freq=dat$Freq, min.freq=10,
          random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8,"Dark2"))


lm_and_corr = read.csv("lm_and_cor.csv", header = TRUE)
#lm_and_corr$dust
#lm_and_corr$key1
#lm_and_corr$key2

#key1 and dust
#lm 
lm_data1 = lm(lm_and_corr$dust~lm_and_corr$key1)
lm_data1
summary(lm_data1)

#corr
rtest1 = cor.test(lm_and_corr$dust,lm_and_corr$key1)
rtest1

r = rtest1$estimate
a = 0.05; df2 = rtest$parameter; t.crit=qt(1-a/2,df2)
#t.cal=r*sqrt(df2)/sqrt(1-r*r)
t.cal = rtest1$statistic
cat("t.cal =",t.cal,"t.crit =",t.crit,"\n")
cat("P-value =",rtest$p.value,"\n")


#key2 and dust
#lm 
lm_data2 = lm(lm_and_corr$dust~lm_and_corr$key2)
lm_data2
summary(lm_data2)

#corr
rtest2 = cor.test(lm_and_corr$dust,lm_and_corr$key2)
rtest2

r = rtest2$estimate
a = 0.05; df2 = rtest$parameter; t.crit=qt(1-a/2,df2)
#t.cal=r*sqrt(df2)/sqrt(1-r*r)
t.cal = rtest2$statistic
cat("t.cal =",t.cal,"t.crit =",t.crit,"\n")
cat("P-value =",rtest$p.value,"\n")
