import json

from flask import Flask, request, jsonify
import os
from database import db, cur

class Controller():
    def __init__(self):
        try:
            db.reconnect()
        except:
            print("Could not reconnect to MYSQL")

    def updateData(self, key, type, args):
        value1 = args.get("value1")
        value2 = args.get("value2")

        cur.execute(f"INSERT INTO sensordata (deviceKey, type, value1, value2) VALUES (%s, %s, %s, %s) "
                    f"ON DUPLICATE KEY UPDATE value1=%s, value2=%s", (key, type, value1, value2, value1, value2))
        return {"status": 200}



    def getData(self, key, type, args):

        cur.execute(f"SELECT * FROM connections WHERE actor = %s", (key,))
        actors = cur.fetchall()

        if type == "actor:2led":
            value1 = self.checkCases(actors[0][1])
            value2 = self.checkCases(actors[0][2])
            print(f"value1: {value1}")
        else:

            return {"status": 501}

        return [{"value1": value1, "value2": value2}]



    def checkCases(self, actor):
        if actor:
            actor = json.loads(actor)
            passCheck = 0

            for case in actor["cases"]:
                returnValue = case["value"]

                for sensor in case["sensors"]:
                    index = 1 # mysql index start (-1)
                    sensor["value"] = sensor["value"]+index

                    cur.execute(f"SELECT * FROM sensordata WHERE deviceKey = %s", (sensor["key"],))
                    sensorData = cur.fetchall()
                    print(f"sensordata: {sensorData[0][sensor['value']]}")
                    if sensorData[0][sensor["value"]] and str(sensorData[0][sensor["value"]]).isdigit():
                        if sensor["min"] != -1:
                            if int(sensorData[0][sensor["value"]]) >= sensor["min"]:
                                passCheck = 1
                            else:
                                passCheck = 0
                    if sensorData[0][sensor["value"]] and str(sensorData[0][sensor["value"]]).isdigit():
                        if sensor["max"] != -1:
                            if int(sensorData[0][sensor["value"]]) <= sensor["max"]:
                                passCheck = 1
                            else:
                                passCheck = 0

                if passCheck:
                    return returnValue
