CREATE TABLE PESSOA (
COD_PESSOA 	SERIAL PRIMARY KEY,
NOME_PESSOA	VARCHAR(50),
CPF_PESSOA	VARCHAR (12),
MODALIDADE INT,
DATA_NASCIMENTO	DATE);

CREATE TABLE COLETIVO(
COD_COL	SERIAL PRIMARY KEY,
COL_LINHA	VARCHAR(4),
COL_PARTIDADA	VARCHAR(45),
COL_DESTINO	VARCHAR(45)
);

CREATE TABLE MODALIDADE(
COD_MODALIDADE	SERIAL PRIMARY KEY,
NOME_MODALIDADE	VARCHAR(20),
LIMITE_USO INT);

CREATE TABLE HISTORICO_SALDO(
COD_SALDO	SERIAL PRIMARY KEY,
COD_PESSOA	INT,
SALDO NUMERIC,
ULT_COMPRA	DATE,
PROX_COMPRA DATE,
FOREIGN KEY (COD_PESSOA)
	REFERENCES PESSOA(COD_PESSOA));

CREATE TABLE PGT_PASSAGEM(
COD_PAGAMENTO	SERIAL PRIMARY KEY,
COD_PESSOA INT,
SALDO_ANTERIOR NUMERIC,
PAG_DATA DATE,
COD_COL INT,
FOREIGN KEY (COD_COL)
	REFERENCES COLETIVO(COD_COL),
FOREIGN KEY (COD_PESSOA)
	REFERENCES PESSOA(COD_PESSOA)
);

CREATE TABLE LOCAL_COLETIVO(
COD_LOCALIZACAO	SERIAL PRIMARY KEY,
COD_COL	INT,
COORDENADAS	VARCHAR(50),
FOREIGN KEY(COD_COL)
	REFERENCES COLETIVO(COD_COL));
