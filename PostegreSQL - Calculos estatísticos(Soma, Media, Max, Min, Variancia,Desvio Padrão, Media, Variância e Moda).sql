select maquina, 
	count(qtda) as quantidade,
	sum(qtda) as total,
	round(avg(qtda),2) as media,
	max(qtda) as maximo,
	min(qtda) as minimo,
	round(var_pop(qtda),2) as variancia,
	round(stddev_pop(qtda),2) as desvio_padrao,
	round(median(qtda),2) as mediana,
	round(stddev_pop(qtda) / avg(qtda) *100,2) as coef_var,
	MODE() WITHIN GROUP(ORDER BY QTDA) AS MODA
from maquinas
group by maquina;


/* calculo da moda */

/*SELECT **MODE WITHIN GROUP(ORDER BY COLUNA) AS MODA** FROM TABELA;*/

SELECT 	MAQUINA,
		MODE() WITHIN GROUP(ORDER BY QTDA) AS MODA
FROM MAQUINAS
GROUP BY MAQUINA;