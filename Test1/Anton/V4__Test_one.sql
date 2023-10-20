CREATE TABLE Products
(
    IdProduct   INTEGER PRIMARY KEY,
    Name        VARCHAR(15) UNIQUE NOT NULL,
    Description VARCHAR(200) NOT NULL,
    Amount   INTEGER NOT NULL,
    StorageCapacity INTEGER CHECK (Amount<=StorageCapacity),
    Cost INTEGER
);
CREATE TABLE Costumer
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

INSERT INTO Products (IdProduct, Name, Description, Amount, StorageCapacity, Cost) VALUES (1, 'Арбуз', 'Диаметр 50-70см', 66, 666, 6);
INSERT INTO Products (IdProduct, Name, Description, Amount, StorageCapacity, Cost) VALUES (2, 'Огурцы', 'Длина 26см', 77, 777, 7);
INSERT INTO Products (IdProduct, Name, Description, Amount, StorageCapacity, Cost) VALUES (3, 'Капуста', 'Поставки возобновлены', 33, 333, 3);
INSERT INTO Products (IdProduct, Name, Description, Amount, StorageCapacity, Cost) VALUES (4, 'Ананас', 'Не будет поставляться в течение 3-ёх лет', 180, 200, 9);
INSERT INTO Products (IdProduct, Name, Description, Amount, StorageCapacity, Cost) VALUES (5, 'Кокос', 'Новая продукция', 20, 20, 11);

INSERT INTO Costumer (IdConsumer, Name, Surname, Patronymic, Phone, Address) VALUES (1, 'Тихон', 'Тихонов', 'Тихонович', '+998975556677', 'ул. Глыбова, 300');
INSERT INTO Costumer (IdConsumer, Name, Surname, Patronymic, Phone, Address) VALUES (2, 'Алексей', 'Эдуард', 'Ильназович', '+75566662946', 'ул. Дорожная, 8');
INSERT INTO Costumer (IdConsumer, Name, Surname, Patronymic, Phone, Address) VALUES (3, 'Пирсон', 'Спектр', 'Лит', '+75762546821', 'тупик. Опасный, 69');
INSERT INTO Costumer (IdConsumer, Name, Surname, Patronymic, Phone, Address) VALUES (4, 'Майкл', 'Джеймс', 'Роз', '+75731762511', 'ул. Смердящая, 17');
INSERT INTO Costumer (IdConsumer, Name, Surname, Patronymic, Phone, Address) VALUES (5, 'Рейчел', 'Элизабет', 'Зейн', '+782115621454', 'ул. Отмороженная, 666');

INSERT INTO Orders (IdOrder, IdProduct, IdConsumer, Amount, Date) VALUES (1, 3, 4, 20, TO_DATE('2023-08-21', 'YYYY-MM-DD'));
INSERT INTO Orders (IdOrder, IdProduct, IdConsumer, Amount, Date) VALUES (2, 4, 4, 30, TO_DATE('2023-08-22', 'YYYY-MM-DD'));
INSERT INTO Orders (IdOrder, IdProduct, IdConsumer, Amount, Date) VALUES (3, 1, 1, 35, TO_DATE('2023-09-06', 'YYYY-MM-DD'));
INSERT INTO Orders (IdOrder, IdProduct, IdConsumer, Amount, Date) VALUES (4, 2, 5, 10, TO_DATE('2023-11-21', 'YYYY-MM-DD'));
INSERT INTO Orders (IdOrder, IdProduct, IdConsumer, Amount, Date) VALUES (5, 2, 4, 10, TO_DATE('2024-01-17', 'YYYY-MM-DD'));

