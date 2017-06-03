# -*- coding: utf-8 -*-


import pandas as pd
import datetime
from konlpy.tag import Kkma
from konlpy.utils import pprint
import operator
import csv


def ImportData(directory, prefixName,searchingKeyword, year, firstday, lastday):
    data_for_days = []
 
    from_date = datetime.datetime.strptime(str(year)+str(firstday), "%Y%m%d").date()
    to_date = datetime.datetime.strptime(str(year)+str(lastday), "%Y%m%d").date()
    
    delta = to_date - from_date
    
    list_between_days = []
    for i in range(0, delta.days + 1):
        list_between_days.append(from_date + datetime.timedelta(days=i))
    
    print(list_between_days)
    
      #날짜 범위 입력 
    #for i in range (firstday, lastday):

    for d0 in list_between_days:
        
        strDate = "{:02d}".format(d0.month) + "{:02d}".format(d0.day)
        #day = "{:04d}".format(i)
        print(strDate)
        filepath = directory + prefixName  + searchingKeyword + '_' + strDate +'.csv'
                
        #ufilepath = filepath.encode('CP949')
   
        print(filepath)                
        data = pd.read_csv(filepath, encoding='CP949') # encoding for korean.
        
        data_for_days.append(data)
    
    return pd.concat(data_for_days, ignore_index = True) 

if __name__ == "__main__":
    
    #########################################################
    # raw data import
    #########################################################
    _directory = '../TwitterCrawling/twitterData_0601/'
    #_directory = '../TwitterCrawling/'
    
    _prefixName = u'twitterlist'
    #_prefixName = u'twitterlist'
    
    '''
    _list_searchingKeyword = ['_kangnamyeock', '_angoo', '_baljeonso', '_gongichungjunggi',
                              '_hwangsa', '_kyeonyucha', '_mask','_muckum', '_muckutda', '_joonggook', '_miyeockgook'
                              ,'_samgyeopsal']
    '''
    '''
    _list_searchingKeyword = ['_kangnamyeock', '_angoo', '_baljeonso', '_gongichungjunggi',
                              '_hwangsa', '_kyeonyucha', '_mask','_muckum', '_muckutda']
    '''
    _list_searchingKeyword = ['_miyeockgook','_samgyeopsal', '_joonggook']
    
    _year = 2017
    _firstday = 525 
    _lastday = 531  # 폐구간 [firstday, lastday]

    
    for kw in _list_searchingKeyword:
        raw_data = ImportData(_directory, _prefixName, kw, _year, _firstday, _lastday) 
        #print(raw_data)
    
        #print(raw_data['created'])
        
        #########################################################
        #형태소 분석해서 날짜별로 키워드 빈도 추출
        #########################################################
        
        print('$All data is imported.')
        # 일단 string type을 datetime type으로 변환.
        convertied_date =[]
        prevtime = datetime.datetime(2010, 9, 12, 11, 19, 54)
        #print(prevtime)
        for idx in range(0, len(raw_data)):
            print(str(idx) + "th ")
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
            print(sorted_x)
            writefilename = 'frequency_keyword_' +_prefixName +kw + '_' +str(uniques[i]) + '.csv'
            
             # csv로 저장
            with open(writefilename, 'w', newline='') as fp:
                csv_out = csv.writer(fp)
                csv_out.writerow(['keyword', 'frequency'])
         
                if len(sorted_x) > 500:
                    max = 500
                else:
                    max = len(sorted_x)
                    
                for i in range(0 , max) : # 최대 상위 500개
                    csv_out.writerow(sorted_x[i])
                    print(sorted_x[i])

    
         
    
    