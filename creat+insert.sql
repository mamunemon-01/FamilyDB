/*uncomment the following line to create a database named "family"*/
/*CREATE DATABASE family;*/

USE family;

DROP TABLE accounts;
DROP TABLE estate;
DROP TABLE expenses;
DROP TABLE occupation;
DROP TABLE member;
DROP TABLE health_rec;

CREATE TABLE health_rec(
	name VARCHAR(30),
	age NUMERIC(3, 0),
	blood_group VARCHAR(3),
	health VARCHAR(50),
	prescription VARCHAR(50),
	PRIMARY KEY (name, age, blood_group)
);

CREATE TABLE member(
	name VARCHAR(30),
	nickname VARCHAR(8),
	age NUMERIC(3, 0),
	PRIMARY KEY (name, nickname),
	FOREIGN KEY (name, age) REFERENCES health_rec(name, age)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE estate(
	name VARCHAR(30),
	type VARCHAR(10),
	price NUMERIC(12, 2),
	owner VARCHAR(30),
	cond VARCHAR(10),
	remarks VARCHAR(50),
	PRIMARY KEY (name, type),
	FOREIGN KEY (owner) REFERENCES member(name)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE accounts(
	bank VARCHAR(30),
	name VARCHAR(30),
	acc_no INTEGER,
	type VARCHAR(10),
	owner VARCHAR(30),
	balance numeric(20, 0),
	PRIMARY KEY (bank, name, acc_no),
	FOREIGN KEY (owner) REFERENCES member(name)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE expenses(
	name VARCHAR(30),
	sector VARCHAR(20),
	subsector VARCHAR(20),
	remarks VARCHAR(50),
	PRIMARY KEY (name, sector, subsector),
	FOREIGN KEY (name) REFERENCES member(name)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE occupation(
	name VARCHAR(30),
	occupation VARCHAR(20),
	rank VARCHAR(30),
	organization VARCHAR(30),
	address VARCHAR(50),
	salary NUMERIC(12, 2),
	PRIMARY KEY (name, occupation),
	FOREIGN KEY (name) REFERENCES member(name)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

INSERT INTO health_rec VALUES
	('Mamun Emon', 22, 'O+', 'Allergy', 'Phanargon syrup 2spoon 1-0-1'),
	('Mamun Kamran', 50, 'O+', 'Cold', 'Avoid cold things or places, Medrolin tables 1-1-1'),
	('Maria Mamun', 42, 'O+', 'Cough', 'Mucospell syrup 1spoon 1-1-1, warm water gurgle');

INSERT INTO member VALUES
	('Mamun Emon', 'Emon', 22),
	('Mamun Kamran', 'Mamun', 50),
	('Maria Mamun', 'Ety', 42);

INSERT INTO accounts VALUES
	('Red Bank Limited', 'Mamun Emon', 12345, 'savings', 'Mamun Emon', 10000),
	('Green Bank Limited', 'Mamun Kamran', 98765, 'savings', 'Mamun Kamran', 100000),
	('Blue Bank Limited', 'Maria Mamun', 42351, 'savings', 'Maria Mamun', 50000);

INSERT INTO occupation VALUES
	('Mamun Emon', 'Student', '8th Semester', 'University of Vermillion', 'Vermillion City, Kanto Region', 0),
	('Mamun Kamran', 'Defence Officer', 'Lieutenant Commander', 'Kantonese Navy', 'Naval Base, Pallete Town, Kanto Region', 180000),
	('Maria Mamun', 'Paramedic', 'Paramedic', 'Pokemon Unnoyon Songstha', 'Vermillion City, Kanto Region', 20000);

INSERT INTO expenses VALUES
('Mamun Kamran', 'Product Buy', 'Special Product', 'Birthday Cake for Emon'),
('Mamun Emon', 'Product Buy', 'Special Product', 'Anniversary Gift for Parents');

INSERT INTO estate VALUES
('Flare Y6 PRO', 'Smartphone', 12160, 'Mamun Emon', 'Good', Null),
('PET 883', 'Laptop', 28000, 'Mamun Emon', 'Good', Null),
('Rocket Note 5A', 'Smartphone', 18160, 'Mamun Kamran', 'Good', Null);