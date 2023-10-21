CREATE TABLE Users (
    idUser integer PRIMARY KEY,
    Surname VARCHAR(15) NOT NULL,
    Name VARCHAR(15) NOT NULL,
    Patronymic VARCHAR(15),
    Birthday DATE NOT NULL,
    Profession VARCHAR(50),
    Nationality VARCHAR(15) NOT NULL,
    PhoneNumber VARCHAR(25) UNIQUE,
    Email VARCHAR(40) CHECK (Email ~ '[a-zA-Z0-9]@[a-zA-Z0-9].[a-z]'),
    BookCount INTEGER
);