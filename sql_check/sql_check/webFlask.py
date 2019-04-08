#encoding:utf-8
from flask import Flask
from flask import request, render_template
from check import sql

app = Flask(__name__)

ipaddress = ""
port = ""

@app.route('/', methods=['GET', 'POST'])
def search():
    if request.method == 'GET':
        return render_template('demo.html')
    elif request.method == 'POST':
        ipaddress = request.form.get('ipaddress')
        port = request.form.get('port')
        # return render_template('abc/a.html')
        return render_template('abc/a.html',ipaddress=ipaddress,port=port)
    else:
        return render_template('404.html')

@app.route('/abc', methods=['GET', 'POST'])
def abc():
    if request.method == 'POST':
        ipaddress = request.form.get('ipaddress')
        port = request.form.get('port')
        sql.main(ipaddress,port)

if __name__ == '__main__':
    app.run(host='10.60.13.29',port=5000,debug=True)

