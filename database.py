import mysql
from mysql import connector

db = connector.connect(
    host="localhost",
    user="root",
    password="",
    port=3306,
    database="smartconnect",
    autocommit=True

)
cur = db.cursor()

