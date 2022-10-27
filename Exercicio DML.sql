/* EXERCICIOS DML */ 

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',8);

/* CADASTRE TELEFONES PARA OS CLIENTES */

INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','11522578',8);
INSERT INTO TELEFONE VALUES(NULL,'CEL','15963254',10);


/* RELATORIO GERAL DE TODOS OS CLIENTES (TELEFONE E ENDERECO) */

SELECT * FROM CLIENTE AS C
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T
ON C.IDCLIENTE = T.ID_CLIENTE;

/* RELATORIO DE HOMENS */
SELECT * FROM CLIENTE AS C 
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';

+-----------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | IDENDERECO | RUA                | BAIRRO     | CIDADE         | ESTADO | ID_CLIENTE | IDTELEFONE | TIPO | NUMERO   | ID_CLIENTE |
+-----------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |          1 |          3 | CEL  | 87866896 |          1 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |          1 |          5 | RES  | 99667587 |          1 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |          1 |          8 | COM  | 66687899 |          1 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |          1 |         11 | COM  | 15932562 |          1 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |          2 |          4 | COM  | 54768899 |          2 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |          2 |         10 | CEL  | 88687909 |          2 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |          5 |          1 | CEL  | 78458743 |          5 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |          5 |          2 | RES  | 56576876 |          5 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |          5 |          9 | RES  | 89986668 |          5 |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     |         20 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |          8 |         27 | COM  | 11522578 |          8 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |          8 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |          9 |         12 | RES  | 68976565 |          9 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |          8 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |          9 |         13 | CEL  | 99656675 |          9 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         14 | CEL  | 33567765 |         11 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         15 | CEL  | 88668786 |         11 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         16 | COM  | 55689654 |         11 |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    |         11 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |         12 |         17 | COM  | 88687979 |         12 |
|        13 | LORENA  | M    | NULL              | 774557887   |         12 | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |         13 |         18 | COM  | 88965676 |         13 |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     |         15 | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     |         16 |         20 | COM  | 88679978 |         16 |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    |         16 | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     |         17 |         21 | CEL  | 99655768 |         17 |
|        18 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   |         17 | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     |         18 |         22 | RES  | 89955665 |         18 |
+-----------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 11;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 12;

UPDATE CLIENTE 
SET SEXO = 'F'
WHERE IDCLIENTE = 13 ;

UPDATE CLIENTE 
SET SEXO = 'F'
WHERE IDCLIENTE = 17;

UPDATE CLIENTE 
SET SEXO = 'F'
WHERE IDCLIENTE = 18;

SELECT * FROM CLIENTE 
WHERE IDCLIENTE IN (11,12,13,17,18);

/* OU PODE SE UTILIZAR O IN 

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE IN (11,12,13,17,18)*/

+-----------+---------+------+-----------------+-------------+------------+--------------------+-----------+----------------+--------+------------+------------+------+----------+------------+
| IDCLIENTE | NOME    | SEXO | EMAIL           | CPF         | IDENDERECO | RUA                | BAIRRO    | CIDADE         | ESTADO | ID_CLIENTE | IDTELEFONE | TIPO | NUMERO   | ID_CLIENTE |
+-----------+---------+------+-----------------+-------------+------------+--------------------+-----------+----------------+--------+------------+------------+------+----------+------------+
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO    | RIO DE JANEIRO | RJ     |          1 |          3 | CEL  | 87866896 |          1 |
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO    | RIO DE JANEIRO | RJ     |          1 |          5 | RES  | 99667587 |          1 |
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO    | RIO DE JANEIRO | RJ     |          1 |          8 | COM  | 66687899 |          1 |
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO    | RIO DE JANEIRO | RJ     |          1 |         11 | COM  | 15932562 |          1 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM  | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO   | RIO DE JANEIRO | RJ     |          2 |          4 | COM  | 54768899 |          2 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM  | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO   | RIO DE JANEIRO | RJ     |          2 |         10 | CEL  | 88687909 |          2 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO    | VITORIA        | ES     |          5 |          1 | CEL  | 78458743 |          5 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO    | VITORIA        | ES     |          5 |          2 | RES  | 56576876 |          5 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO    | VITORIA        | ES     |          5 |          9 | RES  | 89986668 |          5 |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM   | 4657765     |         20 | RUA GOMES FREIRE   | CENTRO    | RIO DE JANEIRO | RJ     |          8 |         27 | COM  | 11522578 |          8 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM | 7687567     |          8 | RUA GUEDES         | CASCADURA | B. HORIZONTE   | MG     |          9 |         12 | RES  | 68976565 |          9 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM | 7687567     |          8 | RUA GUEDES         | CASCADURA | B. HORIZONTE   | MG     |          9 |         13 | CEL  | 99656675 |          9 |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM | 3423565     |         15 | AV CARLOS BARROSO  | JARDINS   | SAO PAULO      | SP     |         16 |         20 | COM  | 88679978 |         16 |
+-----------+---------+------+-----------------+-------------+------------+--------------------+-----------+----------------+--------+------------+------------+------+----------+------------+

