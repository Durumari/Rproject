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

####################################################################################################################
# 특정 날짜 검색
string <- '미세먼지+고등어'
string <- iconv(string, 'CP949', 'UTF8')
tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-29",until = "2017-05-30")
tweets


tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-30",until = "2017-05-31")
tweets

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-05-31",until = "2017-06-01")
tweets

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-06-01",until = "2017-06-02")
tweets

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-06-02",until = "2017-06-03")
tweets

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-06-03",until = "2017-06-04")
tweets

tweets <- searchTwitter(searchString = string, n = 50000, lang="ko", retryOnRateLimit = 10000,since="2017-06-04",until = "2017-06-05")
tweets


