select * from funcionarios;

select 	count(salario),
		MODE() WITHIN GROUP(ORDER BY salario) AS MODA 
from funcionarios;

/* A MODA POR CADA DEPARTAMENTO */
select 	departamento,
		MODE() WITHIN GROUP(ORDER BY salario) AS MODA 
from funcionarios
GROUP BY DEPARTAMENTO;

/* DESVIO PADRÃO DE CADA DEPARTAMENTO */
SELECT DEPARTAMENTO,
		ROUND(STDDEV_POP(SALARIO),2) AS DESV_PADRAO
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY ROUND(STDDEV_POP(SALARIO),2) DESC;

/* A MEDIANA DE TODO SET DE DADOS */
SELECT 	COUNT(SALARIO) AS QTDA,  
		ROUND(MEDIAN(SALARIO),2) AS MEDIANA
		FROM FUNCIONARIOS;

/* QUAL A AMPLITUDE DE TODOS OS SALARIOS */

SELECT 	MAX(SALARIO) AS MAXIMO,
		MIN(SALARIO) AS MINIMO,
		(MAX(SALARIO) - MIN(SALARIO)) AS AMPLITUDE
FROM FUNCIONARIOS;


/* QUAIS AS PRINCIPAIS MEDIDAS ESTATISTICAS POR DEPARTAMENTOS */

SELECT * FROM FUNCIONARIOS;

SELECT 	DEPARTAMENTO,
		MAX(SALARIO) AS MAX_SL,
		MIN(SALARIO) AS MIN_SL,
		ROUND(AVG(SALARIO),2) AS MED_SL,
		ROUND(MEDIAN(SALARIO),2) AS MEDIANA,
		ROUND(MAX(SALARIO) - MIN(SALARIO),2) AS AMPLITUDE
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY MEDIANA ASC;

/* OUTDOORS A MEDIANA DELA É MAIOR REFERENTE AS OUTRAS, ENTÃO A PROBABILIDADE DELA É MAIOR 
A MEDIANA É O VALOR DO MEIO DO SET DOS DADOS*/

