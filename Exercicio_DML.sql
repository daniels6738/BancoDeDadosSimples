/*1a Questao*/

/*1. Listar o Codigo e a descricao das pecas assim como o peso de suas remessas, quando o peso da remessa estiver na faixa de 500 libras ate 2600 libras*/
SELECT P_NUM, PNOME, (PESO * QTD) FROM PECAS, REMESSAS_DE_PECAS WHERE P_NUM = FK_P_NUM AND PESO * QTD BETWEEN 500 AND 2600;

/*2. Quais os fornecedores que tem remessas com quantidade inferior a 100 e pertencem às cidades Recife ou Fortaleza?*/
SELECT F_NUM, FNOME FROM FORNECEDOR, REMESSAS_DE_PECAS WHERE F_NUM = FK_F_NUM AND QTD < 100 AND (CIDADE = 'Recife' OR CIDADE = 'Fortaleza');

/*3. Apresentar os fornecedores (todos os dados de fornecedor) que emitiram pedidos de remessa com quantidade igual ou superior a 100 e que sejam das cidades de Natal ou Joao Pessoa, ordenados descendentemente por nome da cidade e ascendentemente por nome do vendedor (nesta sequencia).*/
SELECT F_NUM, FNOME, STATUS, CIDADE FROM FORNECEDOR, REMESSAS_DE_PECAS WHERE F_NUM = FK_F_NUM AND QTD >= 100 AND (CIDADE = 'Natal' OR CIDADE = 'Joao Pessoa') ORDER BY CIDADE DESC, FNOME ASC;

/*4. Listar nome do fornecedor [FNOME], sua cidade, o num_fornecedor [F_NUM ], e a frequencia de suas remessas em quantidade inferior a 3/4 da media das quantidades de todas as remessas.*/
SELECT FNOME, CIDADE, F_NUM, (SELECT COUNT(*) FROM REMESSAS_DE_PECAS WHERE QTD < (SELECT (3 * AVG(QTD))/4 FROM REMESSAS_DE_PECAS)) FROM FORNECEDOR;

/*5. Listar o nome [PNOME] e a cidade da Peca que nao consta de nenhuma remessa*/
SELECT PNOME, CIDADE FROM PECAS WHERE P_NUM NOT IN (SELECT P_NUM FROM REMESSAS_DE_PECAS);

/*6. Quais as pecas cujo nome [PNOME] termina com as duas letras (no)?*/ 
SELECT PNOME FROM PECAS WHERE PNOME LIKE '%no';

/*7. Quais os fornecedores que forneceram pecas em quantidade entre 60 e 200 unidades? Informe nome e cidade do fornecedor, sem repeticao de nome do fornecedor*/
SELECT FNOME, CIDADE FROM FORNECEDOR WHERE F_NUM IN (SELECT FK_F_NUM FROM REMESSAS_DE_PECAS WHERE QTD BETWEEN 60 AND 200) GROUP BY FNOME;

/*8. Relacione o identificador (F_NUM) e o nome (FNOME) dos fornecedores de remessa de pecas em quantidade igual ou maior que 200, em ordem alfabetica (resposta em sintaxe ANSI SQL);*/
SELECT F_NUM, FNOME FROM FORNECEDOR WHERE F_NUM IN (SELECT FK_F_NUM FROM REMESSAS_DE_PECAS WHERE QTD >= 200) ORDER BY FNOME DESC;

/*9. Listar em ordem alfabetica o nome dos fornecedores que nao forneceram remessas.*/
SELECT FNOME FROM FORNECEDOR WHERE F_NUM NOT IN (SELECT FK_F_NUM FROM REMESSAS_DE_PECAS) ORDER BY FNOME DESC;

/*10. Quais os fornecedores cujo nome [FNOME] tem a letra "i" como penultima?*/
SELECT FNOME FROM FORNECEDOR WHERE FNOME LIKE '%i_%';

