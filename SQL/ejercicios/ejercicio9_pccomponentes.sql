DROP SCHEMA IF EXISTS PC_COMPONENTES;
CREATE SCHEMA PC_COMPONENTES;
USE PC_COMPONENTES;

CREATE TABLE CLIENTE(
	NIF CHAR(9) PRIMARY KEY,
    NOMBRE VARCHAR(50),
    APELLIDOS VARCHAR(150),
    DOMICILIO VARCHAR(100),
    CIUDAD VARCHAR(100),
    PROVINCIA VARCHAR(100),
    TELEFONO VARCHAR(15) UNIQUE
);

INSERT INTO CLIENTE VALUES
("65564642F","FRANCHESCO","GAMER SOPRANO","CALLE LUCHO, NUMERO 7","GRANADA","GRANADA","652894632");

CREATE TABLE SECCION(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(100)
);

INSERT INTO SECCION VALUES
(DEFAULT,"GAMING"),
(DEFAULT,"ESTUDIANTIL");

SELECT*FROM SECCION;

CREATE TABLE EMPLEADO(
	NIF CHAR(9) PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDOS VARCHAR(150) NOT NULL,
    ID_SECCION INT NOT NULL,
    
    FOREIGN KEY (ID_SECCION) REFERENCES SECCION(ID)
);

ALTER TABLE SECCION ADD COLUMN NIF_DIRECTOR CHAR(9);

ALTER TABLE SECCION ADD CONSTRAINT FOREIGN KEY (NIF_DIRECTOR) REFERENCES EMPLEADO(NIF);

INSERT INTO EMPLEADO VALUES
("96566263P","PACO","GRACIA MOLINA",1),
("83745223C","ANA","SANCHEZ GARCIA",2);

SELECT*FROM EMPLEADO;

CREATE TABLE ARTICULO(
	CODIGO INT PRIMARY KEY AUTO_INCREMENT
);

INSERT INTO ARTICULO VALUES
(DEFAULT),
(DEFAULT),
(DEFAULT),
(DEFAULT);

SELECT*FROM ARTICULO;

CREATE TABLE COMPONENTE(
	CODIGO_COMPONENTE INT PRIMARY KEY,
    NOMBRE VARCHAR(100),
    STOCK SMALLINT,
    DESCRIPCION MEDIUMTEXT,
    PRECIO DECIMAL(9,2) DEFAULT "0.00",
    
    FOREIGN KEY (CODIGO_COMPONENTE) REFERENCES ARTICULO(CODIGO)
);

INSERT INTO COMPONENTE VALUES
(1,"TARJETA GRAFICA NVIDIA RTX2090",13,"GRAFICA POTENTE QUE FLIPAS",650.50),
(2,"CPU I 9-7660",17,"PROCESADOR POTENTE QUE FLIPAS",550.50),
(3,"FUENTE DE ALIMENTACION","34","PA TO LO QUE NESESITA",60);

SELECT*FROM COMPONENTE;

CREATE TABLE EQUIPO(
	CODIGO_EQUIPO INT PRIMARY KEY,
    NOMBRE VARCHAR(100),
    STOCK SMALLINT,
    DESCRIPCION MEDIUMTEXT,
    PRECIO DECIMAL(9,2) DEFAULT "0.00",
    
    FOREIGN KEY (CODIGO_EQUIPO) REFERENCES ARTICULO(CODIGO)
);

INSERT INTO EQUIPO VALUES
(4,"ORDENADOR GAMER",13,"EL MEJOR DEL MERCADO CALIDAD PRECIO",1350.50);

SELECT*FROM EQUIPO;

CREATE TABLE CLIENTE_COMPRA_ARTICULO(
	NIF_CLIENTE CHAR(9),
    CODIGO_ARTICULO INT,
    FECHA_HORA_COMPRA DATETIME,
    CANTIDAD SMALLINT,
    NIF_EMPLEADO CHAR(9),
    
    PRIMARY KEY (NIF_CLIENTE,CODIGO_ARTICULO),
    FOREIGN KEY (NIF_CLIENTE) REFERENCES CLIENTE(NIF),
    FOREIGN KEY (CODIGO_ARTICULO) REFERENCES ARTICULO(CODIGO),
    FOREIGN KEY (NIF_EMPLEADO) REFERENCES EMPLEADO(NIF)
);

CREATE TABLE COMPONENTE_FORMA_EQUIPO(
	CODIGO_COMPONENTE INT,
    CODIGO_EQUIPO INT,
    CANTIDAD SMALLINT,
    
    PRIMARY KEY (CODIGO_COMPONENTE, CODIGO_EQUIPO),
    FOREIGN KEY (CODIGO_COMPONENTE) REFERENCES COMPONENTE(CODIGO_COMPONENTE),
    FOREIGN KEY (CODIGO_EQUIPO) REFERENCES EQUIPO(CODIGO_EQUIPO)
);

# RESTRICCIONES
#	-EL TELEFONO DEBE SER UNICO PARA CADA CLIENTE
#	-NINGUN DATO DE EMPLEADO PUEDE SER NULO
#	-EL PRECIO POR DEFECTO DE LOS EQUIPOS ES 0.00

#INSERTA DOS EMPLEADOS
#INSERTA UNA SECCION (ASIGNALE UN DIRECTOR NULO)
#INSERTA UN CLIENTE
#INSERTA UN EQUIPO COMPUESTO POR 3 COMPONENTES
#EL CLIENTE COMPRA UNO DE ESOS EQUIPOS Y 3 COMPONENTES IGUALES