/* Comunicação entre bancos */

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTOS(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50),
	VALOR FLOAT(10,2)
);

STATUS


CREATE DATABASE BACKUP;

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(50),
	VALOR FLOAT(10,2)
);

STATUS /* CONSULTA INF DA DATABASE */


USE LOJA;
/* ESTOU EM UM BANCO MAS CONSIGO INSERIR DADOS EM OUTRO DATABASE */

INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,1000,"TESTE",0.1);

SELECT * FROM BACKUP.BKP_PRODUTO


DELIMITER $
CREATE TRIGGER BACKUP_PRODUTO
BEFORE INSERT ON PRODUTOS
FOR EACH ROW 
BEGIN 
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL, NEW.IDPRODUTO,
		NEW.NOME,NEW.VALOR);
END
$

DELIMITER ;

INSERT INTO PRODUTOS VALUES(NULL,"BI",10.000);
INSERT INTO PRODUTOS VALUES(NULL,"POWER BI",50.000);
INSERT INTO PRODUTOS VALUES(NULL,"ARQUITETURA DOS DADOS",20.000);
INSERT INTO PRODUTOS VALUES(NULL,"A HISTORIA DE DADOS",80.000);
INSERT INTO PRODUTOS VALUES(NULL,"DATA ANALYTICS",20.000);
INSERT INTO PRODUTOS VALUES(NULL,"DATA SCIENCE",30.000);

SELECT * FROM PRODUTOS;

SELECT * FROM BACKUP.BKP_PRODUTO;

DROP TRIGGER BACKUP_PRODUTO;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTOS
FOR EACH ROW 
BEGIN 
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL, NEW.IDPRODUTO,
		NEW.NOME,NEW.VALOR);
END
$

DELIMITER ;
INSERT INTO PRODUTOS VALUES(NULL,"PYHTON",100.00);

SELECT * FROM PRODUTOS;
+-----------+-----------------------+--------+
| IDPRODUTO | NOME                  | VALOR  |
+-----------+-----------------------+--------+
|         1 | BI                    |  10.00 |
|         2 | POWER BI              |  50.00 |
|         3 | ARQUITETURA DOS DADOS |  20.00 |
|         4 | A HISTORIA DE DADOS   |  80.00 |
|         5 | DATA ANALYTICS        |  20.00 |
|         6 | DATA SCIENCE          |  30.00 |
|         7 | PYHTON                | 100.00 |
+-----------+-----------------------+--------+

SELECT * FROM BACKUP.BKP_PRODUTO;
+-------+-----------+-----------------------+--------+
| IDBKP | IDPRODUTO | NOME                  | VALOR  |
+-------+-----------+-----------------------+--------+
|     1 |      1000 | TESTE                 |   0.10 |
|     2 |         0 | BI                    |  10.00 |
|     3 |         0 | POWER BI              |  50.00 |
|     4 |         0 | ARQUITETURA DOS DADOS |  20.00 |
|     5 |         0 | A HISTORIA DE DADOS   |  80.00 |
|     6 |         0 | DATA ANALYTICS        |  20.00 |
|     7 |         0 | DATA SCIENCE          |  30.00 |
|     8 |         7 | PYHTON                | 100.00 |
+-------+-----------+-----------------------+--------+

ALTER TABLE BACKUP.BKP_PRODUTO
ADD EVENTO CHAR(1);

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DE
BEFORE DELETE ON PRODUTOS
FOR EACH ROW 
BEGIN 
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL, OLD.IDPRODUTO,
		OLD.NOME,OLD.VALOR,'D');
END
$
DELIMITER ;

DELETE FROM PRODUTOS 
WHERE IDPRODUTO = 4;


SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+-----------------------+--------+--------+
| IDBKP | IDPRODUTO | NOME                  | VALOR  | EVENTO |
+-------+-----------+-----------------------+--------+--------+
|     1 |      1000 | TESTE                 |   0.10 | NULL   |
|     2 |         0 | BI                    |  10.00 | NULL   |
|     3 |         0 | POWER BI              |  50.00 | NULL   |
|     4 |         0 | ARQUITETURA DOS DADOS |  20.00 | NULL   |
|     5 |         0 | A HISTORIA DE DADOS   |  80.00 | NULL   |
|     6 |         0 | DATA ANALYTICS        |  20.00 | NULL   |
|     7 |         0 | DATA SCIENCE          |  30.00 | NULL   |
|     8 |         7 | PYHTON                | 100.00 | NULL   |
|     9 |         4 | A HISTORIA DE DADOS   |  80.00 | D      |
+-------+-----------+-----------------------+--------+--------+
/* INSERIU NOVAMENTE POIS FOI EXCLUIDO DO BANCO E ATIVOU A TRIGGER ONDE ELE FEZ A INSERÇÃO DO BACKUP*/


/* TRIGGER DE AUDITORIA */

DELIMITER ;

DROP DATABASE LOJA;

DROP DATABASE BACKUP;

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

INSERT INTO PRODUTO VALUES(NULL,"BI",10.000);
INSERT INTO PRODUTO VALUES(NULL,"POWER BI",50.000);
INSERT INTO PRODUTO VALUES(NULL,"ARQUITETURA DOS DADOS",20.000);
INSERT INTO PRODUTO VALUES(NULL,"A HISTORIA DE DADOS",80.000);
INSERT INTO PRODUTO VALUES(NULL,"DATA ANALYTICS",20.000);
INSERT INTO PRODUTO VALUES(NULL,"DATA SCIENCE",30.000);

/*QUANDO*/
SELECT NOW();
/*QUEM*/
SELECT CURRENT_USER();

CREATE DATABASE BACKUP;

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR_ORIGINAL FLOAT(10,2),
	VALOR_ALTERADO FLOAT(10,2),
	DATA DATETIME,
	USUARIO VARCHAR(30),
	EVENTO CHAR(1)
	
);

USE LOJA;

DELIMITER $

CREATE TRIGGER AUTI_PRODUTO 
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR,
		NEW.VALOR,NOW(),CURRENT_USER(),'U');

END
$

DELIMITER ;

UPDATE PRODUTO SET VALOR = "100.00"
WHERE IDPRODUTO = 3;

SELECT * FROM BACKUP.BKP_PRODUTO;

+----------+-----------+-----------------------+----------------+----------------+---------------------+----------------+--------+
| IDBACKUP | IDPRODUTO | NOME                  | VALOR_ORIGINAL | VALOR_ALTERADO | DATA                | USUARIO        | EVENTO |
+----------+-----------+-----------------------+----------------+----------------+---------------------+----------------+--------+
|        1 |         3 | ARQUITETURA DOS DADOS |          20.00 |         100.00 | 2022-11-02 14:09:43 | root@localhost | U      |
+----------+-----------+-----------------------+----------------+----------------+---------------------+----------------+--------+