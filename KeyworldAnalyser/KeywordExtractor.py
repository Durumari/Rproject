# -*- coding: utf-8 -*-


import pandas as pd
import datetime
from konlpy.tag import Kkma
from konlpy.utils import pprint
import operator
import csv


def ImportData(directory, prefixName,searchingKeyword, firstday, lastday):
    data_for_days = []
 
      #날짜 범위 입력 
    for i in range (firstday, lastday):
        day = "{:04d}".format(i)
        filepath = directory + prefixName + '_' + day + searchingKeyword +'.csv'
                
        data = pd.read_csv(filepath, encoding='CP949') # encoding for korean.
    
        data_for_days.append(data)
    
    return pd.concat(data_for_days, ignore_index = True) 

if __name__ == "__main__":
    
    #########################################################
    # raw data import
    #########################################################
    _directory = '../TwitterCrawling/'
    _prefixName = 'twitterlist'
    _searchingKeyword = ['', '_dust']
    _firstday= 517 # 17일 data '초'가 없어서 일단 제외함.
    _lastday=518
   
    raw_data = ImportData(_directory, _prefixName, _searchingKeyword[0], _firstday, _lastday)
         

    #print(raw_data['created'])
    
    #########################################################
    #형태소 분석해서 날짜별로 키워드 빈도 추출
    #########################################################
    
  
    # 일단 string type을 datetime type으로 변환.
    convertied_date =[]
    prevtime = datetime.datetime(2010, 9, 12, 11, 19, 54)
    print(prevtime)
    for idx in range(0, len(raw_data)):
        
        if len(str(raw_data['created'][idx])) <= len('0000-00-00 00:00'):
            print(raw_data['created'][idx])
            convertied_date.append(datetime.datetime.strptime(raw_data['created'][idx], "%Y-%m-%d %H:%M").date())
            #prevtime = datetime.datetime.strptime(raw_data['created'][idx], "%Y-%m-%d %H:%M").date()
           # print(datetime.datetime.strptime(raw_data['created'][idx], "%Y-%m-%d %H:%M").date())
        elif len(str(raw_data['created'][idx])) <= len('0000-00-00 00:00:00'):
            print(raw_data['created'][idx])
            convertied_date.append(datetime.datetime.strptime(raw_data['created'][idx], "%Y-%m-%d %H:%M:%S").date())
            #prevtime = datetime.datetime.strptime(raw_data['created'][idx], "%Y-%m-%d %H:%M").date()
            #print(datetime.datetime.strptime(raw_data['created'][idx], "%Y-%m-%d %H:%M").date())
        #else:
            #convertied_date.append(prevtime) #현재 레코드의 시간이 엉뚱하게 저장되어있을 경우 그냥 이전값으로. 
            
        
            
    
    #print(0)
    #print (convertied_date)
    
    #print(len(raw_data['created']))
    #print(len(convertied_date))
    raw_data['date'] = convertied_date # datatime 타입의 새로운 column 생성. 
    #print(1)
    lebels, uniques = pd.factorize(raw_data['date'])
    #print(uniques)

    # 일별로 text를 merge해서 명사 추출
    
    kkma = Kkma()
    for i in range(0, len(uniques)):
        print(str(uniques[i]))
        dictionary_keyword ={}
        df = raw_data.loc[raw_data['date'] ==  uniques[i]]
        
        temp_cnt = 0
        for text in df['text']:
            temp_cnt += 1            
            #if temp_cnt < 2260:
                #continue;
           
            print('#' + str(uniques[i])+' '+ str(temp_cnt) + ' th')
            #print(text)
            nouns = kkma.nouns(text)
            
            for n in nouns:
                if n in dictionary_keyword:
                    dictionary_keyword[n] += 1
                else:
                    dictionary_keyword[n] = 0
            
            
            
            
       
        sorted_x = sorted(dictionary_keyword.items(), key=operator.itemgetter(1),  reverse=True)   
        
        writefilename = 'frequency_keyword_' + str(uniques[i]) + '.csv'
        
         # csv로 저장
        with open(writefilename, 'w', newline='') as fp:
            csv_out = csv.writer(fp)
            csv_out.writerow(['keyword', 'frequency'])
      
            for i in range(0 , 500) : # 상위 500개
                csv_out.writerow(sorted_x[i])
                print(sorted_x[i])

    
         
    
    