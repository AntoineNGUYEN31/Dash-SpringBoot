from random import randint
from time import time
import requests

masterMarker=["Exploitation","Integration","Validation"]
detailMarker=["Compilation","Copy","Backup","CVStag"]
myURL='http://localhost:8080/database/'

def httpPOST(myURL,myLOGIN,myDATA):
  data={"userLogin":myLOGIN,"userData":str(myDATA)}
  response = requests.post(myURL, json=data)
  #print(response.status_code)


if __name__=="__main__":
  for j in range(1,6):
    myLOGIN="user%d"%(j)
    myDATA=[]
    for i in range(1,randint(5,20)):
      temp={}
      temp["label"]=masterMarker[randint(0,len(masterMarker)-1)]
      temp["epoch"]=int(time())+i
      temp["Total"]=randint(3,120)
      rest=temp["Total"]
      for e in detailMarker:
        temp[e]=rest*randint(0,100)/100.
        rest=rest-temp[e]
      temp["Other"]=rest
      myDATA.append(temp)
    #POST data
    httpPOST(myURL,myLOGIN,myDATA)
