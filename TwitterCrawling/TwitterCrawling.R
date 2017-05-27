# apps.twitter.com 에 접속하여 자신의 앱 만들기
twr <- c('twitteR', 'base64enc', 'ROAuth')
install.packages(twr, dependencies = T)
library(twitteR)
library(base64enc)
options(httr_oauth_cache = T)
#Joonhyun Choi auth key
#
setup_twitter_oauth(consumer_key = 'uriwWs86EX1RWBeQj1D5F5TTv', 
                    consumer_secret = 'Lo7AtAH7esdeEFt6DZ5Ot9RsvHoXZtmEywUVGjDSNZSMTOlSB5',
                    access_token = '179112215-PiS5oHcuD9jJ9yT29v3hF0i4tUjkL5MgMr05JCgv',
                    access_secret = 'v2AMFfNGApbs1Lr3XPg56NQ3tBsGft9O5gFqwHjN5zY42')
#인증이 잘 되었는지 확인
getCurRateLimitInfo()
## 트위터에서 키워드로 특정 트윗들을 검색하여 가져옵니다.
#retryOnRateLimit - 부하가 걸리면 몇번 정도 재시도할지 체크 
#string <- '미세먼지'
#string <- iconv(string, 'CP949', 'UTF8')
#tweets <- searchTwitter(searchString = string, n = 100, lang="ko", retryOnRateLimit = 10000)
#tweets
#text_extracted <- sapply(tweets, function(t) t$getText())
#text_extracted
### or
#tweets_df <- twListToDF(tweets)
#tweets_df$text
### 겹치는 것은 없애고싶다면?
#text_extracted <- unique(text_extracted)
#text_extracted
### 여러개의 키워드가 들어간 것을 찾고싶다면??
#string <- '미세먼지+문재인'
#string <- iconv(string, 'CP949', 'UTF8')
#tweets <- searchTwitter(searchString = string, n = 10, lang="ko", retryOnRateLimit = 10000)
## 영어로 된 데이터 분석 
###tweets <- searchTwitter(searchString = 'korea+love', n = 100)
#tweets##

# 특정 날짜 검색
string <- '미세먼지'
string <- iconv(string, 'CP949', 'UTF8')
tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-16",until = "2017-05-17")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0517.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-17",until = "2017-05-18")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0518.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-18",until = "2017-05-19")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0519.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-19",until = "2017-05-20")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0520.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-20",until = "2017-05-21")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0521.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-21",until = "2017-05-22")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0522.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-22",until = "2017-05-23")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0523.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-23",until = "2017-05-24")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0524.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-24",until = "2017-05-25")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0525.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-25",until = "2017-05-26")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0526.csv")




# 특정 날짜 검색
string <- '먼지'
string <- iconv(string, 'CP949', 'UTF8')
tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-16",until = "2017-05-17")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0517_dust.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-17",until = "2017-05-18")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0518_dust.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-18",until = "2017-05-19")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0519_dust.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-19",until = "2017-05-20")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0520_dust.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-20",until = "2017-05-21")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0521_dust.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-21",until = "2017-05-22")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0522_dust.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-22",until = "2017-05-23")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0523_dust.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-23",until = "2017-05-24")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0524_dust.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-24",until = "2017-05-25")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0525_dust.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-25",until = "2017-05-26")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0526_dust.csv")


# 미세먼지 tag 트윗 리스트 검ㅅ

string <- '#미세먼지'


string <- iconv(string, 'CP949', 'UTF8')
tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-16",until = "2017-05-17")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0517_hashtag.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-17",until = "2017-05-18")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0518_hashtag.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-18",until = "2017-05-19")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0519_hashtag.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-19",until = "2017-05-20")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0520_hashtag.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-20",until = "2017-05-21")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0521_hashtag.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-21",until = "2017-05-22")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0522_hashtag.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-22",until = "2017-05-23")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0523_hashtag.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-23",until = "2017-05-24")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0524_hashtag.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-24",until = "2017-05-25")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0525_hashtag.csv")

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-25",until = "2017-05-26")
tweets
#make data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
#write to csv file (or your RODBC code)
write.csv(df,file="twitterList_0526_hashtag.csv")




install.packages("rvest")
library(rvest)

library(httr)

url_base<-'https://twitter.com/search?f=tweets&vertical=default&q=%EB%AF%B8%EC%84%B8%EB%A8%BC%EC%A7%80&src=typd'

all.reviews<-c()

#for(page in 1:2){
  
  url<-paste(url_base, page, sep='')
  
  htxt<-read_html(url)
  
  comments<-html_nodes(htxt, 'p.TweetTextSize')
  timestamp<-html_nodes(htxt, 'small.time')
  
  #links<-html_nodes(comments, 'a')
  
  reviews<-html_text(comments)
  reviews
  
  timestamp<-html_text(timestamp)
  timestamp
  if( length(reviews)==0 ){ break }
  
  all.reviews<-c(all.reviews, reviews)
  
  print(page)
  
#}

length(all.reviews)

all.reviews


                    