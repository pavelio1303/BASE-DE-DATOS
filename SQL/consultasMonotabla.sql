USE WORLD;

SELECT * FROM CITY;

SELECT * FROM COUNTRY;

SELECT * FROM COUNTRYLANGUAGE;

# SELECIONAR COLUMNAS CONCRETAS PERO TODAS LAS FILAS:
SELECT NAME, CONTINENT FROM COUNTRY;

# SELECCIONAR COLUMNAS CON ALIAS:
SELECT NAME AS NOMBRE, CONTINENT AS CONTINENTE FROM COUNTRY;

SELECT NAME AS PAIS, SURFACEAREA FROM COUNTRY;

# CLÁUSULA WHERE, poner condiciones que queremos que se cumplan detrás del where.
SELECT * FROM COUNTRY WHERE NAME = "SPAIN";

# EJ.1 - MUESTRA LOS PAÍSES DE EUROPA CON MÁS DE 5 M DE HABITANTES.
SELECT * FROM COUNTRY WHERE CONTINENT = "EUROPE" AND POPULATION > 5000000 ;

# EJ.2 - MUESTRA EL NOMBRE DE LOS PAÍSES CON MÁS DE 80 M DE HABITANTES.
SELECT NAME FROM COUNTRY WHERE POPULATION > 80000000 ;

# EJ.3 - MUESTRA LOS PAÍSES CUYA JEFA DE ESTADO SEA ISABEL II.
SELECT * FROM COUNTRY WHERE HEADOFSTATE = "ELISABETH II" ;

# CLÁSULUA DISTINCT, muestra solo los valores sin repetir de dicha columna, en lugar de todos aun estando repetidos.
SELECT DISTINCT CONTINENT FROM COUNTRY;

# EJ.4 - SELECCIONA LAS DISTINTAS REGIONES DE EUROPA
SELECT DISTINCT REGION FROM COUNTRY WHERE CONTINENT = "EUROPE";

# EJ.5 - SELECCIONA LOS DISTRITOS EN LOS QUE SE DIVIDE ESPAÑA (TABLA CITY)
SELECT DISTINCT DISTRICT FROM CITY WHERE COUNTRYCODE = "ESP";

# FUNCIÓN COUNT, contar cuantos elementos hay en las tablas.
SELECT COUNT(*) FROM COUNTRY WHERE CONTINENT = "EUROPE";

# EJ.6 - CUANTOS PAISES DE EUROPA ESTÁN EN EL SUR.
SELECT COUNT(*) FROM COUNTRY WHERE REGION = "SOUTHERN EUROPE";

# EJ.7 - CUANTOS PAISES AFRICANOS TIENEN MÁS DE 50 M DE HABITANTES.
SELECT COUNT(*) FROM COUNTRY WHERE CONTINENT = "AFRICA" AND POPULATION > 50000000;

# EJ.8 - CUANTAS CIUDADES DE ALEMANIA QUE HAY EN LA BBDD.
SELECT COUNT(*) FROM CITY WHERE COUNTRYCODE = "DEU";

# EJ.9 - IDIOMAS QUE SE HABLEN EN ESPAÑA DE FORMA OFICIAL.
SELECT * FROM COUNTRYLANGUAGE WHERE COUNTRYCODE = "ESP" AND ISOFFICIAL = "T";

# EJ.10 - EN QUE PAISES EL ESPAÑOL ES LENGUA OFICIAL.
SELECT * FROM COUNTRYLANGUAGE WHERE LANGUAGE = "SPANISH" AND ISOFFICIAL = "T";

# EJ.11 - CUANTAS CIUDADES DE ESPAÑA TIENEN MÁS DE 1M DE HABITANTES.
SELECT COUNT(*) FROM CITY WHERE COUNTRYCODE = "ESP" AND POPULATION > 1000000;

# ORDENAR UN RESULTADO

SELECT * FROM COUNTRY ORDER BY SURFACEAREA DESC;	# 'DESC' ES DESCENDENTE Y 'ASC' ES ASCENDENTE

# EJ.12 - ¿CUÁL ES EL PAÍS MÁS POBLADO DEL MUNDO?
SELECT * FROM COUNTRY ORDER BY POPULATION DESC LIMIT 1;

# EJ.13 - ¿CUÁL ES EL PAÍS MÁS POBLADO DE EUROPA?
SELECT * FROM COUNTRY WHERE CONTINENT = "EUROPE" ORDER BY POPULATION DESC;