/* RELATORIO DE MULHERES*/
SELECT * FROM CLIENTE AS C 
INNER JOIN ENDERECO AS E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';
+-----------+---------+------+-------------------+-----------+------------+--------------------+---------+----------------+--------+------------+------------+------+----------+------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       | IDENDERECO | RUA                | BAIRRO  | CIDADE         | ESTADO | ID_CLIENTE | IDTELEFONE | TIPO | NUMERO   | ID_CLIENTE |
+-----------+---------+------+-------------------+-----------+------------+--------------------+---------+----------------+--------+------------+------------+------+----------+------------+
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 |          3 | RUA PRES VARGAS    | JARDINS | SAO PAULO      | SP     |          3 |          6 | CEL  | 78989765 |          3 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 |          3 | RUA PRES VARGAS    | JARDINS | SAO PAULO      | SP     |          3 |          7 | CEL  | 99766676 |          3 |
|        15 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767  |         14 | AV CAPITAO ANTUNES | CENTRO  | CURITIBA       | PR     |         15 |         19 | CEL  | 89966809 |         15 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  |         18 | RUA GERONIMO       | CENTRO  | RIO DE JANEIRO | RJ     |         19 |         23 | RES  | 77455786 |         19 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  |         18 | RUA GERONIMO       | CENTRO  | RIO DE JANEIRO | RJ     |         19 |         24 | RES  | 89766554 |         19 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  |         19 | RUA GOMES FREIRE   | CENTRO  | RIO DE JANEIRO | RJ     |         20 |         25 | RES  | 77755785 |         20 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  |         19 | RUA GOMES FREIRE   | CENTRO  | RIO DE JANEIRO | RJ     |         20 |         26 | COM  | 44522578 |         20 |
+-----------+---------+------+-------------------+-----------+------------+--------------------+---------+----------------+--------+------------+------------+------+----------+------------+

UPDATE CLIENTE
SET SEXO = 'M'
WHERE IDCLIENTE = 15;
+-----------+---------+------+-------------------+-----------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       | IDENDERECO | RUA                | BAIRRO     | CIDADE         | ESTADO | ID_CLIENTE | IDTELEFONE | TIPO | NUMERO   | ID_CLIENTE |
+-----------+---------+------+-------------------+-----------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 |          3 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |          3 |          6 | CEL  | 78989765 |          3 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 |          3 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |          3 |          7 | CEL  | 99766676 |          3 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         14 | CEL  | 33567765 |         11 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         15 | CEL  | 88668786 |         11 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         16 | COM  | 55689654 |         11 |
|        12 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789  |         11 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |         12 |         17 | COM  | 88687979 |         12 |
|        13 | LORENA  | F    | NULL              | 774557887 |         12 | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |         13 |         18 | COM  | 88965676 |         13 |
|        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763  |         16 | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     |         17 |         21 | CEL  | 99655768 |         17 |
|        18 | CARMEM  | F    | CARMEM@IG.COM     | 787832213 |         17 | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     |         18 |         22 | RES  | 89955665 |         18 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  |         18 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |         19 |         23 | RES  | 77455786 |         19 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  |         18 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |         19 |         24 | RES  | 89766554 |         19 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  |         19 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |         20 |         25 | RES  | 77755785 |         20 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  |         19 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |         20 |         26 | COM  | 44522578 |         20 |
+-----------+---------+------+-------------------+-----------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+


SELECT SEXO, COUNT(*) AS QTDA FROM CLIENTE
GROUP BY SEXO;
+------+------+
| SEXO | QTDA |
+------+------+
| M    |   10 |
| F    |   10 |
+------+------+


SELECT C.IDCLIENTE, C.SEXO, E.BAIRRO, E.CIDADE, T.NUMERO, T.TIPO
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE NUMERO <> "CEL" AND SEXO = 'F';
+-----------+------+------------+----------------+----------+------+
| IDCLIENTE | SEXO | BAIRRO     | CIDADE         | NUMERO   | TIPO |
+-----------+------+------------+----------------+----------+------+
|         3 | F    | JARDINS    | SAO PAULO      | 78989765 | CEL  |
|         3 | F    | JARDINS    | SAO PAULO      | 99766676 | CEL  |
|        11 | F    | CENTRO     | RIO DE JANEIRO | 33567765 | CEL  |
|        11 | F    | CENTRO     | RIO DE JANEIRO | 88668786 | CEL  |
|        11 | F    | CENTRO     | RIO DE JANEIRO | 55689654 | COM  |
|        12 | F    | COPACABANA | RIO DE JANEIRO | 88687979 | COM  |
|        13 | F    | CENTRO     | VITORIA        | 88965676 | COM  |
|        17 | F    | BOM RETIRO | CURITIBA       | 99655768 | CEL  |
|        18 | F    | LAPA       | SAO PAULO      | 89955665 | RES  |
|        19 | F    | CENTRO     | RIO DE JANEIRO | 77455786 | RES  |
|        19 | F    | CENTRO     | RIO DE JANEIRO | 89766554 | RES  |
|        20 | F    | CENTRO     | RIO DE JANEIRO | 77755785 | RES  |
|        20 | F    | CENTRO     | RIO DE JANEIRO | 44522578 | COM  |
+-----------+------+------------+----------------+----------+------+

