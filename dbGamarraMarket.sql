-- Poner en uso la base de datos dbGamarraMarket
USE dbGamarraMarket;
/* crear tabla CLIENTE */
CREATE TABLE CLIENTE
(
    id int AUTO_INCREMENT,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
    );
    
/* listar estructura de la tabla CLIENTE*/
    SHOW COLUMNS IN CLIENTE;
    
/* agregar columna de estado civil */
ALTER TABLE CLIENTE
      ADD COLUMN estado_civil char(1);
      
/* eliminar clomuna fecha_nacimiento */
ALTER TABLE CLIENTE
      DROP COLUMN fecha_nacimiento;
      
/* eliminar tabla CLIENTE */
DROP TABLE CLIENTE;

CREATE TABLE VENDEDOR (
    id int AUTO_INCREMENT,
    tipo_documento char(3),
    numero_documento char(15),
    nombres varchar(60),
    apellidos varchar(80),
    salario decimal(8,2),
    celular char(9),
    email varchar(80),
    activo bool,
    CONSTRAINT VENDEDOR_pk PRIMARY KEY (id)
    );

CREATE TABLE VENTA (
    id int AUTO_INCREMENT,
    fecha_hora timestamp,
    activo bool,
    cliente_id int,
    vendedor_id int,
     CONSTRAINT VENTA_pk PRIMARY KEY (id)
);

CREATE TABLE PRENDA (
    id int AUTO_INCREMENT,
    descripcion varchar(90),
    marca varchar(60),
    cantidad int,
    talla varchar(10),
    precio decimal(8,2),
    activo bool,
    CONSTRAINT PRENDA_pk PRIMARY KEY (id)
);

CREATE TABLE VENTA_DETALLE (
    id int AUTO_INCREMENT,
    cantidad int,
    venta_id int,
    prenda_id int,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (id)
);


/* relacion VENTA_CLIENTE */
ALTER TABLE VENTA
       ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE VENTA
       ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY (vendedor_id)
    REFERENCES VENDEDOR (id)
    ON UPDATE CASCADE
    ON DELETE SET NULL;
    
