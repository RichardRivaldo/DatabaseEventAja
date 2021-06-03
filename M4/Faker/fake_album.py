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


def random_album_name():
    words = fake.words(nb=randint(4, 100))
    title = fake.text(max_nb_chars=30, ext_word_list=words).title().replace(".", "")
    return title


def random_artist():
    cursor.execute("select count(*) from artist;")
    for queries in cursor:
        data_count = queries[0]

    return randint(1, data_count)


def random_song_amount():
    return randint(6, 12)


def random_year():
    return str(randint(1980, 2021))


for i in range(10000):
    cursor.execute(
        "insert into album(album_name, artist_id, song_amount, released_year) values (?, ?, ?, ?);",
        (
            random_album_name(),
            random_artist(),
            random_song_amount(),
            random_year(),
        ),
    )

cursor.execute("select count(*) from album;")

for queries in cursor:
    data_count = queries[0]

if data_count > 10000:
    print(data_count)
    connection.commit()

connection.close()

print("done")
