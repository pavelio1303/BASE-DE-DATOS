#Ejercicio 1
#PLATO (NOMBRE, descripcion, foto, precio,nombre categoria,'NOMBRE_CATEGORÍA'(categoria))
#CATEGORIA (NOMBRE, descripcion)
#RECETA (CODGIO, tiempo_elaboracion, dificultad, 'nombre_plato'(PLATO))
#INGREDIENTE (NOMBRE, foto, stock)
#RECETA_USA_INGREDIENTE(CODIGO(RECETA), nombre(INGREDIENTE), cantidad, unidad de medida,)

CREATE SCHEMA RESTAURANTE;
USE RESTAURANTE;

CREATE TABLE CATEGORIA (
	NOMBRE VARCHAR(30) PRIMARY KEY,
    DESCRIPCION TINYTEXT
);

CREATE TABLE PLATO (
	NOMBRE VARCHAR(30) PRIMARY KEY,
    DESCRIPCION TINYTEXT,
    FOTO MEDIUMBLOB,
    PRECIO DECIMAL(5,2),
    NOMBRE_CATEGORIA VARCHAR(30),
    
    FOREIGN KEY(NOMBRE_CATEGORIA) REFERENCES CATEGORIA(NOMBRE)
);

CREATE TABLE RECETA(
	CODIGO INT PRIMARY KEY AUTO_INCREMENT,
    TIEMPO_ELABORACION TIME,
    DIFICULTAD VARCHAR(10),
    NOMBRE_PLATO VARCHAR(30),
    
    FOREIGN KEY(NOMBRE_PLATO) REFERENCES PLATO(NOMBRE)
);

CREATE TABLE INGREDIENTE(
	NOMBRE VARCHAR(30) PRIMARY KEY,
    FOTO MEDIUMBLOB,
    STOCK DECIMAL(3,2)
);

CREATE TABLE RECETA_USA_INGREDIENTE(
	CODIGO_USA INT,
    NOMBRE_USA VARCHAR(30),
    CANTIDAD DECIMAL(3,2),
    UNIDAD_MEDIDA VARCHAR(15),
    
    PRIMARY KEY (CODIGO_USA,NOMBRE_USA),
    
    FOREIGN KEY(CODIGO_USA) REFERENCES RECETA(CODIGO),
    FOREIGN KEY(NOMBRE_USA) REFERENCES INGREDIENTE(NOMBRE)
);