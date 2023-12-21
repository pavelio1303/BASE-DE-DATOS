DROP SCHEMA IF EXISTS ZOO;
CREATE SCHEMA ZOO;
USE ZOO;

CREATE TABLE ESPECIE(
	NOMBRE_CIENTIFICO VARCHAR(100) PRIMARY KEY,
    DESCRIPCION MEDIUMTEXT NOT NULL,
    FOTO MEDIUMBLOB
);

INSERT INTO ESPECIE VALUES
("CANIS LUPUS", "ANIMALICOS MU BONICOS Y MU BUENOS", NULL);

CREATE TABLE ESPECIE_TIENE_NOMBRE_COMUN(
	NOMBRE_COMUN VARCHAR(50) NOT NULL,
    NOMBRE_CIENTIFICO_ESPECIE VARCHAR(100),
    
    PRIMARY KEY (NOMBRE_COMUN, NOMBRE_CIENTIFICO_ESPECIE),
    FOREIGN KEY (NOMBRE_CIENTIFICO_ESPECIE) REFERENCES ESPECIE(NOMBRE_CIENTIFICO)
);

CREATE TABLE RECORRIDO(
	CODIGO INT PRIMARY KEY AUTO_INCREMENT,
    LONGITUD DECIMAL(5,2),	# TAMBIEN SE PODRÍA PONER AQUI UNSIGNED AL FINAL
    TIEMPO TIME,
    NUMERO_MAX_VISITANTES MEDIUMINT,
    
    CONSTRAINT TIEMPO_MINIMO CHECK (TIEMPO>"00:30:00"),
    CONSTRAINT LONGITUD_MINIMA CHECK (LONGITUD>0)
);

INSERT INTO RECORRIDO VALUES
(DEFAULT,30,"00:45:00",200);

CREATE TABLE HABITAT(
	NOMBRE VARCHAR(50) PRIMARY KEY,
    CLIMA VARCHAR(20) DEFAULT "SOLEADO",
    VEGETACION VARCHAR(50),
    CODIGO_RECORRIDO INT,
    
    FOREIGN KEY (CODIGO_RECORRIDO) REFERENCES RECORRIDO(CODIGO)
);

INSERT INTO HABITAT VALUES
("TUNDRA",DEFAULT,"HELECHOS",1);

CREATE TABLE ESPECIE_VIVE_HABITAT(
	NOMBRE_CIENTIFICO_ESPECIE VARCHAR(100),
	NOMBRE_HABITAT VARCHAR(50),
    INDICE_VULNERABILIDAD TINYINT,
  
    PRIMARY KEY (NOMBRE_CIENTIFICO_ESPECIE, NOMBRE_HABITAT),
    FOREIGN KEY (NOMBRE_CIENTIFICO_ESPECIE) REFERENCES ESPECIE(NOMBRE_CIENTIFICO),
    FOREIGN KEY (NOMBRE_HABITAT) REFERENCES HABITAT(NOMBRE),
    
    CONSTRAINT INDICE_VULNERABILIDAD_VALOR CHECK (INDICE_VULNERABILIDAD BETWEEN 0 AND 10) # TAMBIEN SE PODRÍA PONER (INDICE_VULNERABILIDAD => 0 AND INDICE_VULNERABILIDAD <= 10)
);

INSERT INTO ESPECIE_VIVE_HABITAT VALUES
("CANIS LUPUS","TUNDRA","6");

SELECT*FROM ESPECIE_VIVE_HABITAT;