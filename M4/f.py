from faker import Faker
import numpy as np
import mysql.connector as mariadb

faker = Faker()

def addMerch(mID, cID, merch_name, type, price):
    try:
            connection = mariadb.connect(user=username,password=password,host='localhost',database='EventAja', port ='3306')
            cursor = connection.cursor()
            query = """INSERT INTO merchandise
                            (merch_ID, concert_ID, merch_name, type, price)
                            VALUES (%s,%s,%s,%s,%s)"""
            tuple = (str(mID),str(cID),merch_name,type,str(price))
            # print(str(mID),str(cID),merch_name,type,price)
            cursor.execute(query,tuple)
            connection.commit()
    except mariadb.Error as error:
        print("Failed insert user data {}".format(error))
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

# MAIN

name = ['Stickers','Patches','Guitar Picks','Keychains','Tote Bags','Beanies Hat','Posters', 'Shoes', 'Glove', 'Spectacles', 'Socks', 'T-shirt', 'Bracelet']
type = ['official','unofficial']
concertID = [i for i in range (10,10002)]

price = []
for i in range (1,201,5):
    price.append(i*2500)

username = 'planties'
password = '12345678'

for i in range (10001,10101):
    cID = str(np.random.choice(concertID))
    nm = str(np.random.choice(name))
    tp = str(np.random.choice(type))
    pr = str(np.random.choice(price))
    addMerch(i,cID,nm,tp,pr)