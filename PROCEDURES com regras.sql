USE EMPRESA;

/* PROCEDURES */

--SP_ STORAGE PROCEDURE

CREATE TABLE PESSOA(
	IDPESSOA INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30) NOT NULL,
	SEXO CHAR(1) NOT NULL CHECK (SEXO IN('M','F')), --ENUM
	MASCIMENTO DATE NOT NULL
)
GO
drop table TELEFONE;
CREATE TABLE TELEFONE(
	IDTELEFONE INT NOT NULL IDENTITY,
	TIPO CHAR(3) NOT NULL CHECK ( TIPO IN('CEL','COM')),
	NUMERO CHAR(10) NOT NULL,
	ID_PESSOA INT
)
GO

ALTER TABLE TELEFONE ADD CONSTRAINT FK_TELEFONE_PESSOA
FOREIGN KEY(ID_PESSOA) REFERENCES PESSOA(IDPESSOA)
ON DELETE CASCADE
GO

INSERT INTO PESSOA VALUES('ANTONIO','M','1981-02-13')
INSERT INTO PESSOA VALUES('DANIEL','M','1985-03-18')
INSERT INTO PESSOA VALUES('CLEIDE','F','1979-10-13')
INSERT INTO PESSOA VALUES('MAFRA','M','1981-02-13')

SELECT @@IDENTITY -- GUARDA O ULTIMO IDENTITY INSERIDO NA SE??O
GO

SELECT * FROM PESSOA

INSERT INTO TELEFONE VALUES('CEL','9879008',1)
INSERT INTO TELEFONE VALUES('COM','8757909',1)
INSERT INTO TELEFONE VALUES('CEL','9875890',2)
INSERT INTO TELEFONE VALUES('CEL','9347689',2)
INSERT INTO TELEFONE VALUES('COM','2998689',3)
INSERT INTO TELEFONE VALUES('COM','2098978',2)
INSERT INTO TELEFONE VALUES('CEL','9008679',3)
GO

/* cria??o de procedures */
DROP PROCEDURE SOMA
GO
CREATE PROC SOMA
AS	
	SELECT 10 + 10 AS SOMA
GO

EXEC SOMA
GO

CREATE PROC CALCULO @NUM1 INT, @NUM3 INT
AS 
	SELECT @NUM1 + @NUM3 AS SOMATORIA
GO

EXEC CALCULO 95,35
GO

select NOME, NUMERO 
FROM PESSOA P
INNER JOIN TELEFONE T
ON P.IDPESSOA = T.ID_PESSOA
WHERE TIPO = 'CEL'
GO

CREATE PROC TELEFONE_TIPO @TIPO CHAR(3)
AS 
	select P.NOME, T.NUMERO,T.TIPO
	FROM PESSOA P
	INNER JOIN TELEFONE T
	ON P.IDPESSOA = T.ID_PESSOA
	WHERE TIPO = @TIPO
GO

DROP PROCEDURE TELEFONE_TIPO;

EXEC TELEFONE_TIPO 'CEL';

SELECT TIPO, COUNT(*) AS QTDA
FROM TELEFONE
GROUP BY TIPO
GO

CREATE PROCEDURE GETTIPO @TIPO CHAR(3), @CONTADOR INT OUTPUT
AS	
		SELECT @CONTADOR = COUNT(*)
		FROM TELEFONE
		WHERE TIPO = @TIPO
		
GO
/* PROCEDURE COM PARAMETRO DE SAIDAS*/
/* TRANSACTION SQL --> LINGUAGEM QUE O SQLSERVER TRABALHA */
/* TEM QUE TER O OUTPUT*/

DECLARE @SAIDA INT
EXEC GETTIPO @TIPO = 'CEL', @CONTADOR = @SAIDA OUTPUT
SELECT @SAIDA
GO


/* PROCEDURE DE CADASTRO */

CREATE PROC CADASTRO @NOME VARCHAR(30), @SEXO CHAR(1), @NASCIMENTO DATE,
@TIPO CHAR(3), @NUMERO VARCHAR(10)
AS
	DECLARE @FK INT

	INSERT INTO PESSOA VALUES(@NOME,@SEXO,@NASCIMENTO) --GERAR UM ID

	SET @FK = (SELECT IDPESSOA FROM PESSOA WHERE IDPESSOA
	= @@IDENTITY)

	INSERT INTO TELEFONE VALUES(@TIPO,@NUMERO,@FK)
GO

CADASTRO 'JORGE','M','1981-01-01','CEL','97273822'  
GO

SELECT PESSOA.*, TELEFONE.*
FROM PESSOA
INNER JOIN TELEFONE
ON IDPESSOA = ID_PESSOA
GO