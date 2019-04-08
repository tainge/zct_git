#encoding:utf-8
import smtplib
from email.mime.text import MIMEText
from email.header import Header

def sendmail():
    host_server = 'smtp.163.com'
    port = 25
    sender = '发送邮箱@163.com'
    receiver = '收件箱@qq.com'
    pwd = '发送邮箱的密码'
    mail_content = '你的网站正在被注入'
    mail_title = '注入邮件'

    smtp = smtplib.SMTP_SSL(host_server)
    smtp.set_debuglevel(1)
    smtp.ehlo(host_server)
    smtp.login(sender,pwd)

    msg = MIMEText(mail_content,'plain','utf-8')
    msg['Subject'] = Header(mail_title,'utf-8')
    msg['From'] = sender
    msg['To'] = receiver
    smtp.sendmail(sender,receiver,msg.as_string())
    smtp.quit()
