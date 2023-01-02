# write an API server
# reference: https://www.youtube.com/watch?v=U6XAPnuFjJc

from flask import Flask, request, jsonify

import os
from controller import Controller


# Init app
app = Flask(__name__)
basedir = os.path.abspath(os.path.dirname(__file__))

@app.route('/controller/updatedata/<key>/<type>', methods=['GET'])
def updateData(key, type):
    data = Controller().updateData(key, type, request.args)
    return data
@app.route('/controller/getdata/<key>/<type>', methods=['GET'])
def getData(key, type):
    data = Controller().getData(key, type, request.args)
    return data


if __name__ == '__main__':
    app.run(debug=True, host='192.168.178.200', port=3000)

