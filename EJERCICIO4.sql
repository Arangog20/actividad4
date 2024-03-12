SHOW DATABASES;

--CREAR TABLA
CREATE TABLE vehiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR (45),
    placa VARCHAR(45),
    id_color INT,
    id_tipo INT 
);

DROP TABLE vehiculos,tipo_vehiculo,marcas,colores;

CREATE TABLE tipo_vehiculo(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(45),
    id_marca INT
);
CREATE TABLE marcas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(45)
);
CREATE TABLE colores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    color VARCHAR (45)
);


--INSERTAR EN TABLA
INSERT INTO colores (color) 
VALUES ('blanco'),('negro');

INSERT INTO marcas (marca) 
VALUES ('audi'),('fiat');

INSERT INTO tipo_vehiculo (tipo,id_marca) 
VALUES ('camioneta',1),('automovil',2);

INSERT INTO vehiculos (modelo,placa,id_color,id_tipo) 
VALUES('2023','asd123',1,1),
('2024','sdf234',2,2),
('2014','dfg345',2,1),
('2024','fgh456',1,2),
('2010','asd124',2,1),
('2015','sdf235',1,1),
('2015','dfg346',2,1),
('2022','fgh457',1,2),
('2015','fgh467',2,2),
('2024','fsa234',2,1);

 /*AÑADIR LLAVES FORANEAS*/
ALTER  TABLE vehiculos ADD Foreign Key  (id_color) REFERENCES colores (id);
ALTER TABLE vehiculos ADD Foreign Key (id_tipo) REFERENCES tipo_vehiculo (id);

ALTER TABLE tipo_vehiculo  ADD Foreign Key (id_marca) REFERENCES marcas (id);

/*CONSULTAS*/

SELECT vehiculos.modelo, vehiculos.placa, colores.color,tipo_vehiculo.tipo 
FROM vehiculos 
    INNER JOIN colores ON 
        vehiculos.id_color = colores.id
    INNER JOIN tipo_vehiculo ON
        vehiculos.id_tipo = tipo_vehiculo.id;



-- CREAR VIEWS 
--1
CREATE VIEW vista_vehiculos as 
SELECT * 
FROM vehiculos
WHERE modelo = "2024"

DROP VIEW vista_vehiculos

SELECT * FROM vista_vehiculos

--2
CREATE VIEW vista_coid_tipolores AS
SELECT*
FROM colores 
WHERE color = "blanco"

SELECT * FROM vista_colores

--3

CREATE VIEW vista_tipos AS
SELECT vehiculos.modelo, tipo_vehiculo.tipo
FROM vehiculos
INNER JOIN tipo_vehiculo
WHERE vehiculos.id_tipo = tipo_vehiculo.id

DROP VIEW  vista_tipos

SELECT * FROM vista_tipos

--4
select * from vehiculos

SELECT * FROM tipo_vehiculo

SELECT * FROM marcas

CREATE VIEW vista_marcas AS
SELECT vehiculos.placa, marcas.marca
FROM vehiculos
INNER JOIN tipo_vehiculo 
INNER JOIN marcas
WHERE vehiculos.id_tipo = tipo_vehiculo.id and tipo_vehiculo.id_marca = marcas.id 

drop view vista_marcas

SELECT * FROM vista_marcas
 
--5

CREATE VIEW vista_placas AS
SELECT placa
FROM vehiculos

SELECT * FROM vista_placas

-- CREAR PROCEDIMIENTOS
--1
DELIMITER //
CREATE PROCEDURE vehiculos_con_numero(IN numero VARCHAR (10))
BEGIN 
SELECT * FROM vehiculos WHERE placa LIKE numero;
END //
DELIMITER;

CALL vehiculos_con_numero("1")

drop Procedure vehiculos_con_numero


 
