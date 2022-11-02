/* vizualizar as configurações do mysql */
status

/* trocando o delimitador */

demiliter %

/* STORED PROCEDURE */

DELIMITER $

CREATE PROCEDURE NOME_EMPRESA()
BEGIN
	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;
END
$

/* CHAMANDO UMA PROCEDURE */

DELIMITER ;

CALL NOME_EMPRESA();

/* PROCEDURE COM PARAMETROS */

DELIMITER $
CREATE PROCEDURE CONTAGEM()
BEGIN
	SELECT 10 +10 AS CONTA;
END
$

CALL CONTAGEM()$
+-------+
| CONTA |
+-------+
|    20 |
+-------+

/* DELETANDO PROCEDURE */

DROP PROCEDURE CONTA();

CREATE PROCEDURE CONTA(NUMERO1 INT,NUMERO2 INT)
BEGIN
	SELECT NUMERO1 + NUMERO2 AS CONTAGEM;
END
$

CALL CONTA(150,356)$
CALL CONTA(956,115);
CALL CONTA(12222,56588);

/* RECAP */

CERATE DATABASE MAFRA;

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(50)
);

CREATE TABLE CURSOS_ON(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

INSERT INTO CURSOS_ON VALUES(NULL,'JAVA',30,500.00);
INSERT INTO CURSOS_ON VALUES(NULL,'FUNDAMENTOS DE BANCOS DE DADOS',40,700.00);

DELIMITER .

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(50),
							P_HORAS INT(3),
							P_VALOR FLOAT(10,2))
BEGIN 

		INSERT INTO CURSOS_ON VALUES(NULL,P_NOME,P_HORAS,P_VALOR);

END
.

DELIMITER ;

/* CHAMANDO A PROCEDURE DE INSERÇÃO DE DADOS*/
CALL CAD_CURSO("BI", 30,30.00);
CALL CAD_CURSO("TABLEU", 10,5.00);
CALL CAD_CURSO("POWER BI", 25,3.00);
CALL CAD_CURSO("DATA ENGINEER", 50,45.00);
CALL CAD_CURSO("DATA ANALYTICS", 45,35.00);
CALL CAD_CURSO("DATA SCIENCE", 70,50.00);

/* CRIAÇÃO DE PROCEDURE PARA LER OS DADOS */

SELECT * FROM CURSOS_ON;

DELIMITER $

CREATE PROCEDURE RELATORIO_CURSOS()
BEGIN 
	SELECT IDCURSO,NOME,HORAS,VALOR 
	FROM CURSOS_ON;
END
$
DELIMITER ;

CALL RELATORIO_CURSOS();

+---------+--------------------------------+-------+--------+
| IDCURSO | NOME                           | HORAS | VALOR  |
+---------+--------------------------------+-------+--------+
|       1 | JAVA                           |    30 | 500.00 |
|       2 | FUNDAMENTOS DE BANCOS DE DADOS |    40 | 700.00 |
|       3 | BI                             |    30 |  30.00 |
|       4 | BI                             |    30 |  30.00 |
|       5 | TABLEU                         |    10 |   5.00 |
|       6 | POWER BI                       |    25 |   3.00 |
|       7 | DATA ENGINEER                  |    50 |  45.00 |
|       8 | DATA ANALYTICS                 |    45 |  35.00 |
|       9 | DATA SCIENCE                   |    70 |  50.00 |
+---------+--------------------------------+-------+--------+