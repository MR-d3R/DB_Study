CREATE TABLE Books
(
    Id INTEGER PRIMARY KEY,
    Name VARCHAR(64) UNIQUE NOT NULL,
    Description VARCHAR(256) NOT NULL,
    Author VARCHAR(64),
    Amount INTEGER NOT NULL CHECK (Amount>=0),
    PublishYear INTEGER,
    MaxRentDays INTEGER NOT NULL
);
CREATE TABLE Customers
(
    Id INTEGER PRIMARY KEY,
    FirstName VARCHAR(32) NOT NULL,
    LastName VARCHAR(32) NOT NULL,
    PatronymicName VARCHAR(32),
    Phone VARCHAR(32) NOT NULL,
    Email VARCHAR(64)
);
CREATE TABLE Rentals
(
    Id      INTEGER PRIMARY KEY,
    IdBook      INTEGER,
    FOREIGN KEY(IdBook) REFERENCES Books(Id),
    IdCustomer      INTEGER,
    FOREIGN KEY(IdCustomer) REFERENCES Customers(Id),
    RentDate DATE NOT NULL
);

INSERT INTO Books (Id, Name, Description, Author, Amount, PublishYear, MaxRentDays) VALUES (1, 'Невероятная история', 'Эта книга настолько волшебная, что её на самом деле даже и не существует в реальной жизни!', 'Н. Еизвестная', 0, 2028, 7);
INSERT INTO Books (Id, Name, Description, Author, Amount, PublishYear, MaxRentDays) VALUES (2, 'Собака Баскервилей', 'Одна из четырёх повестей о Шерлоке Холмсе, знаменитом и известном на весь мир британском детективе!', 'А. К. Дойл', 1, 1902, 14);
INSERT INTO Books (Id, Name, Description, Author, Amount, PublishYear, MaxRentDays) VALUES (3, 'Последнее дело Холмса', 'Автор принял решение «убить» своего персонажа в этом рассказе...', 'А. К. Дойл', 3, 1893, 14);
INSERT INTO Books (Id, Name, Description, Author, Amount, PublishYear, MaxRentDays) VALUES (4, 'Четвёртая книга', 'Число четыре считается проклятым в культуре многих стран...', 'Н. Еизвестная', 1, 2024, 7);
INSERT INTO Books (Id, Name, Description, Author, Amount, PublishYear, MaxRentDays) VALUES (5, '1984', 'Самое главное и последнее произведение писателя...', 'Дж. Оруэлл', 15, 1949, 28);

INSERT INTO Customers (Id, FirstName, LastName, PatronymicName, Phone, Email) VALUES (1, 'Андрей', 'Попов', 'Степанович', '+74852861062', 'popov.andrey15@gmail.com');
INSERT INTO Customers (Id, FirstName, LastName, PatronymicName, Phone) VALUES (2, 'Ярослав', 'Русанов', 'Егорович', '+75712961939');
INSERT INTO Customers (Id, FirstName, LastName, PatronymicName, Phone, Email) VALUES (3, 'Виктория', 'Иванова', 'Артёмовна', '+74816920011', 'vikavikavika@notreal.mail');
INSERT INTO Customers (Id, FirstName, LastName, PatronymicName, Phone) VALUES (4, 'Георгий', 'Павлов', 'Максимович', '+71283119410');
INSERT INTO Customers (Id, FirstName, LastName, Phone) VALUES (5, 'Марк', 'Агрен', '+74915915424');

INSERT INTO Rentals (Id, IdBook, IdCustomer, RentDate) VALUES (1, 2, 1, TO_DATE('20/10/2023', 'DD/MM/YYYY'));
INSERT INTO Rentals (Id, IdBook, IdCustomer, RentDate) VALUES (2, 3, 3, TO_DATE('26/10/2023', 'DD/MM/YYYY'));
INSERT INTO Rentals (Id, IdBook, IdCustomer, RentDate) VALUES (3, 3, 5, TO_DATE('02/11/2023', 'DD/MM/YYYY'));
INSERT INTO Rentals (Id, IdBook, IdCustomer, RentDate) VALUES (4, 3, 5, TO_DATE('02/11/2023', 'DD/MM/YYYY'));
INSERT INTO Rentals (Id, IdBook, IdCustomer, RentDate) VALUES (5, 4, 2, TO_DATE('04/11/2023', 'DD/MM/YYYY'));
