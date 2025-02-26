USE ����������

-- �������� ������� "����������"
CREATE TABLE ���������� (
    id_���������� INT IDENTITY(1,1) PRIMARY KEY,
    ��������_���������� NVARCHAR(100) NOT NULL,
    ����������_���� NVARCHAR(100),
    ������� NVARCHAR(20),
    email NVARCHAR(100),
    ����� NVARCHAR(200)
);

-- �������� ������� "������"
CREATE TABLE ������ (
    id_������ INT IDENTITY(1,1) PRIMARY KEY,
    ��������_������ NVARCHAR(100) NOT NULL,
    �������� NVARCHAR(MAX),
    ���� DECIMAL(10, 2) NOT NULL,
    id_���������� INT REFERENCES ����������(id_����������)
);

-- �������� ������� "������"
CREATE TABLE ������ (
    id_������ INT IDENTITY(1,1) PRIMARY KEY,
    ��������_������ NVARCHAR(100) NOT NULL,
    ����� NVARCHAR(200) NOT NULL
);

-- �������� ������� "������" (����� ����� �������� � ��������)
CREATE TABLE ������ (
    id_������ INT IDENTITY(1,1) PRIMARY KEY,
    id_������ INT REFERENCES ������(id_������),
    id_������ INT REFERENCES ������(id_������),
    ���������� INT NOT NULL CHECK (���������� >= 0)
);

-- �������� ������� "�������"
CREATE TABLE ������� (
    id_������� INT IDENTITY(1,1) PRIMARY KEY,
    ���_������� NVARCHAR(100) NOT NULL,
    ������� NVARCHAR(20),
    email NVARCHAR(100),
    ����� NVARCHAR(200)
);

-- �������� ������� "������"
CREATE TABLE ������ (
    id_������ INT IDENTITY(1,1) PRIMARY KEY,
    id_������� INT REFERENCES �������(id_�������),
    ����_������ DATE NOT NULL,
    ������_������ NVARCHAR(50) NOT NULL
);

-- �������� ������� "������_������" (����� ����� �������� � ��������)
CREATE TABLE ������_������ (
    id_������� INT IDENTITY(1,1) PRIMARY KEY,
    id_������ INT REFERENCES ������(id_������),
    id_������ INT REFERENCES ������(id_������),
    ���������� INT NOT NULL CHECK (���������� > 0),
    ����_��_������� DECIMAL(10, 2) NOT NULL
);

-- �������� ������� "����������"
CREATE TABLE ���������� (
    id_���������� INT IDENTITY(1,1) PRIMARY KEY,
    ���_���������� NVARCHAR(100) NOT NULL,
    ��������� NVARCHAR(100) NOT NULL,
    ������� NVARCHAR(20),
    email NVARCHAR(100)
);

-- �������� ������� "��������"
CREATE TABLE �������� (
    id_�������� INT IDENTITY(1,1) PRIMARY KEY,
    id_������ INT REFERENCES ������(id_������),
    id_���������� INT REFERENCES ����������(id_����������),
    ����_�������� DATE NOT NULL,
    ������_�������� NVARCHAR(50) NOT NULL
);