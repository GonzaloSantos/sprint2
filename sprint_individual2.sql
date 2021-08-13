
#Construya una base de datos. Asigne un usuario con todos los privilegios. Construya las tablas. 

#CREACION DE LA BASE DE DATOS
create database sprint_base;

# CREAR USUARIO ADMIN
create user 'sprint_base'@'localhost' identified by '123456';

#ASIGNA TODOS LOS PRIVILEGIOS AL USUARIO
GRANT ALL PRIVILEGES ON *.* TO 'sprint_base'@'localhost';

# CARGAR LOS PRIVILEGIOS
FLUSH PRIVILEGES;

-- ACTIVAR BASE DE DATOS
USE sprint_base;

-- CREACION DE TABLAS usuario --

CREATE TABLE  usuario (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `correo_electronico` VARCHAR(90) NOT NULL,
  `visitas` INT NULL DEFAULT 1,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;

-- INSERTA DATOS EN LAS TABLAS usuario--

INSERT INTO usuario(nombre,apellido,edad,correo_electronico,visitas)
VALUES
('Marcelo','Sarmiento',25,'marsar@gmail.com',1),
('Brandon','Mancilla',33,'bmanci@gmail.com',1),
('Hugo','Martinez',40,'hmartinez@gmail.com',4),
('Daniela','Lorca',29,'danilor@gmail.com',6),
('Jaime','Vivanco',32,'jvivan@gmail.com',3);


-- CREACION DE TABLAS operario --

CREATE TABLE Operario (
  `id_operario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `correo_electronico` VARCHAR(45) NOT NULL,
  `plataforma` INT NULL DEFAULT 1,
  PRIMARY KEY (`id_operario`))
ENGINE = InnoDB;

-- INSERTA DATOS EN LAS TABLAS operario--


INSERT INTO operario(nombre,apellido,edad,correo_electronico,plataforma)
VALUES
('Dante','Vasquez',36,'danvas@gmail.com',5),
('Jose','Andrade',26,'joseandra@gmail.com',6),
('Benjamin','Lonco',29,'benjalon@gmail.com',17),
('Yasna','Brito',28,'yasnab@gmail.com',9),
('Leonard','Cage',32,'leoncage@gmail.com',4);




  CREATE TABLE operario_usuario_calificacion (
  `id_operario` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `FECHA` DATE NOT NULL,
  `EVALUACION` INT NOT NULL,
  `numero_de_aplicaciones` INT NOT NULL,
    CONSTRAINT `id_usuario_fk`
    FOREIGN KEY (`id_usuario`)
    REFERENCES sprint_base.USUARIO(`id_usuario`)
	ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `id_operario_FK`
    FOREIGN KEY (`id_operario`)
    REFERENCES sprint_base.OPERARIO(`id_operario`)
    ON DELETE CASCADE ON UPDATE CASCADE,);

INSERT INTO operario_usuario_calificacion (id_operario, id_usuario, FECHA, EVALUACION, numero_de_aplicaciones)
VALUES
(544, 298382, '2021-05-04', 2, 1),
(566, 387200, '2021-06-07', 4, 2),
(687, 961345, '2020-11-05', 5, 3),
(639, 365614, '2021-03-12', 1, 2),
(541, 125439, '2021-02-14', 7, 3),
(417, 961345, '2021-01-10', 6 ,5),
(301, 518614, '2020-03-26', 4, 3),
(802, 871345, '2020-11-30', 5, 2),
(960, 610239, '2021-04-01', 3, 3),
(740, 610239, '2021-03-03', 4, 1);

#Seleccione las 3 operaciones con mejor evaluación.

SELECT id_operario, EVALUACION FROM operario_usuario_calificacion 
ORDER BY EVALUACION DESC
LIMIT 3;

#Seleccione las 3 operaciones con menos evaluación.

SELECT id_operario, EVALUACION FROM operario_usuario_calificacion 
ORDER BY EVALUACION ASC
LIMIT 3;

#Seleccione al operario que más soportes ha realizado.

SELECT id_operario, MAX(visitas) FROM operario_usuario_calificacion;

#Seleccione al cliente que menos veces ha utilizado la aplicación.

SELECT id_operario, MIN(visitas) FROM operario_usuario_calificacion;

#Agregue 10 años a los tres primeros usuarios registrados.

UPDATE usuario SET EDAD = EDAD + 10
ORDER BY id_usuario LIMIT 3;
SELECT * FROM usuario;

#Renombre todas las columnas ‘correo electrónico’. El nuevo nombre debe ser email.
#Seleccione solo los operarios mayores de 20 años.

ALTER TABLE usuario CHANGE COLUMN correo_electronico EMAIL
VARCHAR(45); SELECT * FROM usuario;