ALTER TABLE VENTA_DETALLE
       ADD CONSTRAINT DETALLE_VENTA FOREIGN KEY (venta_id)
    REFERENCES VENTA(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;
    
ALTER TABLE VENTA_DETALLE
       ADD CONSTRAINT DETALLE_PRENDA FOREIGN KEY (prenda_id)
    REFERENCES PRENDA (id)
    ON UPDATE CASCADE
    ON DELETE SET NULL;
    
SHOW TABLES; 

-- PARA EL RESTO DE TABLAS: 
DESCRIBE CLIENTE;
-- Insertar datos en CLIENTE
INSERT INTO CLIENTE
(id, tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo)
VALUES
(1, 'DNI', '77889955', 'Alberto', 'Solano Pariona', 'alberto.pariona@empresa.com', '998456103', '1970-02-10', 1),
(2, 'DNI', '45781233', 'Alicia', 'García Campos', 'alicia.garcia@gmail.com', '980033210', '1980-03-20', 1),
(3, 'DNI', '31548792', 'Juana', 'Avila Chumpitaz', 'juana.avila@gmail.com', '923568741', '1992-04-11', 1),
(4, 'CNE', '122116633', 'Ana', 'Enríquez Flores', 'ana.enriquez@empresa.com', '978846523', '1985-07-30', 1),
(5, 'CNE', '08874159', 'Claudia', 'Perales Ortíz', 'claudia.perales@outlook.com', '997843563', '1981-12-25', 1),
(6, 'DNI', '41522587', 'Mario', 'Barrios Martínez', 'mario.barrios@outlook.com', '986525871', '1987-10-11', 1),
(7, 'CNE', '17525864', 'Brunela', 'Tarazona Guerra', 'brunela.tarazona@gmail.com', '994556312', '1991-05-06', 1),
(8, 'DNI', '47145365', 'Alejandro', 'Jimenez Huapaya', 'alejandro.jimenez@gmail.com', '941525365', '1965-08-19', 1),
(9, 'DNI', '15352285', 'Claudia', 'Marquez Litaño', 'claudia.marquez@gmail.com', '985814273', '1991-10-01', 1),
(10, 'CNE', '465775287', 'Mario', 'Rodríguez Mayo', 'mario.rodriguez@gmail.com', '912662587', '1978-11-11', 1),
(11, 'CNE', '837952514', 'Luisa', 'Guerra Ibarra', 'luisa.guerra@yahoo.com', '974422138', '1988-12-21', 1),
(12, 'DNI', '74142855', 'Pedro Alberto', 'Candela Valenzuela', 'pedro.candela@gmail.com', '941848525', '1995-06-30', 1),
(13, 'DNI', '53298147', 'Angel Mario', 'Rojas Avila', 'angel.rojas@outlook.com', '985514326', '1975-03-02', 1),
(14, 'DNI', '11453265', 'Hilario Felipe', 'Avila Huapaya', 'hilario.avila@gmail.com', '985514326', '2005-09-24', 1),
(15, 'CNE', '757472186', 'Octavio', 'Marquez Osorio', 'octavio.marquez@yahoo.es', '966223141', '2000-09-22', 1),
(16, 'DNI', '558693219', 'Manolo Enrique', 'Saquez Saravia', 'manolo.vasquez@outlook.es', '912652147', '1998-04-23', 1),
(17, 'DNI', '41552567', 'Genoveva', 'Ortiz Quispe', 'genoveva.ortiz@outlook.es', '925641437', '2003-06-24', 1),
(18, 'DNI', '49985471', 'Oscar', 'Quiroz Zavala', 'oscar.quiroz@gmail.com', '988223145', '2005-11-10', 1),
(19, 'DNI', '49922127', 'Verónica', 'Romero Vargas', 'veronica.romero@yahoo.com', '940112546', '2002-08-25', 1),
(20, 'DNI', '00253641', 'Eliseo', 'Prada Ortíz', 'eliseo.prada@yahoo.com', '998741520', '2004-09-15', 1);

-- Insertar datos de nuevos CLIENTE
INSERT INTO CLIENTE
(id, tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo)
VALUES
(21, 'DNI', '883225463', 'Gustavo Tadeo', 'Quispe Solorzano', 'gustavo.quispe@gmail.com', '2001-10-13', 1),
(22, 'DNI', '15753955', 'Daniela', 'Solís Vargas', 'daniela.soliz@outlook.com', '1993-11-09', 1),
(23, 'DNI', '76314895', 'Milton Gregorio', 'Vásquez Iturrizaga', 'milton.gregorio@yahoo.es', '974815233', '2004-06-22', 1),
(24, 'DNI', '84725001', 'Verónica', 'Ancajima Araujo', 'veronica.ancajima@yahoo.com', '1980-11-07', 1),
(25, 'DNI', '11228514', 'Felicita', 'Marroquín Candela', 'felicita.marroquin@outlook.com', '966001472', '2006-06-06', 1),
(26, 'DNI', '51436952', 'Luhana', 'Ortíz Rodríguez', 'luhana.ortiz@outlook.com', '960405017', '1980-11-25', 1);

-- Insertar datos en VENDEDOR
INSERT INTO VENDEDOR
(id, tipo_documento, numero_documento, nombres, apellidos, salario, celular, email, activo)
VALUES
(1, 'DNI', '85471236', 'Enrique', 'Pérez Manco', 1500.00, '96521873', 'enrique.perez@outlook.com', 1),
(2, 'DNI', '47259136', 'Sofía', 'Ávila Solis', 1350.00, '96521874', 'sofia.avila@gmail.com', 1),
(3, 'DNI', '61542280', 'Marcela', 'Napaico Cama', 1600.00, '965874357', 'marcela.napaico@gmail.com', 1),
(4, 'CNE', '742536140', 'Carmelo', 'Rodríguez Chauca', 1550.00, '965874358', 'carmelo.rodriguez@yahoo.com', 1);

-- Insertar datos en PRENDA
INSERT INTO PRENDA (id, descripcion, marca, cantidad, talla, precio, activo) VALUES
(1, 'Pantalon Jeans', 'Levis', 60, '28', 65.80, 1),
(2, 'Camisa manga corta', 'Adams', 75, '16', 55.00, 1),
(3, 'Polo sport', 'Australia', 100, '16', 40.00, 1),
(4, 'Camisa manga larga', 'Newport', 150, '16', 42.50, 1),
(5, 'Pijama para caballero', 'Adams', 180, '28', 79.50, 1),
(6, 'Corbata', 'Maxwell', 85, '16', 14.50, 1),
(7, 'Pijama para dama', 'Adams', 170, '24', 55.50, 1),
(8, 'Pantalon Jeans', 'Australia', 200, '28', 68.50, 1),
(9, 'Camisa Sport', 'John Holden', 85, '16', 88.50, 1),
(10, 'Shorts Jeans', 'Pepe Jeans', 185, '28', 77.20, 1);

-- Insertar datos en VENTA
INSERT INTO VENTA (id, fecha_hora, cliente_id, vendedor_id, activo) VALUES
(1, '2023-05-01 19:04:08', 4, 1, 1),
(2, '2023-05-01 19:04:08', 6, 3, 1),
(3, '2023-05-01 19:04:08', 10, 1, 1),
(4, '2023-05-01 19:04:08', 18, 4, 1);

-- Insertar datos en VENTA_DETALLE
INSERT INTO VENTA_DETALLE (id, venta_id, prenda_id, cantidad) VALUES
(1, 1, 6, 3),
(2, 1, 3, 5),
(3, 1, 2, 7),
(4, 2, 2, 3),
(5, 3, 7, 4),
(6, 3, 10, 6),
(7, 3, 2, 6),
(8, 3, 5, 7),
(9, 4, 2, 4),
(10, 4, 5, 3);

-- 9. Actualizar celular de Mario Rodríguez Mayo
UPDATE CLIENTE
SET celular = '922881101'
WHERE nombres = 'Mario' AND apellidos = 'Rodríguez Mayo';

-- 10. Actualizar celular de Ángel Manuel Rojas Ávila (DNI 53298147)
UPDATE CLIENTE
SET celular = '977226604'
WHERE numero_documento = '53298147';

-- 11. Eliminar lógicamente los clientes con DNI: 11453265, 74142585, 49985471
UPDATE CLIENTE
SET activo = 0
WHERE numero_documento IN ('11453265', '74142585', '49985471');

-- 12. Dejar en blanco el celular de los clientes con DNI: 87952514, 55869321, 74142585
UPDATE CLIENTE
SET celular = ''
WHERE numero_documento IN ('87952514', '55869321', '74142585');

-- 13. Reactivar a Oscar César Quiroz Zavala y actualizar su correo
UPDATE CLIENTE
SET activo = 1,
    email = 'oscar.quiroz@yahoo.es'
WHERE nombres = 'Oscar César' AND apellidos = 'Quiroz Zavala';

-- 14. Actualizar el Producto 
UPDATE PRODUCTO
SET precio = 45.00
WHERE descripcion = 'Polo sport' AND marca = 'Australia';

-- 14. Cambiar el nombre de la Prenda
UPDATE PRODUCTO
SET descripcion = 'Corbata Michi elegante'
WHERE id = 6;

-- 17. Eliminar físicamente las prendas: Camisa manga corta y Camisa Sport
DELETE FROM prendas
WHERE nombre IN ('Camisa manga corta', 'Camisa Sport');

-- 18. Eliminar físicamente a la vendedora Marcela Napaico Cama
DELETE FROM vendedoras
WHERE nombre = 'Marcela Napaico Cama';

-- 19. Eliminar físicamente los clientes cuyos números de documentos son: 47142536 y 77889955
DELETE FROM clientes
WHERE documento IN (47142536, 77889955);

-- 20. Eliminar todos los clientes nacidos en el año 1980
DELETE FROM clientes
WHERE YEAR(fecha_nacimiento) = 1980;

-- Consultas útiles
SHOW TABLES;
SELECT * FROM CLIENTE;
SELECT * FROM VENDEDOR;
SELECT * FROM PRENDA;
SELECT * FROM VENTA;
SELECT * FROM VENTA_DETALLE;

DESCRIBE CLIENTE;
DESCRIBE VENDEDOR;
DESCRIBE VENTA;
DESCRIBE VENTA_DETALLE;
DESCRIBE PRENDA;

-- Ver claves foráneas
SELECT 
  i.constraint_name, k.table_name, k.column_name, 
  k.referenced_table_name, k.referenced_column_name 
FROM information_schema.TABLE_CONSTRAINTS i
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
  ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY'
  AND i.TABLE_SCHEMA = DATABASE();