# EJ.14 - MUESTRA LAS REGIONES DE EUROPA ORDENADAS ALFABÉTICAMENTE
SELECT DISTINCT REGION FROM COUNTRY WHERE CONTINENT = "EUROPE" ORDER BY REGION;

# ESTO ES CURIOSIDAD MIA
SELECT * FROM COUNTRY ORDER BY LIFEEXPECTANCY DESC;

# EJ.15 - 5 CIUDADES MÁS POBLADAS DE ESPAÑA 
SELECT * FROM CITY WHERE COUNTRYCODE = "ESP" ORDER BY POPULATION DESC LIMIT 5;

# EJ.16 - PAISES DEL MUNDO CON NUM DE HABITANTES ENTRE 1M Y 5M
SELECT NAME FROM COUNTRY WHERE POPULATION BETWEEN 1000000 AND 5000000 ORDER BY POPULATION DESC;

# EJ.17 - PAÍS DE AMÉRICA CON MAYOR SUPERFICIE
SELECT NAME FROM COUNTRY WHERE CONTINENT IN ("NORTH AMERICA","SOUTH AMERICA") ORDER BY SURFACEAREA DESC LIMIT 1;

SELECT NAME FROM COUNTRY WHERE CONTINENT LIKE "%AMERICA%" ORDER BY SURFACEAREA DESC LIMIT 1; # % DENTRO DE "..." SIGNIFICA LO QUE SEA EN LA CANTIDAD QUE SEA, PARA BUSCAR UNA PALABRA CLAVE.

# EJ.18 - PAIS DEL CARIBE CON MAYOR ESPERANZA DE VIDA
SELECT NAME FROM COUNTRY WHERE REGION = "CARIBBEAN" ORDER BY LIFEEXPECTANCY DESC LIMIT 1;

# EJ.19 - PAISES CON MENOS DE 60 AÑOS DE ESPERANZA DE VIDA
SELECT * FROM COUNTRY WHERE LIFEEXPECTANCY < 60 ORDER BY LIFEEXPECTANCY DESC;

# EJ.20 - MUESTRA UNA LISTA DE LAS FORMAS DE GOBIERNO ORDENADA DE FORMA ALFABÉTICA
SELECT DISTINCT GOVERNMENTFORM FROM COUNTRY ORDER BY GOVERNMENTFORM;

# EJ.21 - MUESTRA LOS PAÍSES QUE SON ALGÚN TIPO DE MONARQUÍA
SELECT NAME FROM COUNTRY WHERE GOVERNMENTFORM LIKE "%MONARCHY%";

# EJ.22 - CUANTOS PAÍSES COMIENZAN POR LA LETRA A
SELECT COUNT(*) FROM COUNTRY WHERE NAME LIKE "A%";

# EJ.23 - MUESTRA UNA LISTA DE LOS TIPOS DE REPÚBLICAS QUE HAY, ORDENADA DE FORMA ALFABÉTICA
SELECT DISTINCT GOVERNMENTFORM FROM COUNTRY WHERE GOVERNMENTFORM LIKE "%REPUBLIC%" ORDER BY GOVERNMENTFORM;

# EJ.24 - MUESTRA LOS 5 PAÍSES CON MENOS ESPERANZA DE VIDA
SELECT * FROM COUNTRY WHERE LIFEEXPECTANCY IS NOT NULL ORDER BY LIFEEXPECTANCY LIMIT 5;

# EJ.25 - ¿CUÁNTOS PAÍSES TIENEN FECHA DE INDEPENDENCIA?
SELECT COUNT(*) FROM COUNTRY WHERE INDEPYEAR IS NOT NULL;

SELECT COUNT(INDEPYEAR) FROM COUNTRY;	# ESTO ES LO MISMO QUE ARRIBA

# EJ.26 - ¿PARA CUÁNTOS PAÍSES NO DISPONEMOS DEL DATO DE ESPERANZA DE VIDA?
SELECT COUNT(*) FROM COUNTRY WHERE LIFEEXPECTANCY IS NULL;

# EJ.27 - ¿CUÁNTAS REGIONES HAY?
SELECT COUNT(DISTINCT REGION) AS REGIONES FROM COUNTRY;

# OPERACIONES
SELECT "DATO" AS COLUMNA;

SELECT 2*2 AS PRODUCTO;

SELECT 2/2 AS DIVISIÓN;

SELECT 2%2 AS MÓDULO;

# EJ.28 - MUESTRA UNA LISTA DE PAÍSES Y SE DENSIDAD DE POBLACIÓN
SELECT NAME, POPULATION/SURFACEAREA AS DENSIDAD_POBLACION FROM COUNTRY ORDER BY DENSIDAD_POBLACION DESC;

