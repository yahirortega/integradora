import mysql.connector

def get_connection():
    mydb = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        db='prestamos1_3'
    )
    return mydb  



