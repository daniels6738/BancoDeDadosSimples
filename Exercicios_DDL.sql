/*1. Criar o banco de dados “Pedidos“ usando o commando CREATE DATABASE.*/ 
CREATE DATABASE Pedidos;

/*2. Criar as tabelas acima usando o comando CREATE TABLE*/
CREATE TABLE estado(
ESTADO_CODIGO CHAR(2) PRIMARY KEY,
ESTADO_NOME VARCHAR(25)

);

CREATE TABLE ue_produto(
UE_PRODUTO_COD CHAR(3),
UE_PRODUTO_DESCR VARCHAR(50),
PRIMARY KEY (UE_PRODUTO_COD)
);

CREATE TABLE produto(
PRODUTO_CODIGO SMALLINT(6),
PRODUTO_NOME CHAR(40),
PRODUTO_PRECO DOUBLE(5,2),
FK_UE_PRODUTO_COD CHAR(3),
PRIMARY KEY (PRODUTO_CODIGO),
FOREIGN KEY (FK_UE_PRODUTO_COD) REFERENCES ue_produto(UE_PRODUTO_COD)
);

CREATE TABLE cliente(
CLIENTE_ID INTEGER(10) PRIMARY KEY,
CLIENTE_NOME CHAR(50),
CLIENTE_END CHAR(50),
CLIENTE_END_CIDADE CHAR(20),
FK_ESTADO_CODIGO CHAR(2),
CLIENTE_END_CEP CHAR(8),
CLIENTE_TELEFONE CHAR(10),
CLIENTE_PERC_DESCONTO DECIMAL(2,0),
FOREIGN KEY (FK_ESTADO_CODIGO) REFERENCES estado(ESTADO_CODIGO)
);

CREATE TABLE pedido(
PEDIDO_IDENTIFICACAO INTEGER(11),
PEDIDO_TIPO ENUM('A VISTA','A PRAZO 30 DIAS'),
FK_CLIENTE_ID INTEGER(10),
PEDIDO_DATA_ENTRADA DATE,
PEDIDO_VALOR_TOTAL DECIMAL(7,2),
PEDIDO_DESCONTO DECIMAL (7,2),
PEDIDO_DT_EMBARQUE DATE,
PRIMARY KEY (PEDIDO_IDENTIFICACAO),
FOREIGN KEY (FK_CLIENTE_ID) REFERENCES cliente(CLIENTE_ID)
);

CREATE TABLE item(
PEDIDO_IDENTIFICACAO INTEGER(11),
FK_PRODUTO_CODIGO SMALLINT(6),
ITEM_QUANTIDADE SMALLINT(6),
ITEM_VALOR_UNITARIO DOUBLE(5,2),
ITEM_VALOR_TOTAL DOUBLE(5,2),
FOREIGN KEY (FK_PRODUTO_CODIGO) REFERENCES produto(PRODUTO_CODIGO),
PRIMARY KEY (PEDIDO_IDENTIFICACAO, FK_PRODUTO_CODIGO)
);

/*3. Criar as tabelas abaixo usando o comando CREATE TABLE (criação de uma nova tabela).*/
CREATE TABLE PRODUTO_CC_6A(
PRODUTO_CC_6A_NOME VARCHAR(40),
PRODUTO_CC_6A_PRECO DOUBLE(5,2)
);

CREATE TABLE UE_PRODUTO_CC_6A(
UE_PRODUTO_CC_6A_DESCR CHAR(50)
);

/*4. Criar a chave primária para as duas tabelas através do comando ALTER
TABLE (alteração de tabela). Inserir cada uma dessas PK na primeira posição de cada tabela.*/
ALTER TABLE UE_PRODUTO_CC_6A ADD UE_PRODUTO_CC_6A_CODIGO CHAR(3) NOT NULL PRIMARY KEY FIRST;
ALTER TABLE PRODUTO_CC_6A ADD PRODUTO_CC_6A_CODIGO SMALLINT NOT NULL PRIMARY KEY FIRST;

/*5. Criar a chave estrangeira da tabela PRODUTO_CC_6A que aponta para a
tabela UE_PRODUTO_cc_6A, analisando a ligação demonstrada no modelo com Integridade Referencial CASCADE.*/
ALTER TABLE PRODUTO_CC_6A ADD UE_PRODUTO_CC_6A_CODIGO CHAR(3) NOT NULL;
ALTER TABLE PRODUTO_CC_6A ADD FOREIGN KEY (UE_PRODUTO_CC_6A_CODIGO) REFERENCES UE_PRODUTO_CC_6A(UE_PRODUTO_CC_6A_CODIGO);

/*6. Criar um Índice único na tabela PRODUTO_CC_6A para a coluna produto_nome_CC_6a*/
CREATE UNIQUE INDEX INDICE ON PRODUTO_CC_6A(PRODUTO_CC_6A_NOME);







