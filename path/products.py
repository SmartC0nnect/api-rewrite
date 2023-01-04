import json

from flask import Flask, request, jsonify
import os
from database import db, cur

class Products():
    def __init__(self):
        try:
            db.reconnect()
        except:
            print("Could not reconnect to MYSQL")

    def getProducts(self, args):
        cur.execute(f"SELECT name, description, imageurl, actiontype FROM devicetypes")
        return {"data": cur.fetchall()}

