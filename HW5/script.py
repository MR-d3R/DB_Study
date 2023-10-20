import psycopg2
import mimesis


def main():
    conn = psycopg2.connect(host="localhost",
                            database="postgres",
                            user="postgres",
                            password="postgres")
    cur = conn.cursor()

    # Pass data to fill a query placeholders and let Psycopg perform
    # the correct conversion (no more SQL injections!)

    # Query the database and obtain data as Python objects

    cur.execute(
        "CREATE TABLE Users (idUser serial PRIMARY KEY, Surname VARCHAR(15) NOT NULL, Name VARCHAR(15) NOT NULL, Patronymic VARCHAR(15), Birthday DATE NOT NULL, Profession VARCHAR(50) NOT NULL, Nationality VARCHAR(15) NOT NULL, PhoneNumber VARCHAR(11), Email VARCHAR(40), BookCount INTEGER);"
    )
    cur.execute(
        "INSERT INTO Users (IdUset, Surname, Name, Patronymic, Profession, Nationality, PhoneNumber, Email, BookCount) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)",
        (1, "Durov", "Pavel", "Alexeevich", "Designer", "Russian",
         "88005553535", "upchh@example.com", 2),
    )
    cur.execute("SELECT * FROM Users;")

    # Make the changes to the database persistent
    conn.commit()
    cur.close()
    conn.close()


if __name__ == "__main__":
    main()
