import datetime
import psycopg2
import mimesis
import random
from mimesis import Person
from mimesis.locales import Locale
from mimesis.enums import Gender
from mimesis.builtins import RussiaSpecProvider


def main():
    conn = psycopg2.connect(host="localhost",
                            database="postgres",
                            user="postgres",
                            password="postgres")
    cur = conn.cursor()

    # Pass data to fill a query placeholders and let Psycopg perform
    # the correct conversion (no more SQL injections!)

    # Query the database and obtain data as Python objects

    for id in range(1, 1001):
        gender = random.choice([Gender.MALE, Gender.FEMALE])
        person = Person(Locale.RU)
        ru = RussiaSpecProvider()
        gl = mimesis.Generic(Locale.RU)
        name, surname = person.full_name(gender=gender).split(" ")
        patronymic = ru.patronymic(gender)
        birthday = gl.datetime.date(start=1980, end=2010)
        prof = person.occupation()
        nation = person.nationality(gender)
        phone_number = person.phone_number()
        email = person.email()
        book_count = random.randint(0, 100)
        cur.execute(
            "INSERT INTO Users (idUser, Surname, Name, Patronymic, Birthday, Profession, Nationality, PhoneNumber, Email, BookCount) VALUES (%s, %s, %s, %s, %s, %s,%s, %s, %s, %s)",
            (id, surname, name, patronymic, birthday, prof, nation,
             phone_number, email, book_count))

    cur.execute("SELECT * FROM Users;")
    print(cur.fetchall())

    # Make the changes to the database persistenT
    conn.commit()
    cur.close()
    conn.close()


if __name__ == "__main__":
    main()