SELECT C.IDCLIENTE, C.SEXO, E.BAIRRO, E.CIDADE, T.NUMERO, T.TIPO
FROM CLIENTE AS C
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE (BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO')
AND TIPO <> "CEL" AND SEXO ='F';

+-----------+------+--------+----------------+----------+------+
| IDCLIENTE | SEXO | BAIRRO | CIDADE         | NUMERO   | TIPO |
+-----------+------+--------+----------------+----------+------+
|        11 | F    | CENTRO | RIO DE JANEIRO | 55689654 | COM  |
|        19 | F    | CENTRO | RIO DE JANEIRO | 77455786 | RES  |
|        19 | F    | CENTRO | RIO DE JANEIRO | 89766554 | RES  |
|        20 | F    | CENTRO | RIO DE JANEIRO | 77755785 | RES  |
|        20 | F    | CENTRO | RIO DE JANEIRO | 44522578 | COM  |
+-----------+------+--------+----------------+----------+------+


/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM
RELATÃ“RIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO 
VOCÃŠ TERÃ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */

SELECT C.NOME, C.EMAIL, T.NUMERO AS TELEFONE , T.TIPO, E.CIDADE, E.ESTADO 
FROM CLIENTE AS C
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE ESTADO='RJ' AND TIPO ='CEL';

+--------+-----------------+----------+------+----------------+--------+
| NOME   | EMAIL           | TELEFONE | TIPO | CIDADE         | ESTADO |
+--------+-----------------+----------+------+----------------+--------+
| JOAO   | JOAOA@IG.COM    | 87866896 | CEL  | RIO DE JANEIRO | RJ     |
| CARLOS | CARLOSA@IG.COM  | 88687909 | CEL  | RIO DE JANEIRO | RJ     |
| KARLA  | KARLA@GMAIL.COM | 33567765 | CEL  | RIO DE JANEIRO | RJ     |
| KARLA  | KARLA@GMAIL.COM | 88668786 | CEL  | RIO DE JANEIRO | RJ     |
+--------+-----------------+----------+------+----------------+--------+

SELECT * FROM CLIENTE AS C
 INNER JOIN ENDERECO AS E
ON C.IDCLIENTE =E.ID_CLIENTE
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE;

INSERT INTO TELEFONE VALUES(NULL,'CEL','15963254',10);

+---------+-----------------+----------+------+----------------+--------+
| NOME    | EMAIL           | TELEFONE | TIPO | CIDADE         | ESTADO |
+---------+-----------------+----------+------+----------------+--------+
| JOAO    | JOAOA@IG.COM    | 87866896 | CEL  | RIO DE JANEIRO | RJ     |
| CARLOS  | CARLOSA@IG.COM  | 88687909 | CEL  | RIO DE JANEIRO | RJ     |
| GIOVANA | NULL            | 15963254 | CEL  | RIO DE JANEIRO | RJ     |
| KARLA   | KARLA@GMAIL.COM | 33567765 | CEL  | RIO DE JANEIRO | RJ     |
| KARLA   | KARLA@GMAIL.COM | 88668786 | CEL  | RIO DE JANEIRO | RJ     |
+---------+-----------------+----------+------+----------------+--------+

/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
RELATÃ“RIO COM O NOME, EMAIL E TELEFONE CELULAR 
 DAS MULHERES QUE MORAM NO ESTADO DE SÃƒO PAULO 
VOCÃŠ TERÃ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */

SELECT C.NOME, C.EMAIL, T.NUMERO AS TELEFONE,T.TIPO , E.ESTADO
FROM CLIENTE AS C
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE SEXO = 'F'
AND ESTADO ='SP' AND TIPO = 'CEL';

+------+------------+----------+------+--------+
| NOME | EMAIL      | TELEFONE | TIPO | ESTADO |
+------+------------+----------+------+--------+
| ANA  | ANA@IG.COM | 78989765 | CEL  | SP     |
| ANA  | ANA@IG.COM | 99766676 | CEL  | SP     |
+------+------------+----------+------+--------+

SELECT C.NOME, C.EMAIL, T.NUMERO AS TELEFONE,T.TIPO , E.ESTADO
FROM CLIENTE AS C
INNER JOIN TELEFONE AS T 
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO AS E 
ON C.IDCLIENTE = E.ID_CLIENTE
WHERE SEXO = 'F'
AND ESTADO ='SP';

+--------+---------------+----------+------+--------+
| NOME   | EMAIL         | TELEFONE | TIPO | ESTADO |
+--------+---------------+----------+------+--------+
| ANA    | ANA@IG.COM    | 78989765 | CEL  | SP     |
| ANA    | ANA@IG.COM    | 99766676 | CEL  | SP     |
| CARMEM | CARMEM@IG.COM | 89955665 | RES  | SP     |
+--------+---------------+----------+------+--------+
