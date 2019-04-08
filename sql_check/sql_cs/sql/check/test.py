from scapy.all import *
import re
import datetime


file = open(r'C:\Users\360\Desktop\sql_cs\sql\check\check.txt','r')
a =""
b =""
for i in file:
    b += i.strip()
    a += r".*?"+i.strip()+r"|"

#print(a)
#print(b)

def pktPrint(pkt):
    if pkt.haslayer("Raw"):
        if(re.search(a[:-1].encode(),pkt["Raw"].load)):
            j = datetime.datetime.now()
            with open('attack.log','a+') as f:
                f.write("正受到攻击！\n 攻击时间\t $s \n "%(str(j))+"内容："+str(pkt["Raw"].load,encoding="utf8").split("\r\n")[0]+"\n" )
            print("注入")



def main(obj):
    conf.iface  = 'Realtek PCIe GBE Family Controller' #指定网卡
    sniff(count=0,filter='dst port 80 and ip dst 10.60.13.29 and tcp', prn=pktPrint)