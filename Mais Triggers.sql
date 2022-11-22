CREATE TABLE RESULTADO(
	IDRESULTADO INT PRIMARY KEY IDENTITY,
	RESULTADO INT
) 
GO

/* EXEMPLOS*/
INSERT INTO RESULTADO VALUES ((SELECT 10+10))
GO

SELECT * FROM RESULTADO
GO

/* ATRIBUINDO SELECTS A VARIAVEIS - ANONIMO */

DECLARE 
	@RESULTADO INT
	SET @RESULTADO = (SELECT 10 + 50)
	INSERT INTO RESULTADO VALUES (@RESULTADO)
	PRINT 'VALOR INSERIDO COM SUCESO' + '/'+ CAST(@RESULTADO AS VARCHAR)
GO

SELECT * FROM RESULTADO
GO

/* TRIGGER UPDATE
MONEY = .00
NUMERIC - VOCE ATRIBUI A CASAS DECIMAIS*/

CREATE TABLE EMPREGADO(
	IDEMPREGADO INT PRIMARY KEY,
	NOME VARCHAR(30),
	SALARIO MONEY,
	IDGERENTE INT
)
GO

ALTER TABLE EMPREGADO ADD CONSTRAINT FK_GERENTE_EMPREGADO
FOREIGN KEY(IDGERENTE) REFERENCES EMPREGADO(IDEMPREGADO)

INSERT INTO EMPREGADO VALUES(1,'CLARA',5000.00,NULL)
INSERT INTO EMPREGADO VALUES(2,'CELIA',4000.00,1)
INSERT INTO EMPREGADO VALUES(3,'JOAO',4000.00,1)
GO

CREATE TABLE HIST_SALARIO(
	IDEMPREGADO INT,
	ANTIGO_SAL MONEY,
	NEW_SAL MONEY,
	DATA DATETIME
)
GO

CREATE TRIGGER TG_SALARIO
ON DBO.EMPREGADO
FOR UPDATE AS
IF UPDATE(SALARIO)
BEGIN
	
	INSERT INTO HIST_SALARIO(
	IDEMPREGADO,ANTIGO_SAL,NEW_SAL,DATA)
	SELECT 
	D.IDEMPREGADO,D.SALARIO,I.SALARIO,GETDATE()
	FROM deleted D, inserted I
	WHERE D.IDEMPREGADO = I.IDEMPREGADO

END
GO

DROP TRIGGER TG_SALARIO
GO

UPDATE EMPREGADO SET SALARIO = SALARIO * 1.1

SELECT * FROM HIST_SALARIO

SELECT * FROM EMPREGADO

CREATE TABLE SALARIO_RANGE(
	MINSAL MONEY,
	MAXSAL MONEY
)
GO

INSERT INTO SALARIO_RANGE VALUES(3000.00,6000.00)
GO

CREATE TRIGGER TG_RANGE
ON DBO.EMPREGADO
FOR INSERT,UPDATE
AS 
	DECLARE
		@MINSAL MONEY,
		@MAXSAL MONEY,
		@ATUALSAL MONEY

	SELECT @MINSAL = MINSAL, @MAXSAL = MAXSAL FROM SALARIO_RANGE

	SELECT @ATUALSAL = I.SALARIO
	FROM INSERTED I

	IF(@ATUALSAL < @MINSAL)
	BEGIN
			RAISERROR('SALARIO MENOR QUE O PISO',16,1)
			ROLLBACK TRANSACTION
	END

	IF(@ATUALSAL > @MAXSAL)
	BEGIN
			RAISERROR('SALARIO MAIOR QUE O TETO',16,1)
			ROLLBACK TRANSACTION
	END
GO


UPDATE EMPREGADO SET SALARIO = 9000.00
WHERE IDEMPREGADO = 1
GO

UPDATE EMPREGADO SET SALARIO = 1000.00
WHERE IDEMPREGADO = 1
GO
/* VERIFICANDO O TEXTO DE NA TRIGGER */

SP_HELPTEXT TG_RANGE
GO