/* visualizando nulos NULL*/

use projeto; 

select * from cliente 
where email is null;

select * from cliente 
where email is not null;

/* Atualizando valores nulos UPDATE*/

update cliente 
set email = "lilian@hotmail.com"
where nome = "LILIAN";

update cliente 
set email = "JORGE@HOTMAIL.COM"
where nome = "JORGE";

/* Delete */


DELETE FROM cliente
where nome = 'ANA';

SELECT COUNT(*) FROM CLIENTE;

INSERT INTO CLIENTE VALUES('Carla','F','carla.@hotmail.com',12354555,'12365-9536',
							'Rua evandro b calvoso - 64- andradina - sp')
							
delete from cliente 
where nome = 'Carla' 
and email = 'carla.@hotmail.com';

select * from cliente;