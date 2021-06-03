import sys
import mariadb
from faker import Faker
from random import randint

# Establish a connection to MySQL Local Server
try:
    connection = mariadb.connect(
        user="root",
        password="",
        host="localhost",
        port=3306,
        database="eventaja",
    )
except mariadb.Error as error:
    print("Error Connection")
    sys.exit()

# Get cursor + faker
cursor = connection.cursor()
fake = Faker()

# Random Gender Generator
def random_gender():
    rand = randint(0, 1)
    if rand:
        return "Male"
    return "Female"


# Random Genre Generator
def random_genre():
    rand = randint(0, 5)
    if rand == 0:
        return "Electronic"
    elif rand == 1:
        return "Rock"
    elif rand == 2:
        return "Jazz"
    elif rand == 3:
        return "R&B"
    elif rand == 4:
        return "Pop"
    else:
        return "Blues"


# cursor.execute("select * from merchandise")
# for queries in cursor:
#     print(queries)

# cursor.execute("select * from user")
# for queries in cursor:
#     print(queries)

for i in range(10000):
    gender = random_gender()
    if gender == "Male":
        cursor.execute(
            "insert into artist(artist_name, gender, country, genre) values (?, ?, ?, ?);",
            (
                fake.name_male(),
                gender,
                fake.country(),
                random_genre(),
            ),
        )
    else:
        cursor.execute(
            "insert into artist(artist_name, gender, country, genre) values (?, ?, ?, ?);",
            (
                fake.name_female(),
                gender,
                fake.country(),
                random_genre(),
            ),
        )

cursor.execute("select count(*) from artist;")

for queries in cursor:
    data_count = queries[0]

if data_count > 10000:
    print(data_count)
    connection.commit()

connection.close()

print("done")
