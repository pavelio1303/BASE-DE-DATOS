DROP SCHEMA IF EXISTS PYME;
CREATE SCHEMA PYME;
USE PYME;

CREATE TABLE CLIENTE(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    SALDO DECIMAL(9,2) DEFAULT 0.00,
    DESCUENTO DECIMAL(3,2),
    
    CONSTRAINT DESCUENTO_ENTRE_0_1 CHECK (DESCUENTO>=0 AND DESCUENTO<=1)	# TAMBIEN SE PUEDE PONER (DESCUENTO BETWEEN 0 AND 1)
);

CREATE TABLE DIRECCIONES(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    NUMERO SMALLINT,
    CALLE VARCHAR(100),
    PUEBLO VARCHAR(100),
    CIUDAD VARCHAR(100)
);

CREATE TABLE ARTICULO(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    DESCRIPCION TEXT NOT NULL
);

CREATE TABLE PEDIDO(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    FECHA_HORA DATETIME,
    ID_CLIENTE INT,
    ID_DIRECCIONES INT,
    
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID),
    FOREIGN KEY (ID_DIRECCIONES) REFERENCES DIRECCIONES(ID)
);

CREATE TABLE FABRICA(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    TELEFONO CHAR(9) UNIQUE,
    TOTAL_ARTICULO SMALLINT
);

CREATE TABLE CLIENTE_TIENE_DIRECCIONES(
	ID_CLIENTE INT,
    ID_DIRECCIONES INT,
    
    PRIMARY KEY (ID_CLIENTE,ID_DIRECCIONES),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID),
    FOREIGN KEY (ID_DIRECCIONES) REFERENCES DIRECCIONES(ID)
);

CREATE TABLE PEDIDO_CONTIENE_ARTICULO(
	ID_PEDIDO INT,
    ID_ARTICULO INT,
    CANTIDAD SMALLINT UNSIGNED,
    
    PRIMARY KEY (ID_PEDIDO,ID_ARTICULO),
    FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO(ID),
    FOREIGN KEY (ID_ARTICULO) REFERENCES ARTICULO(ID)
);

CREATE TABLE FABRICA_PROVEE_ARTICULO(
	ID_FABRICA INT,
    ID_ARTICULO INT,
    STOCK SMALLINT UNSIGNED,
    
    PRIMARY KEY (ID_FABRICA,ID_ARTICULO),
    FOREIGN KEY (ID_FABRICA) REFERENCES FABRICA(ID),
    FOREIGN KEY (ID_ARTICULO) REFERENCES ARTICULO(ID)
);