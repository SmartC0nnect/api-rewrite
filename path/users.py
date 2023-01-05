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
        print(userid)
        cur.execute(f"SELECT devicetype, name, deviceid FROM devices WHERE userid = %s", (userid,))
        data = cur.fetchall()

        cur.execute(f"SELECT * FROM devicetypes")
        devices = cur.fetchall()

        newdata = []
        for x in data:
            for y in devices:
               if x[0] == y[0]:
                   newdata.append([x[1], x[2], list(y)])


        return {"devices": newdata}
