CREATE DATABASE COMERCIO;
USE COMERCIO

/* ENUM(APENAS MYSQL) */
CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(100) NOT NULL,
	SEXO ENUM("F","M"),
	EMAIL VARCHAR(100) UNIQUE, 
	CPF VARCHAR(12) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(100) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(50) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM("RES","COM","CEL") NOT NULL, 
	NUMERO VARCHAR(30) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

DROP TABLE ENDERECO;
/* FOREIGN KEY 

EM RELACIONAMENTOS 1 X 1 A CHAVE ESTRANGEIRA FICARA NA TABELA MAIS FRACA

EM RELACIONAMENTOS 1 X N  A CHAVE ESTRANGEIRA FICA SEMPRE NA CARDINALIDADE N */

DESC CLIENTE;

/* CLIENTE */

+-----------+------------------------------+------+-----+---------+----------------+
| Field     | Type                         | Null | Key | Default | Extra          |
+-----------+------------------------------+------+-----+---------+----------------+
| IDCLIENTE | int                          | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(100)                 | NO   |     | NULL    |                |
| SEXO      | enum('FEMININO','MASCULINO') | YES  |     | NULL    |                |
| EMAIL     | varchar(100)                 | YES  | UNI | NULL    |                |
| CPF       | varchar(12)                  | YES  | UNI | NULL    |                |
+-----------+------------------------------+------+-----+---------+----------------+

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');

/* ENDERECO*/
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| IDENDERECO | int          | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(100) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30)  | NO   |     | NULL    |                |
| CIDADE     | varchar(50)  | NO   |     | NULL    |                |
| ESTADO     | char(2)      | NO   |     | NULL    |                |
| ID_CLIENTE | int          | YES  | UNI | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

/* TELEFONE */
DESC TELEFONE;

+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int                     | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(30)             | NO   |     | NULL    |                |
| ID_CLIENTE | int                     | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);
INSERT INTO TELEFONE VALUES(NULL,'COM','15932562',1);


/* JUNÇÃO */

SELECT C.NOME,C.SEXO, E.RUA
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE;

+--------+------+--------------------+
| NOME   | SEXO | RUA                |
+--------+------+--------------------+
| JOAO   | M    | RUA CAPITAO HERMES |
| CARLOS | M    | RUA ALFANDEGA      |
| ANA    | F    | RUA PRES VARGAS    |
| CLARA  | F    | RUA ANTONIO SA     |
| JORGE  | M    | RUA URUGUAIANA     |
| CELIA  | M    | RUA DO OUVIDOR     |
+--------+------+--------------------+

/*JUNÇÃO COM 3 TABELAS */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDE.BAIRRO, ENDE.RUA, ENDE.CIDADE,TEL.TIPO, TEL.NUMERO
FROM CLIENTE AS CLIENTE
INNER JOIN ENDERECO AS ENDE
ON CLIENTE.IDCLIENTE = ENDE.ID_CLIENTE
INNER JOIN TELEFONE AS TEL
ON CLIENTE.IDCLIENTE = TEL.ID_CLIENTE
WHERE SEXO = "F"; 

+------+------+---------+-----------------+-----------+------+----------+
| NOME | SEXO | BAIRRO  | RUA             | CIDADE    | TIPO | NUMERO   |
+------+------+---------+-----------------+-----------+------+----------+
| ANA  | F    | JARDINS | RUA PRES VARGAS | SAO PAULO | CEL  | 78989765 |
| ANA  | F    | JARDINS | RUA PRES VARGAS | SAO PAULO | CEL  | 99766676 |
+------+------+---------+-----------------+-----------+------+----------+

SELECT C.NOME, C.SEXO, E.BAIRRO, E.RUA, E.CIDADE,T.IPO, T.NUMERO
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T
ON C.IDCLIENTE = T.ID_CLIENTE;

+--------+------+---------+--------------------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | RUA                | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+--------------------+----------------+------+----------+
| JOAO   | M    | CENTRO  | RUA CAPITAO HERMES | RIO DE JANEIRO | CEL  | 87866896 |
| JOAO   | M    | CENTRO  | RUA CAPITAO HERMES | RIO DE JANEIRO | RES  | 99667587 |
| JOAO   | M    | CENTRO  | RUA CAPITAO HERMES | RIO DE JANEIRO | COM  | 66687899 |
| JOAO   | M    | CENTRO  | RUA CAPITAO HERMES | RIO DE JANEIRO | COM  | 15932562 |
| CARLOS | M    | ESTACIO | RUA ALFANDEGA      | RIO DE JANEIRO | COM  | 54768899 |
| CARLOS | M    | ESTACIO | RUA ALFANDEGA      | RIO DE JANEIRO | CEL  | 88687909 |
| ANA    | F    | JARDINS | RUA PRES VARGAS    | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | RUA PRES VARGAS    | SAO PAULO      | CEL  | 99766676 |
| JORGE  | M    | CENTRO  | RUA URUGUAIANA     | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | RUA URUGUAIANA     | VITORIA        | RES  | 56576876 |
| JORGE  | M    | CENTRO  | RUA URUGUAIANA     | VITORIA        | RES  | 89986668 |
+--------+------+---------+--------------------+----------------+------+----------+

