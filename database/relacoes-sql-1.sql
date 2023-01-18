-- Active: 1674044613942@@127.0.0.1@3306


-- Práticas

-- 1:M

CREATE TABLE users (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

INSERT INTO users (id, name, email, password)
VALUES
("1", "Marcelo", "teste@gmail.com", "1234"),
("2", "Adolfo", "teste@outlook.com", "5678");

SELECT * FROM users;

CREATE TABLE phones (
  id TEXT PRIMARY KEY UNIQUE NOT NULL, 
  phone_number TEXT UNIQUE NOT NULL,
  user_id TEXT NOT NULL, 
  FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO phones (id, phone_number, user_id)
VALUES
("1", "61998889987", "1"),
("2", "61998334323", "1"),
("3", "61912343566", "1"),
("4", "61913435464", "2"),
("5", "61913443453", "2");

SELECT * FROM phones;

SELECT users.id AS userId, 
  users.name, 
  users.email, 
  users.password, 
  phones.id AS phonesId, 
  phones.phone_number FROM users
INNER JOIN phones
ON phones.user_id = users.id;

-- 1:1

CREATE TABLE licenses (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  register_number TEXT UNIQUE NOT NULL,
  category TEXT NOT NULL
);

INSERT INTO licenses (id, register_number, category)
VALUES
("1", "12123243", "A"),
("2", "23243254", "AB");

CREATE TABLE drivers (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  license_id TEXT UNIQUE NOT NULL,
  FOREIGN KEY (license_id) REFERENCES licenses(id)
);

INSERT INTO drivers (id, name, email, password, license_id)
VALUES
("1", "João", "joão@email.com", "1234", "1"),
("2", "Maria", "maria@email.com", "5678", "2");

SELECT * FROM licenses
INNER JOIN drivers
ON drivers.license_id = licenses.id;