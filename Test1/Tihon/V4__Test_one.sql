CREATE TABLE Products
(
    IdProduct   INTEGER PRIMARY KEY,
    Name        VARCHAR(15) UNIQUE NOT NULL,
    Description VARCHAR(200) NOT NULL,
    Amount   INTEGER NOT NULL,
    StorageCapacity INTEGER CHECK (Amount<=StorageCapacity),
    Cost INTEGER,
    Spoils BIT
);
CREATE TABLE Consumer
(
    IdConsumer  INTEGER PRIMARY KEY,
    Name      VARCHAR(15),
    Surname   VARCHAR(15),
    Patronymic VARCHAR(15),
    Phone     VARCHAR(15),
    Address VARCHAR(50)
);
CREATE TABLE Orders
(
    IdOrder      INTEGER PRIMARY KEY,
    IdProduct      INTEGER,
    FOREIGN KEY(IdProduct) REFERENCES Products(IdProduct),
    IdConsumer      INTEGER,
    FOREIGN KEY(IdConsumer) REFERENCES Consumer(IdConsumer),
    Amount        INTEGER NOT NULL,
    Date DATE NOT NULL
);

INSERT INTO Products (IdProduct, Name, Description, Amount, StorageCapacity, Cost) VALUES (1, 'Яблоки', 'Свежие сорта, вкусные и сочные', 500, 200, 2, 1);
INSERT INTO Products (IdProduct, Name, Description, Amount, StorageCapacity, Cost) VALUES (2, 'Молоко', 'Пастеризованное, 3.2% жира', 100, 150, 2, 1);
INSERT INTO Products (IdProduct, Name, Description, Amount, StorageCapacity, Cost) VALUES (3, 'Хлеб', 'Цельнозерновой, бездрожжевой', 200, 300, 3, 0);
INSERT INTO Products (IdProduct, Name, Description, Amount, StorageCapacity, Cost) VALUES (4, 'Куриное мясо', 'Свежее, без кожи, нежное	', 50, 200, 6, 1);
INSERT INTO Products (IdProduct, Name, Description, Amount, StorageCapacity, Cost) VALUES (5, 'Рис', 'Длиннозерный, высшего качества', 100, 200, 3, 0);

INSERT INTO Consumer (IdConsumer, Name, Surname, Patronymic, Phone, Address) VALUES (1, 'Евгений', 'Андреев', 'Евгеньевич', '+75932106915', 'ул. Ленина, 21б');
INSERT INTO Consumer (IdConsumer, Name, Surname, Patronymic, Phone, Address) VALUES (2, 'Алексей', 'Вишневский', 'Григорьевич', '+76743662946', 'ул. Дорожная, 8');
INSERT INTO Consumer (IdConsumer, Name, Surname, Patronymic, Phone, Address) VALUES (3, 'Варвара', 'Трофимовна', 'Александровна', '+75762546821', 'ул. Монтажная, 49');
INSERT INTO Consumer (IdConsumer, Name, Surname, Patronymic, Phone, Address) VALUES (4, 'Вероника', 'Богданова', 'Ивановна', '+75731762511', 'ул. Комсомольская, 30');
INSERT INTO Consumer (IdConsumer, Name, Surname, Patronymic, Phone, Address) VALUES (5, 'София', 'Соловьёва', 'Тимофеевна', '79625165489', 'ул. Дорожная, 24');

INSERT INTO Orders (IdOrder, IdProduct, IdConsumer, Amount, Date) VALUES (1, 3, 4, 20, TO_DATE('2023-12-20', 'YYYY-MM-DD'));
INSERT INTO Orders (IdOrder, IdProduct, IdConsumer, Amount, Date) VALUES (2, 4, 4, 30, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Orders (IdOrder, IdProduct, IdConsumer, Amount, Date) VALUES (3, 1, 1, 35, TO_DATE('2023-10-04', 'YYYY-MM-DD'));
INSERT INTO Orders (IdOrder, IdProduct, IdConsumer, Amount, Date) VALUES (4, 2, 5, 10, TO_DATE('2023-09-20', 'YYYY-MM-DD'));
INSERT INTO Orders (IdOrder, IdProduct, IdConsumer, Amount, Date) VALUES (5, 2, 4, 10, TO_DATE('2024-01-17', 'YYYY-MM-DD'));

