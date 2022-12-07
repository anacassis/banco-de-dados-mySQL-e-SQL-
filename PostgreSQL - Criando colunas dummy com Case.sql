/* CRIANDO COLUNAS DUMMY */

select distinct(cargo) from funcionarios;

select cargo,
case 
	 when cargo = 'Recruting Manager' then 'caso1'
	 WHEN CARGO = 'Data Coordiator' then 'caso2'
	 else
	 'ok'
end as EX
from funcionarios


select sexo,
case 
	
	WHEN SEXO = 'Feminino' then 'F'
	else 'M'
end as sexo
from funcionarios;

/* colunas boleanas */
select nome, sexo, 
case 

	WHEN SEXO = 'Feminino' then 1
	else
	0
end as feminino,
case

	when (sexo = 'Masculino') = true THEN 1
	else
	0
end as Masculino
from funcionarios;
	