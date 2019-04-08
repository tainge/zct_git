# coding:utf-8
# author: WenR0

import os
import re
import subprocess


def load_php_opcode(phpfilename):
    """
    获取php opcode 信息
    :param phpfilename:
    :return:
    """
    try:
        output = subprocess.check_output(['php.exe', '-dvld.active=1', '-dvld.execute=0', phpfilename], stderr=subprocess.STDOUT)
        # -dvld.active=1 是 VLD 的基础参数，表示激活 VLD 模式。dvld.execute=0，表示只显示中间代码，不执行生成的中间代码。
        tokens = re.findall(r'\s(\b[A-Z_]+\b)\s', output)
        # \babc\b匹配的是"abc",\sabc\s匹配的不是"abc", 前后还带空格" abc "
        t = " ".join(tokens)
        # Python join() 方法用于将序列中的元素以指定的字符连接生成一个新的字符串。
        return t
    except:
        return " "



def recursion_load_php_file_opcode(dir):
    """
    递归获取 php opcde
    :param dir: 目录文件
    :return:
    """
    files_list = []
    for root, dirs, files in os.walk(dir):
        #文件夹本身地址，目录，文件
        for filename in files:
            if filename.endswith('.php'):
                try:
                    full_path = os.path.join(root, filename)
                    file_content = load_php_opcode(full_path)
                    print "[Gen success] {}".format(full_path)
                    print '--' * 20
                    files_list.append(file_content)
                except:
                    continue
    return files_list