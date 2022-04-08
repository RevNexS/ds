install.packages('sofa')

library('sofa')

x<-Cushion$new()

X$ping()

db_create(x,dbname=’tycs’)
db_list(x)

#create json doc
doc1<-'{"rollno":"01","name":"ABC","GRADE":"A"}'
doc_create(x,doc1,dbname = "tycs",docid = "a_1")
doc2<-'{"rollno":"02","name":"PQR","GRADE":"A"}'
doc_create(x,doc2,dbname = "tycs",docid = "a_2")
doc3<-'{"rollno":"03","name":"xyz","GRADE":"B","REMARK":"PASS"}'
doc_create(x,doc3,dbname = "tycs",docid = "a_3")

#CHANGES FEED
db_changes(x,”tycs”)

#search for id > null so all docs will display
db_query(x,dbname = “tycs”,
         selector = list('_id'=list('$gt'=NULL)))$docs

#search for students with grade is A
db_query(x,dbname = “tycs”,selector = list(GRADE="A"))$docs

#search for students with remark =pass
db_query(x,dbname = “tycs”,selector = list(REMARK="PASS"))$docs

#return only certain fields where rollno>2
db_query(x,dbname = “tycs”,selector = list(rollno=list('$gt'='02')),fields=c("name","GRADE"))$docs

#convert the result of a query into a data frame using jsonlite
library("jsonlite")
res<-db_query(x,dbname = “tycs”,selector = 
                list('_id'=list('$gt'=NULL)),fields=c("name","rollno","GRADE","REMARK"),as="json")

#display json doc
fromJSON(res)$docs

#doc_delete(cushion,dbname,docid)
doc_delete(x,dbname = “tycs”,docid = "a_2")
doc_get(x,dbname = “tycs”,docid = "a_2")