/*11. Quais os fornecedores que remeteram as pecas "porca" ou "pino" em quantidade entre 60 e 200 unidades? Informe nome e cidade do fornecedor, sem repeticao de nome do fornecedor.*/
SELECT FNOME, CIDADE FROM FORNECEDOR WHERE F_NUM IN (SELECT FK_F_NUM FROM REMESSAS_DE_PECAS WHERE (QTD BETWEEN 60 AND 200) AND FK_P_NUM IN (SELECT P_NUM FROM PECAS WHERE PNOME = 'Porca' OR PNOME = 'Pino')) GROUP BY FNOME;

/*2a Questao*/

/*1. Quais os fornecedores que o 'status' está abaixo da media de 'status'? – Utilizar subconsulta.*/
SELECT F_NUM, FNOME FROM F WHERE STATUS < (SELECT AVG(STATUS) FROM F);

/*2. Listar o codigo (P_NUM), a descricao (PNOME) das pecas, assim como o peso de suas remessas, quando o peso da remessa estiver na faixa de 800 libras ate 2600 libras, ordenado descendentemente por "peso da remessa". Observe que ("Peso Remessa" = RP.QTD X P.PESO)*/
SELECT P_NUM, PNOME, (PESO * QTD) FROM P, RP WHERE P_NUM = FK_P_NUM AND (PESO * QTD) BETWEEN 800 AND 2600 ORDER BY (PESO * QTD) DESC;

/*3. Listar o codigo (P_NUM), a descricao das pecas (PNOME) e o numero (frequencia) de suas remessas com quantidade (QTD) na faixa de 40 e 110 unidades.*/
SELECT P_NUM, PNOME, COUNT(*) FROM P, RP WHERE P_NUM = FK_P_NUM AND QTD BETWEEN 40 AND 110;

/*4. Apresentar os fornecedores (todos os dados de fornecedor) que emitiram pedidos de remessa com quantidade igual ou superior a 100 e que sejam das cidades de Natal ou Joao Pessoa, ordenados descendentemente por nome da cidade e ascendentemente por nome do fornecedor (nesta sequencia).*/
SELECT * FROM F WHERE F_NUM IN (SELECT FK_F_NUM FROM RP WHERE QTD >= 100) AND (CIDADE = 'Natal' OR CIDADE = 'Joao Pessoa') ORDER BY CIDADE DESC, FNOME ASC;

/*5. Listar nome do fornecedor, sua cidade, o num_fornecedor (F_NUM), e a frequencia de suas remessas em quantidade inferior a 3/4 da media das quantidades de todas as remessas. – Utilizar subconsulta.*/
SELECT FNOME, CIDADE, F_NUM, (SELECT COUNT(*) FROM RP WHERE QTD < (SELECT (3 * AVG(QTD))/4 FROM RP)) FROM F;

/*6. Quais os fornecedores (codigo "F_NUM" e nome) que nao fornecem nenhuma peca? – Utilizar sub-consulta*/
SELECT F_NUM, FNOME FROM F WHERE F_NUM NOT IN (SELECT FK_F_NUM FROM RP);

/*7. Quais os fornecedores cujo nome [FNOME] comeca com a letra 'J' e termina com a letra 'o' ou 's' ?*/
SELECT FNOME FROM F WHERE FNOME LIKE 'J%o' OR FNOME LIKE 'J%s';

/*8. Listar o codigo (P_NUM), a descricao das pecas (PNOME) e o numero (frequencia) de suas remessas quando sua quantidade (QTD) estiver na faixa de 40 a 110 unidades.*/
SELECT P_NUM, PNOME, (SELECT COUNT(*) FROM RP WHERE QTD BETWEEN 40 AND 110) FROM P;

/*9. Listar o codigo (P_NUM), a descricao das pecas (PNOME), a cor (COR) e o numero (frequencia) de suas remessas quando sua quantidade (QTD) estiver na faixa de 40 a 90 unidades.*/
SELECT P_NUM, PNOME, COR, (SELECT COUNT(*) FROM RP WHERE QTD BETWEEN 40 AND 90) FROM P;







