CREATE TABLE library
(
    IdLibrary   INTEGER PRIMARY KEY,
    Name        VARCHAR(15),
    Description VARCHAR(200),
    CreatedAt   DATE,
    BooksAmount INTEGER
);
CREATE TABLE Worker
(
    Wid         INTEGER PRIMARY KEY,
    Lid         INTEGER REFERENCES library (IdLibrary),
    Name        VARCHAR(15),
    Description VARCHAR(200),
    Role        VARCHAR(10),
    HiredAt     DATE,
    DaysWorked  INTEGER
);
CREATE TABLE Role
(
    IdRole      INTEGER PRIMARY KEY,
    Wid         INTEGER REFERENCES worker (Wid),
    Name        VARCHAR(15),
    Description VARCHAR(200)
);
CREATE TABLE Task
(
    IdTask      INTEGER PRIMARY KEY,
    IdRole      INTEGER REFERENCES Role (IdRole),
    Name        VARCHAR(15),
    Description VARCHAR(200),
    Deadline    DATE,
    WorkSpace   VARCHAR(30)
);
CREATE TABLE Author
(
    IdAuthor    INTEGER PRIMARY KEY,
    Name        VARCHAR(15),
    Description VARCHAR(200)
);
CREATE TABLE Publisher
(
    IdPublisher INTEGER PRIMARY KEY,
    Name        VARCHAR(15),
    Description VARCHAR(200),
    CreatedAt   DATE
);
CREATE TABLE Book
(
    IdBook      INTEGER PRIMARY KEY,
    IdAuthor    integer references Author (IdAuthor),
    IdPublisher integer references Publisher (IdPublisher),
    IdLibrary   integer references library (IdLibrary),
    Name        VARCHAR(15),
    Genre       VARCHAR(20),
    Description VARCHAR(200),
    Cost        INTEGER
);
CREATE TABLE Reader
(
    IdReader  INTEGER PRIMARY KEY,
    Name      VARCHAR(15),
    BookCount INTEGER
);
CREATE TABLE Borrowed
(
    IdBook   integer references book (idbook),
    IdReader integer references Reader (IdReader),
    PRIMARY KEY (IdBook, IdReader),
    ExpireAt DATE
);