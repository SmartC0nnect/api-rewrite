import json

from flask import Flask, request, jsonify
import os
from database import db, cur

class Users():
    def __init__(self):
        try:
            db.reconnect()
        except:
            print("Could not reconnect to MYSQL")


    def getDevices(self, userid, args):

        cur.execute(f"SELECT devicetype, name FROM devices WHERE userid = %s", (userid,))
        devices = cur.fetchall()

        if type == "actor:2led":
            value1 = self.checkCases(actors[0][1])
            value2 = self.checkCases(actors[0][2])
            print(f"value1: {value1}")
        else:

            return {"status": 501}

        return [{"value1": value1, "value2": value2}]
