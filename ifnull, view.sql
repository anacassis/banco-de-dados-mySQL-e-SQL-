/* UTILIZANDO IFNULL */

SELECT 	C.NOME, 
		IFNULL(C.EMAIL,'NAO TEM EMAIL') AS EMAIL, 
		T.NUMERO AS TELEFONE,
		T.TIPO ,
		E.ESTADO
FROM CLIENTE AS C
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE;


/* U CRIANDO VIEWS PARA FACILITAR PROCESSOS --VIEW-- */

CREATE VIEW RELATORIO AS 
SELECT 	C.NOME, 
		C.EMAIL,
		C.SEXO ,
		T.NUMERO AS TELEFONE,
		T.TIPO ,
		E.ESTADO,
		E.CIDADE
FROM CLIENTE AS C
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM RELATORIO;

/*APAGANDO A VIEW */

DROP VIEW RELATORIO;

CREATE VIEW V_RELATORIO AS 
SELECT 	C.NOME, 
		IFNULL(C.EMAIL,'NÃO CONTEM'),
		C.SEXO ,
		T.NUMERO AS TELEFONE,
		T.TIPO ,
		E.ESTADO,
		E.CIDADE
FROM CLIENTE AS C
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE;

/* FAZENDO DML COM VIEWS */

/* UPDATE, INSERT E DELETE - DML */

INSERT INTO V_RELATORIO VALUES(
'ANDREIA','F','ANDREIA@UOL.COM.BR','CEL','873547864','CENTRO','VITORIA','ES'
);

ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list
ERROR 1395 (HY000): Can not delete from join view 'comercio.v_relatorio'

DELETE FROM V_RELATORIO WHERE NOME = 'JORGE';

/* É PERMITIDO FAZER UPDATES EM VIEWS COM JOIN */

UPDATE V_RELATORIO SET NOME = 'JOSE' WHERE NOME = 'JORGE';

CREATE TABLE JOGADORES(
	IDJOGADOR INT,
	NOME VARCHAR(30),
	ESTADO CHAR(2)
);

INSERT INTO JOGADORES VALUES(1,'GUERRERO','RS');
INSERT INTO JOGADORES VALUES(2,'GABIGOL','RJ');
INSERT INTO JOGADORES VALUES(3,'GANSO','RJ');
INSERT INTO JOGADORES VALUES(4,'NENÊ', 'RJ');
INSERT INTO JOGADORES VALUES(5,'LOVE','SP');

CREATE VIEW V_JOGADORES AS
SELECT NOME, ESTADO
FROM JOGADORES;

SELECT * FROM V_JOGADORES;

DELETE FROM V_JOGADORES
WHERE NOME = 'GUERRERO';

INSERT INTO V_JOGADORES VALUES('GUERRERO','RS');

SELECT * FROM JOGADORES;
+-----------+----------+--------+
| IDJOGADOR | NOME     | ESTADO |
+-----------+----------+--------+
|         2 | GABIGOL  | RJ     |
|         3 | GANSO    | RJ     |
|         4 | NENÊ     | RJ     |
|         5 | LOVE     | SP     |
|      NULL | GUERRERO | RS     |
+-----------+----------+--------+

SELECT NOME FROM V_RELATORIO;

CREATE TABLE ALUNOS (
	NUMERO INT,
	NOME VARCHAR(50)
	);

INSERT INTO ALUNOS VALUES(1,'JOAO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2,'ANDRE');
INSERT INTO ALUNOS VALUES(3,'CLARA');
INSERT INTO ALUNOS VALUES(1,'CLARA');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE'); 


SELECT * FROM ALUNOS
ORDER BY 2;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | ANA     |
|      2 | ANDRE   |
|      5 | ANTONIO |
|      3 | CLARA   |
|      1 | CLARA   |
|      4 | GIOVANI |
|      5 | JANAINA |
|      1 | JANAINA |
|      1 | JOAO    |
|      4 | MAFRA   |
|      3 | MARCELO |
|      1 | MARIA   |
|      6 | VIVIANE |
|      2 | ZOE     |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY 1;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIOVANI |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY NUMERO, NOME;

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | CLARA   |
|      1 | JANAINA |
|      1 | JOAO    |
|      1 | MARIA   |
|      2 | ANDRE   |
|      2 | ZOE     |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | GIOVANI |
|      4 | MAFRA   |
|      5 | ANTONIO |
|      5 | JANAINA |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY NOME DESC;

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      2 | ZOE     |
|      6 | VIVIANE |
|      1 | MARIA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      1 | JOAO    |
|      5 | JANAINA |
|      1 | JANAINA |
|      4 | GIOVANI |
|      3 | CLARA   |
|      1 | CLARA   |
|      5 | ANTONIO |
|      2 | ANDRE   |
|      6 | ANA     |
+--------+---------+