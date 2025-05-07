USE dbbycint;
INSERT INTO categoria (id_categoria, nombre_categoria)
VALUES 
(1, 'Maquillaje'),
(2, 'Cuidado facial'),
(3, 'Fragancias'),
(4, 'Cuidado corporal');

INSERT INTO cliente (id_cliente, tipo_documento, numero_documento, nombres, apellidos, sexo, telefono, correo, direccion, fecha_nacimiento, fecha_registro)
VALUES 
(1, 'DNI', '12345678', 'Ana', 'García Pérez', 'F', '987654321', 'ana.garcia@email.com', 'Av. Siempre Viva 123', '1985-07-15', '2025-05-07'),
(2, 'DNI', '87654321', 'Carlos', 'Martínez Díaz', 'M', '998877665', 'carlos.martinez@email.com', 'Calle Ficticia 456', '1992-12-20', '2025-05-07'),
(3, 'DNI', '11223344', 'Sofía', 'López Fernández', 'F', '945678123', 'sofia.lopez@email.com', 'Zona Rosa 789', '1990-03-25', '2025-05-07');

INSERT INTO producto (id_producto, nombre, descripcion, precio_unitario, stock, id_categoria)
VALUES 
(1, 'Base líquida', 'Base líquida para maquillaje de larga duración', 25.50, 100, 1),
(2, 'Crema facial', 'Crema hidratante con propiedades anti-envejecimiento', 15.30, 50, 2),
(3, 'Perfume floral', 'Perfume con notas florales frescas', 40.00, 80, 3),
(4, 'Exfoliante corporal', 'Exfoliante corporal con sales marinas', 18.90, 70, 4);

INSERT INTO pedido (id_pedido, id_cliente, fecha_pedido, estado)
VALUES 
(1, 1, '2025-05-07', 'En proceso'),
(2, 2, '2025-05-06', 'Completado'),
(3, 3, '2025-05-05', 'En proceso');

INSERT INTO detalle_pedido (detalle_pedido, id_pedido, id_producto, cantidad, precio_unitario)
VALUES 
(1, 1, 1, 2, 25.50),  -- Ana García compró 2 Bases líquidas
(2, 1, 2, 1, 15.30),  -- Ana García compró 1 Crema facial
(3, 2, 3, 3, 40.00),  -- Carlos Martínez compró 3 Perfumes florales
(4, 3, 4, 1, 18.90);  -- Sofía López compró 1 Exfoliante corporal

-- Ver los registros de la tabla categoria
SELECT * FROM categoria;

-- Ver los registros de la tabla cliente
SELECT * FROM cliente;

-- Ver los registros de la tabla producto
SELECT * FROM producto;

-- Ver los registros de la tabla pedido
SELECT * FROM pedido;

-- Ver los registros de la tabla detalle_pedido
SELECT * FROM detalle_pedido;






