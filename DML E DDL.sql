
/* DML - DATA MANIPULATION LANGUAGE */

/* INSERT */

INSERT INTO CLIENTE VALUES(NULL,'PAULA','M','PAULA@GMAIL.COM','4123654231');
INSERT INTO ENDERECO VALUES(NULL, 'EVANDRO B CALVOSO','VILA SANCHES','ANDRADINA','SP',7);

/* FILTROS*/

SELECT * FROM CLIENTE 
WHERE IDCLIENTE = 7;

/* ATUALIZAÇÃO DE DADOS COM FILTRO UPDATE E WHERE */

UPDATE CLIENTE 
SET SEXO = 'F'
WHERE IDCLIENTE=7;

/* DELETE */

INSERT INTO CLIENTE VALUES(NULL,'XXX','M','XXXXXXX','XXXXX');

DELETE FROM CLIENTE WHERE IDCLIENTE = 9;


/* DDL - DATA DEFINITION LANGUAGE*/

/*DEFINIÇÃO DE PRODUTOS*/
CREATE TABLE PRODUTOS(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FTRETE FLOAT(4,2) NOT NULL
);

/* ALTER TABLE - ALTERANDO O NOME DA COLUNA E TIPO DE DADOS */

ALTER TABLE PRODUTOS 
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

ALTER TABLE PRODUTOS 
CHANGE VALOR_UNITARIO VALOR UNITARIO INT;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | YES  |     | NULL    |                |
| FTRETE         | float(4,2)  | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* MODIFY - ALTERANDO TIPO DE DADOS DE UMA COLUNA */

ALTER TABLE PRODUTOS 
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FTRETE         | float(4,2)  | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* ADD - ADICIONANDO COLUNA */

ALTER TABLE PRODUTOS
ADD PESO FLOAT(4,2) NOT NULL;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FTRETE         | float(4,2)  | NO   |     | NULL    |                |
| PESO           | float(4,2)  | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTOS
MODIFY PESO FLOAT(10,2) NOT NULL;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FTRETE         | float(4,2)  | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTOS
DROP COLUMN PESO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FTRETE         | float(4,2)  | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* ADICIONANDO COLUNAS EM UMA ORDEM ESPECIFICA */

ALTER TABLE PRODUTOS
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FTRETE         | float(4,2)  | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* COLOCANDO EM PRIMEIRA LINHA */

ALTER TABLE PRODUTOS
DROP COLUMN PESO;

ALTER TABLE PRODUTOS 
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| PESO           | float(10,2) | NO   |     | NULL    |                |
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FTRETE         | float(4,2)  | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+