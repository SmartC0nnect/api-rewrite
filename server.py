# write an API server
# reference: https://www.youtube.com/watch?v=U6XAPnuFjJc

from flask import Flask, request, jsonify

import os

# Init app
app = Flask(__name__)
basedir = os.path.abspath(os.path.dirname(__file__))



# Get Single Product
@app.route('/product/<id>', methods=['GET'])
def get_product(id):
    return product_schema.jsonify(product)

