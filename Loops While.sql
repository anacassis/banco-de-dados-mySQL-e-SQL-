/* LOOPS  while */

DECLARE 
	@I INT = 1
BEGIN 

	WHILE (@I < 15)
	BEGIN
		PRINT 'VALOR DE @I = ' +CAST(@I AS VARCHAR)
		SET @I = @I +1
	END
	IF @I = 15
		PRINT 'ACABOU'
	ELSE
		RETURN

END
GO

