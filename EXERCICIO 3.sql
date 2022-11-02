/* EXERCICIO */
CREATE DATABASE OFICINA;

USE OFICINA;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME_CLIENTE VARCHAR (50) NOT NULL,
	SEXO ENUM("M","F") NOT NULL, 
	ID_CARRO INT UNIQUE
);



CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	NUMERO VARCHAR(30),
	TIPO ENUM("RES",'CEL','TEL'),
	ID_CLIENTE INT
);


CREATE TABLE MARCA(
	IDMARCA INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	NOME_MARCA VARCHAR(50) NOT NULL
);


CREATE TABLE COR(
	IDCOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME_COR VARCHAR(30) UNIQUE
);

CREATE TABLE CARRO(
	IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_CARRO VARCHAR(50) NOT NULL,
	PLACA INT NOT NULL,
	ID_MARCA INT
);


CREATE TABLE CARRO_COR(
	ID_CARRO INT,
	ID_COR INT,
	PRIMARY KEY (ID_CARRO,ID_COR)
	);

/* CRIANDO CONSTRAINTS */

ALTER TABLE TELEFONE
ADD CONSTRAINT FK_TELEFONE_CLIENTE
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CLIENTE 
ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY (ID_CARRO)
REFERENCES CARRO(IDCARRO);

ALTER TABLE CARRO
ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY (ID_MARCA)
REFERENCES MARCA(IDMARCA);

ALTER TABLE CARRO_COR
ADD CONSTRAINT PF_CARRO_COR
FOREIGN KEY(ID_COR)
REFERENCES COR(IDCOR);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);