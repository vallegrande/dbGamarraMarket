/* Crear base de datos dbGamarraMarket */
DROP DATABASE IF EXISTS dbGamarraMarket;

CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

/* Poner en uso la base de datos dbGamarraMarket */
USE dbGamarraMarket;

/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE (
    id INT AUTO_INCREMENT,
    tipo_documento CHAR(3) NOT NULL,
    numero_documento CHAR(9) NOT NULL UNIQUE,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    email VARCHAR(80),
    celular CHAR(9),
    fecha_nacimiento DATE,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);

/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN CLIENTE;

/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;

/* Agregar columna estado civil */
ALTER TABLE CLIENTE
ADD COLUMN estado_civil char (1);

/* Eliminar columna fecha_nacimiento */
ALTER TABLE CLIENTE
DROP COLUMN fecha_nacimiento;

/* Eliminar la tabla CLIENTE */
DROP TABLE CLIENTE;

/* Poner en uso la base de datos dbGamarraMarket */
USE dbGamarraMarket;

/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE (
    id INT AUTO_INCREMENT,
    tipo_documento CHAR(3) NOT NULL,
    numero_documento CHAR(15) NOT NULL UNIQUE,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    celular CHAR(9),
    fecha_nacimiento DATE,
    activo BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id)
);

/* Crear la tabla VENDEDOR */
CREATE TABLE VENDEDOR (
    id INT AUTO_INCREMENT,
    tipo_documento CHAR(3) NOT NULL,
    numero_documento VARCHAR(15) NOT NULL UNIQUE,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    salario DECIMAL(8,2),
    celular CHAR(9),
    email VARCHAR(80),
    activo BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id)
);

/* Crear la tabla PRENDA */
CREATE TABLE PRENDA (
    id INT AUTO_INCREMENT,
    marca VARCHAR(60) NOT NULL,
    descripcion VARCHAR(90),
    cantidad INT,
    talla VARCHAR(10),
    precio DECIMAL(8,2),
    activo BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id)
);

/* Crear la tabla VENTA */
CREATE TABLE VENTA (
    id INT AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    vendedor_id INT NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id),
    FOREIGN KEY (vendedor_id) REFERENCES VENDEDOR(id)
);

/* Crear la tabla VENTA_DETALLE */
CREATE TABLE VENTA_DETALLE (
    id INT AUTO_INCREMENT,
    cantidad INT NOT NULL,
    venta_id INT NOT NULL,
    prenda_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (venta_id) REFERENCES VENTA(id),
    FOREIGN KEY (prenda_id) REFERENCES PRENDA(id)
);

/* Listar las tablas */
SHOW TABLES FROM dbGamarraMarket;

/* Listar las estructuras de cada tabla */
SHOW COLUMNS FROM CLIENTE;
SHOW COLUMNS FROM VENDEDOR;
SHOW COLUMNS FROM VENTA;
SHOW COLUMNS FROM VENTA_DETALLE;
SHOW COLUMNS FROM PRENDA;

/* Crear relación VENTA_CLIENTE */
ALTER TABLE VENTA
ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (cliente_id)
REFERENCES CLIENTE (id)
ON UPDATE CASCADE
ON DELETE CASCADE;

/* Listar relaciones de tablas de la base de datos activa */
SELECT
i.CONSTRAINT_NAME,
    k.TABLE_NAME,
    k.COLUMN_NAME,
    k.REFERENCED_TABLE_NAME,
    k.REFERENCED_COLUMN_NAME
FROM
    information_schema.TABLE_CONSTRAINTS i
LEFT JOIN
    information_schema.KEY_COLUMN_USAGE k
    ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME
    AND i.TABLE_SCHEMA = k.TABLE_SCHEMA
WHERE
    i.CONSTRAINT_TYPE = 'FOREIGN KEY'
    AND i.TABLE_SCHEMA = DATABASE();
    
    /* Eliminar la relación VENTA_CLIENTE */
ALTER TABLE VENTA
DROP CONSTRAINT VENTA_CLIENTE;

/* Crear relaciones de tablas */
-- Relación: VENTA → CLIENTE
ALTER TABLE VENTA
ADD CONSTRAINT fk_venta_cliente
FOREIGN KEY (cliente_id)
REFERENCES CLIENTE(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Relación: VENTA → VENDEDOR
ALTER TABLE VENTA
ADD CONSTRAINT fk_venta_vendedor
FOREIGN KEY (vendedor_id)
REFERENCES VENDEDOR(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Relación: VENTA_DETALLE → VENTA
ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT fk_ventadetalle_venta
FOREIGN KEY (venta_id)
REFERENCES VENTA(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Relación: VENTA_DETALLE → PRENDA
ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT fk_ventadetalle_prenda
FOREIGN KEY (prenda_id)
REFERENCES PRENDA(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;

/* Listar las estructuras de cada tabla */
SHOW COLUMNS FROM CLIENTE;
SHOW COLUMNS FROM VENDEDOR;
SHOW COLUMNS FROM VENTA;
SHOW COLUMNS FROM VENTA_DETALLE;
SHOW COLUMNS FROM PRENDA;

/* Listar relaciones de tablas de la base de datos activa */
SELECT
i.CONSTRAINT_NAME,
    k.TABLE_NAME,
    k.COLUMN_NAME,
    k.REFERENCED_TABLE_NAME,
    k.REFERENCED_COLUMN_NAME
FROM
    information_schema.TABLE_CONSTRAINTS i
LEFT JOIN
    information_schema.KEY_COLUMN_USAGE k
    ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME
    AND i.TABLE_SCHEMA = k.TABLE_SCHEMA
WHERE
    i.CONSTRAINT_TYPE = 'FOREIGN KEY'
    AND i.TABLE_SCHEMA = DATABASE();




















