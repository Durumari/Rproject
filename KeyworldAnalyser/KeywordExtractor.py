# -*- coding: utf-8 -*-


import pandas as pd
import datetime
from konlpy.tag import Kkma
from konlpy.utils import pprint
import operator
import csv
import gc
import jpype


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
    _firstday= 518 # 17일 data '초'가 없어서 일단 제외함.
    _lastday=527
   
    raw_data = ImportData(_directory, _prefixName, _searchingKeyword[0], _firstday, _lastday)
         

    #print(raw_data['created'])
    
    #########################################################
    #형태소 분석해서 날짜별로 키워드 빈도 추출
    #########################################################
    
  
    # 일단 string type을 datetime type으로 변환.
    convertied_date =[]
    for idx in range(0, len(raw_data)):
        convertied_date.append(datetime.datetime.strptime(raw_data['created'][idx], "%Y-%m-%d %H:%M:%S").date())
        
    raw_data['date'] = convertied_date # datatime 타입의 새로운 column 생성. 
        
    lebels, uniques = pd.factorize(raw_data['date'])
    

    # 일별로 text를 merge해서 명사 추출
    kkma = Kkma()
    
    for i in range(4, len(uniques)):
        
        dictionary_keyword ={}
        df = raw_data.loc[raw_data['date'] ==  uniques[i]]
        
        
        bunddle_text = ""
        for text in df['text']:
            
            #if temp_cnt > 3:
                #break;
            #nouns = kkma.nouns(text)
            bunddle_text +=(text + " ")
            
        nouns = kkma.nouns(bunddle_text) 
        #print(bunddle_text)
        #fn = 'test_' + str(uniques[i]) + '.txt'
        #with open(fn, 'w') as fp:
            #fp.write(bunddle_text)
        
        temp_cnt = 0
        for n in nouns:
            if n in dictionary_keyword:
                dictionary_keyword[n] += 1
            else:
                dictionary_keyword[n] = 0
            
            print('#' + str(uniques[i])+' '+ str(temp_cnt) + ' th')
            temp_cnt += 1
            
            
        sorted_x = sorted(dictionary_keyword.items(), key=operator.itemgetter(1),  reverse=True)   
       
        #csv로 저장
        writefilename = 'frequency_keyword_' + str(uniques[i]) + '.csv'
        
        with open(writefilename, 'w', newline='') as fp:
            csv_out = csv.writer(fp)
            csv_out.writerow(['keyword', 'frequency'])
      
            for i in range(0 , 500) : # 상위 500개
                csv_out.writerow(sorted_x[i])
                print(sorted_x[i])

    
         
    
    