from scapy.all import *
import re
import datetime
import time
import sendMail



file = open(r'C:\Users\360\Desktop\sql\check\check.txt', 'r') #正则匹配SQL 注入危险字符
a = ""
for i in file:
    a += r".*?"+i.strip()+r"|"
print (a)

def pktPrint(pkt):
    oldtime = ""
    newtime = ""
    oldstr = ""
    if pkt.haslayer("Raw") and  pkt.haslayer("IP"):   #如果在脚本里面，需要对DNS应答包进行判断，如果包含DNS层，那么表示DNS应答是有效的，可以使用haslayer()方法
        if(re.search(a[:-1].encode(), pkt["Raw"].load)):    #返回值为1，表示有DNS数据层，那么定位p数据包中的DNS，使用getlayer()方法
            # print(pkt["Raw"].load)
            ipsrc = pkt.getlayer("IP").src
            j = datetime.datetime.now()
            with open('attack.log','a+')as f:
                f.write("[!]您正在被攻击！\n [*]攻击时间是\t%s\n"%(str(j))+"内容:"+str(pkt["Raw"].load, encoding = "utf8").split("\r\n")[0]+"\n")
            print("注入")
            f = open(r"C:\Users\360\Desktop\sql\ipsrc.log","r")
            for s in f.readlines():
                s = s.strip()
                if(re.search(ipsrc,s)):
                    oldstr = s
            f.close()
            if(oldstr != ""):
                oldtime = str(re.findall(r"time:(.*)ip", oldstr)[0])
            else:
                oldtime = 0
            newtime = int(time.time())
            if(int(newtime)-int(oldtime) > 1800):
                sendMail.sendmail()
            with open(r"C:\Users\360\Desktop\sql\ipsrc.log","a+") as f:
                f.write("time:"+str(newtime)+"ip:"+ipsrc+"\n")

def main(ipaddress,port):
    # conf.iface = 'VMware Virtual Ethernet Adapter for VMnet8' #指定网卡
    # conf.iface = 'Npcap Loopback Adapter' #指定网卡
    conf.iface = 'Realtek PCIe GBE Family Controller' #指定网卡
    sniff(count=0, filter='dst port '+port+' and ip dst '+ipaddress+' and tcp', prn=pktPrint)


# if __name__ == '__main__':
#     main()