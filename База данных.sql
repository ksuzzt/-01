USE стройсклад

-- Создание таблицы "Поставщики"
CREATE TABLE Поставщики (
    id_поставщика INT IDENTITY(1,1) PRIMARY KEY,
    название_поставщика NVARCHAR(100) NOT NULL,
    контактное_лицо NVARCHAR(100),
    телефон NVARCHAR(20),
    email NVARCHAR(100),
    адрес NVARCHAR(200)
);

-- Создание таблицы "Товары"
CREATE TABLE Товары (
    id_товара INT IDENTITY(1,1) PRIMARY KEY,
    название_товара NVARCHAR(100) NOT NULL,
    описание NVARCHAR(MAX),
    цена DECIMAL(10, 2) NOT NULL,
    id_поставщика INT REFERENCES Поставщики(id_поставщика)
);

-- Создание таблицы "Склады"
CREATE TABLE Склады (
    id_склада INT IDENTITY(1,1) PRIMARY KEY,
    название_склада NVARCHAR(100) NOT NULL,
    адрес NVARCHAR(200) NOT NULL
);

-- Создание таблицы "Запасы" (связь между товарами и складами)
CREATE TABLE Запасы (
    id_запаса INT IDENTITY(1,1) PRIMARY KEY,
    id_товара INT REFERENCES Товары(id_товара),
    id_склада INT REFERENCES Склады(id_склада),
    количество INT NOT NULL CHECK (количество >= 0)
);

-- Создание таблицы "Клиенты"
CREATE TABLE Клиенты (
    id_клиента INT IDENTITY(1,1) PRIMARY KEY,
    имя_клиента NVARCHAR(100) NOT NULL,
    телефон NVARCHAR(20),
    email NVARCHAR(100),
    адрес NVARCHAR(200)
);

-- Создание таблицы "Заказы"
CREATE TABLE Заказы (
    id_заказа INT IDENTITY(1,1) PRIMARY KEY,
    id_клиента INT REFERENCES Клиенты(id_клиента),
    дата_заказа DATE NOT NULL,
    статус_заказа NVARCHAR(50) NOT NULL
);

-- Создание таблицы "Состав_заказа" (связь между заказами и товарами)
CREATE TABLE Состав_заказа (
    id_состава INT IDENTITY(1,1) PRIMARY KEY,
    id_заказа INT REFERENCES Заказы(id_заказа),
    id_товара INT REFERENCES Товары(id_товара),
    количество INT NOT NULL CHECK (количество > 0),
    цена_за_единицу DECIMAL(10, 2) NOT NULL
);

-- Создание таблицы "Сотрудники"
CREATE TABLE Сотрудники (
    id_сотрудника INT IDENTITY(1,1) PRIMARY KEY,
    имя_сотрудника NVARCHAR(100) NOT NULL,
    должность NVARCHAR(100) NOT NULL,
    телефон NVARCHAR(20),
    email NVARCHAR(100)
);

-- Создание таблицы "Доставки"
CREATE TABLE Доставки (
    id_доставки INT IDENTITY(1,1) PRIMARY KEY,
    id_заказа INT REFERENCES Заказы(id_заказа),
    id_сотрудника INT REFERENCES Сотрудники(id_сотрудника),
    дата_доставки DATE NOT NULL,
    статус_доставки NVARCHAR(50) NOT NULL
);