# EJ.29 - MUESTRA EL PRODUCTO NACIONAL BRUTO (GNP) PER CÁPITA DE ARGENTINA

# ...

# EJ.35 ¿CUAL ES LA ESPERANZA DE VIDA DE AFRICA?
SELECT AVG(LIFEEXPECTANCY) FROM COUNTRY WHERE CONTINENT = "AFRICA";

# EJ.36 ¿CUAL ES LA SUPERFICIE TOTAL DE TODO EL MUNDO?
SELECT SUM(SURFACEAREA) FROM COUNTRY ;

# EJ.37 ¿CUANTAS CIUDADES DE ANDALUCIA HAY EN LA BBDD?
SELECT COUNT(NAME) FROM CITY WHERE DISTRICT = "ANDALUSIA";

# EJ.38 ¿CUAL ES EL VALOR MAXIMO DEL GNP?¿A QUE PAIS CORRESPONDE?
SELECT NAME, GNP FROM COUNTRY WHERE GNP = (SELECT MAX(GNP) FROM COUNTRY);

# EJ.39 ¿CUAL ES EL VALOR MINIMO DEL GNP?¿A QUE PAIS CORRESPONDE?
SELECT NAME, GNP FROM COUNTRY WHERE GNP = (SELECT MIN(GNP) FROM COUNTRY);

# EJ.40 ¿EN QUE AÑO, DE MEDIA, SE INDEPENDIZARON LOS PAISES DE SUDAMERICA?
SELECT AVG(INDEPYEAR) FROM COUNTRY WHERE CONTINENT = "SOUTH AMERICA";

# EJ.41 ¿CUAL ES EL PAIS CON FECHA DE INDEPENDENCIA MAS CERCANA A HOY?

SELECT NAME, INDEPYEAR FROM COUNTRY WHERE INDEPYEAR = (SELECT MAX(INDEPYEAR) FROM COUNTRY);

# EJ.42 ¿QUE PAISES AMERICANOS TIENEN MAS POBLACION QUE ESPAÑA?
SELECT NAME FROM COUNTRY WHERE POPULATION > (SELECT POPULATION FROM COUNTRY WHERE NAME = "SPAIN") AND CONTINENT LIKE "%AMERICA%";

# EJ.43 ¿CUAL ES LA CIUDAD CON MAYOR POBLACION?
SELECT NAME, POPULATION FROM CITY WHERE POPULATION = (SELECT MAX(POPULATION) FROM CITY);

# EJ.44 ¿QUE PAISES TIENEN MENOS POBLACION QUE MADRID?
SELECT NAME FROM COUNTRY WHERE POPULATION < (SELECT POPULATION FROM CITY WHERE NAME = "MADRID");

# EJ.45 ¿HAY ALGUNA CIUDAD QUE SE LLAME IGUAL QUE ALGUN PAIS?
SELECT NAME FROM CITY WHERE NAME IN (SELECT NAME FROM COUNTRY);

# EJ.46 ¿QUE PAISES DE EUROPA Y ASIA TIENEN UNA POBLACION POR ENCIMA DE LA MEDIA DE ESOS CONTINENTES?
SELECT NAME FROM COUNTRY WHERE POPULATION > (SELECT AVG(POPULATION) FROM COUNTRY WHERE CONTINENT IN ("EUROPA","ASIA")) AND CONTINENT IN ("EUROPA","ASIA");

# EJ.47 ¿HAY ALGUN PAIS SIN CIUDADES EN LA BBDD?
SELECT NAME FROM COUNTRY WHERE CODE NOT IN (SELECT CODE FROM CITY);

# EJ.48 ¿CUANTAS CIUDADES NO SON CAPITALES?
SELECT NAME FROM CITY WHERE ID NOT IN (SELECT CAPITAL FROM COUNTRY);

# EJ.49 ¿CUAL ES LA POBLACION MEDIA DE LAS CIUDADES EUROPEAS?

# EJ.50 ¿CUAL ES LA POBLACION MEDIA DE LAS CAPITALES AMERICANAS?

# EJ.51 MUESTRA EL NOMBRE, LA SUOERFICIE, LA POBLACION Y LA DENSIDAD DE POBLACION DE JAPON Y ESPAÑA
SELECT NAME, SURFACEAREA, POPULATION, POPULATION/SURFACEAREA AS DENSIDAD_POBLACION FROM COUNTRY WHERE NAME IN ("JAPAN","SPAIN");
