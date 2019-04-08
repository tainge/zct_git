#encoding:utf-8
from flask import Flask
from flask import request, render_template
from check import sql

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def search():
    if request.method == 'GET':
        return render_template('index.html')
    elif request.method == 'POST':
        keyword = request.form.get('keyword')
        sql.main(keyword)
        # return render_template('musicList.html')
        # items = HighMusicSearch.HighSearch(keyword)
        # if items != None:
        #     return render_template('list.html', list=items)
        # else:
        #     return '找不到！！！不支持英文'
    else:
        return render_template('404.html')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)

