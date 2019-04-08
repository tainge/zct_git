import  re

a = '.*?\-\-|.*?\'|.*?\"|.*?\!|.*?\@|.*?\%27|.*?\#|.*?\^|.*?\=|.*?\<|.*?\>|'

# print(a[:-1])

b = "GET /sqlilabs/Less-1/index.php?id HTTP/1.1\r\nAccept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, */*\r\nAccept-Language: zh-cn\r\nAccept-Encoding: gzip, deflate\r\nUser-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)\r\nHost: 10.60.13.39\r\nConnection: Keep-Alive\r\n\r\n"
b1 = b"GET /sqlilabs/images/Less-1.jpg HTTP/1.1\r\nAccept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, */*\r\nAccept-Language: zh-cn\r\nAccept-Encoding: gzip, deflate\r\nUser-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)\r\nHost: 10.60.13.39\r\nConnection: Keep-Alive\r\n\r\n"

print(re.search('.*?\-\-', b))
# print(re.search(a[:-1].encode(), b1))

