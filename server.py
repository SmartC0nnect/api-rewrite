# write an API server
# reference: https://www.youtube.com/watch?v=U6XAPnuFjJc
import flask
from flask import Flask, request, jsonify
from flask_cors import CORS


import os
from path.controller import Controller
from path.products import Products
from path.users import Users


# Init app
app = Flask(__name__)
CORS(app)
#app.config['CORS_HEADERS'] = 'Content-Type'
basedir = os.path.abspath(os.path.dirname(__file__))


'''
Controller

'''
@app.route('/controller/updatedata/<key>/<type>', methods=['GET'])
def updateData(key, type):
    data = Controller().updateData(key, type, request.args)
    return data
@app.route('/controller/getdata/<key>/<type>', methods=['GET'])
def getData(key, type):
    data = Controller().getData(key, type, request.args)
    return data


'''
Website data

'''
@app.route('/products/getProducts', methods=['GET'])
def getProducts():
    data = Products().getProducts(request.args)
    return data


'''
User management

'''
@app.route('/users/<userid>/devices', methods=['GET'])
def getDevices(userid):
    data = Users().getDevices(userid, request.args)


    return data


if __name__ == '__main__':
    app.run(debug=True, host='192.168.178.200', port=3000)

