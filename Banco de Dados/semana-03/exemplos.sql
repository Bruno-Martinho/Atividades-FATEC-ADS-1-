-- setup

CREATE DATABASE IF NOT EXISTS EX2;

USE EX2;

CREATE TABLE IF NOT EXISTS Funcionário (
	Cod INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(20), 
  Sexo CHAR,
  Admissão DATE,
  Salário FLOAT,
  Departamento INT
);

CREATE TABLE IF NOT EXISTS Aluno (
	Cod INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(20), 
  Sexo CHAR
);

CREATE TABLE IF NOT EXISTS Departamento (
	Cod INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(20)
);

ALTER TABLE Funcionário ADD FOREIGN KEY (Departamento) REFERENCES Departamento(Cod);

-- inserts

INSERT INTO Departamento (Nome) VALUES ("Administração"), ("Contabilidade"), ("Informática");

INSERT INTO Funcionário (Nome, Sexo, Admissão, Salário, Departamento) VALUES
	("Visconde", 'M', CURDATE(), 1230.00, 3),
  ("Pedrinho", 'M', CURDATE(), 867.00, 3),
  ("Dona Benta", 'F', CURDATE(), 2560.00, 1),
  ("Emília", 'F', CURDATE(), 1170.00, 2),
  ("Rabicó", 'M', CURDATE(), 2300.00, 1);

INSERT INTO Aluno (Nome, Sexo) VALUES
	("Visconde", 'M'),
  ("Dona Benta", 'F'),
  ("Rabicó", 'M'),
  ("Cuca", 'F');

-- selects

SELECT * FROM Funcionário WHERE Sexo = 'F';
SELECT * FROM Funcionário WHERE Sexo = 'M' AND Salário > 1000;

SELECT Nome, Sexo, Salário FROM Funcionário;

SELECT Nome, Salário FROM Funcionário WHERE Salário > 2000;

SELECT Nome, Sexo FROM Funcionário UNION SELECT Nome, Sexo FROM Aluno;