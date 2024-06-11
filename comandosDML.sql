INSERT INTO cargo (cargo) VALUES 
('Gerente'),
('Mecánico'),
('Recepcionista');

INSERT INTO empleado (nombre, apellido, cargo_id) VALUES 
('Juan', 'Pérez', 1), -- El ID del cargo correspondiente al Gerente
('María', 'López', 2), -- El ID del cargo correspondiente al Mecánico
('Pedro', 'González', 2), -- El ID del cargo correspondiente al Mecánico
('Ana', 'Martínez', 3), -- El ID del cargo correspondiente al Recepcionista
('Luis', 'Sánchez', 3); -- El ID del cargo correspondiente al Recepcionista

INSERT INTO proveedor (proveedor, email) VALUES 
('Proveedor A', 'proveedora@example.com'),
('Proveedor B', 'proveedorb@example.com'),
('Proveedor C', 'proveedorc@example.com'),
('Proveedor D', 'proveedord@example.com'),
('Proveedor E', 'proveedore@example.com');

INSERT INTO orden_compra (total, empleado_id, proveedor_id) VALUES 
(500000, 1, 1), -- Empleado con ID 1 (Juan Pérez, Gerente) y Proveedor con ID 1 (Proveedor A)
(800000, 1, 2), -- Empleado con ID 2 (María López, Mecánico) y Proveedor con ID 2 (Proveedor B)
(650000, 1, 3), -- Empleado con ID 3 (Pedro González, Mecánico) y Proveedor con ID 3 (Proveedor C)
(900000, 4, 4), -- Empleado con ID 4 (Ana Martínez, Recepcionista) y Proveedor con ID 4 (Proveedor D)
(750000, 5, 5), -- Empleado con ID 5 (Luis Sánchez, Recepcionista) y Proveedor con ID 5 (Proveedor E)
(550000, 1, 2), -- Empleado con ID 1 (Juan Pérez, Gerente) y Proveedor con ID 2 (Proveedor B)
(700000, 4, 3), -- Empleado con ID 2 (María López, Mecánico) y Proveedor con ID 3 (Proveedor C)
(850000, 4, 4), -- Empleado con ID 3 (Pedro González, Mecánico) y Proveedor con ID 4 (Proveedor D)
(950000, 4, 5), -- Empleado con ID 4 (Ana Martínez, Recepcionista) y Proveedor con ID 5 (Proveedor E)
(600000, 5, 1); -- Empleado con ID 5 (Luis Sánchez, Recepcionista) y Proveedor con ID 1 (Proveedor A)


INSERT INTO repuesto (repuesto, descripcion, precio, proveedor_id) VALUES 
('Batería', 'Batería de 12V para automóviles', 250000, 1), -- Proveedor con ID 1 (Proveedor A)
('Filtro de Aceite', 'Filtro de aceite para vehículos', 50000, 2), -- Proveedor con ID 2 (Proveedor B)
('Pastillas de Freno', 'Pastillas de freno delanteras', 150000, 3), -- Proveedor con ID 3 (Proveedor C)
('Llantas', 'Juego de llantas para automóviles', 800000, 4), -- Proveedor con ID 4 (Proveedor D)
('Espejos Laterales', 'Espejos laterales para vehículos', 120000, 5); -- Proveedor con ID 5 (Proveedor E)

INSERT INTO orden_detalle (cantidad, precio, empleado_id, proveedor_id, repuesto_id) VALUES 
(2, 50000, 1, 2, 2), -- 2 unidades del Filtro de Aceite del Proveedor B, comprados por el Empleado Juan Pérez
(4, 150000, 2, 3, 3), -- 4 unidades de Pastillas de Freno del Proveedor C, comprados por el Empleado María López
(1, 800000, 3, 4, 4), -- 1 juego de Llantas del Proveedor D, comprado por el Empleado Pedro González
(3, 120000, 4, 5, 5), -- 3 unidades de Espejos Laterales del Proveedor E, comprados por el Empleado Ana Martínez
(5, 250000, 5, 1, 1), -- 5 unidades de Batería del Proveedor A, comprados por el Empleado Luis Sánchez
(3, 50000, 1, 2, 2), -- 3 unidades del Filtro de Aceite del Proveedor B, comprados por el Empleado Juan Pérez
(2, 150000, 2, 3, 3), -- 2 unidades de Pastillas de Freno del Proveedor C, comprados por el Empleado María López
(4, 800000, 3, 4, 4), -- 4 juegos de Llantas del Proveedor D, comprados por el Empleado Pedro González
(1, 120000, 4, 5, 5), -- 1 unidad de Espejos Laterales del Proveedor E, comprado por el Empleado Ana Martínez
(6, 250000, 5, 1, 1); -- 6 unidades de Batería del Proveedor A, comprados por el Empleado Luis Sánchez


INSERT INTO contacto (nombre, telefono, correo, proveedor_id) VALUES 
('Juan Pérez', '+573001234567', 'juanperez@example.com', 1), -- Proveedor con ID 1 (Proveedor A)
('María López', '+573001234568', 'marialopez@example.com', 2), -- Proveedor con ID 2 (Proveedor B)
('Pedro González', '+573001234569', 'pedrogonzalez@example.com', 3), -- Proveedor con ID 3 (Proveedor C)
('Ana Martínez', '+573001234570', 'anamartinez@example.com', 4), -- Proveedor con ID 4 (Proveedor D)
('Luis Sánchez', '+573001234571', 'luissanchez@example.com', 5); -- Proveedor con ID 5 (Proveedor E)

INSERT INTO servicio (servicio, descripcion, costo) VALUES 
('Cambio de Aceite', 'Cambiar el aceite del motor y reemplazar el filtro de aceite', 50000),
('Alineación y Balanceo', 'Ajuste de la alineación y balanceo de las llantas', 80000),
('Revisión de Frenos', 'Revisión y ajuste de los frenos delanteros y traseros', 100000),
('Cambio de Batería', 'Reemplazar la batería del vehículo por una nueva', 150000),
('Lavado y Encerado', 'Lavado exterior e interior del vehículo y encerado de la carrocería', 60000);

INSERT INTO cliente (nombre, apellido, direccion, email) VALUES 
('Juan', 'García', 'Calle 123', 'juan@example.com'),
('María', 'López', 'Avenida 456', 'maria@example.com'),
('Pedro', 'Martínez', 'Carrera 789', 'pedro@example.com'),
('Ana', 'Sánchez', 'Calle 456', 'ana@example.com'),
('Luis', 'González', 'Avenida 789', 'luis@example.com'),
('Laura', 'Pérez', 'Carrera 123', 'laura@example.com'),
('Carlos', 'Rodríguez', 'Calle 789', 'carlos@example.com'),
('Sofía', 'Hernández', 'Avenida 123', 'sofia@example.com'),
('Daniel', 'Díaz', 'Carrera 456', 'daniel@example.com'),
('Lucía', 'Gómez', 'Calle 789', 'lucia@example.com');

INSERT INTO factura (fecha, total, cliente_id) VALUES 
('2020-06-01', 120000, 1), -- Cliente con ID 1 (Juan García)
('2021-06-02', 150000, 2), -- Cliente con ID 2 (María López)
('2019-06-03', 180000, 3), -- Cliente con ID 3 (Pedro Martínez)
('2020-06-04', 200000, 4), -- Cliente con ID 4 (Ana Sánchez)
('2023-06-05', 220000, 5); -- Cliente con ID 5 (Luis González)

INSERT INTO vehiculo (placa, marca, modelo, kilometraje, año_registro_vehiculo, cliente_id) VALUES 
('ABC123', 'Toyota', 'Corolla', 50000.0, 2019, 1), -- Cliente con ID 1 (Juan García)
('DEF456', 'Honda', 'Civic', 70000.0, 2020, 2), -- Cliente con ID 2 (María López)
('GHI789', 'Ford', 'Fiesta', 60000.0, 2018, 3), -- Cliente con ID 3 (Pedro Martínez)
('JKL012', 'Chevrolet', 'Spark', 80000.0, 2017, 4), -- Cliente con ID 4 (Ana Sánchez)
('MNO345', 'Hyundai', 'Accent', 90000.0, 2016, 5), -- Cliente con ID 5 (Luis González)
('PQR678', 'Volkswagen', 'Polo', 55000.0, 2019, 6), -- Cliente con ID 6 (Laura Pérez)
('STU901', 'Nissan', 'Versa', 72000.0, 2020, 7), -- Cliente con ID 7 (Carlos Rodríguez)
('VWX234', 'Renault', 'Clio', 61000.0, 2018, 8), -- Cliente con ID 8 (Sofía Hernández)
('YZA567', 'Mazda', '2', 78000.0, 2017, 9), -- Cliente con ID 9 (Daniel Díaz)
('BCD890', 'Kia', 'Rio', 92000.0, 2016, 10); -- Cliente con ID 10 (Lucía Gómez)

INSERT INTO reparacion (fecha, horas, costo_total, descripcion, vehiculo_id, empleado_id, servicio_id) VALUES 
('2020-06-01', 4, 200000, 'Reparación del motor', 1, 1, 1), -- Vehículo con ID 1 (Placa: ABC123), Empleado con ID 1 (Juan Pérez), Servicio con ID 1 (Cambio de Aceite)
('2019-06-02', 5, 250000, 'Reparación de frenos', 2, 2, 3), -- Vehículo con ID 2 (Placa: DEF456), Empleado con ID 2 (María López), Servicio con ID 3 (Revisión de Frenos)
('2021-06-03', 3, 150000, 'Reemplazo de batería', 3, 3, 4), -- Vehículo con ID 3 (Placa: GHI789), Empleado con ID 3 (Pedro González), Servicio con ID 4 (Cambio de Batería)
('2024-06-04', 6, 300000, 'Alineación y balanceo', 4, 4, 2), -- Vehículo con ID 4 (Placa: JKL012), Empleado con ID 4 (Ana Martínez), Servicio con ID 2 (Alineación y Balanceo)
('2023-06-05', 4, 200000, 'Reparación de la transmisión', 5, 5, 5), -- Vehículo con ID 5 (Placa: MNO345), Empleado con ID 5 (Luis Sánchez), Servicio con ID 5 (Lavado y Encerado)
('2022-06-06', 3, 150000, 'Cambio de aceite', 6, 1, 1), -- Vehículo con ID 6 (Placa: PQR678), Empleado con ID 1 (Juan Pérez), Servicio con ID 1 (Cambio de Aceite)
('2020-06-07', 4, 200000, 'Reparación del sistema eléctrico', 7, 2, 3), -- Vehículo con ID 7 (Placa: STU901), Empleado con ID 2 (María López), Servicio con ID 3 (Revisión de Frenos)
('2024-06-08', 5, 250000, 'Reparación de la suspensión', 8, 3, 4); -- Vehículo con ID 8 (Placa: VWX234), Empleado con ID 3 (Pedro González), Servicio con ID 4 (Cambio de Batería)


INSERT INTO cita (date, cliente_id, servicio_id, vehiculo_id) VALUES 
('2024-06-01 09:00:00', 1, 1, 1), -- Cliente con ID 1 (Juan García), Servicio con ID 1 (Cambio de Aceite), Vehículo con ID 1 (Placa: ABC123)
('2024-02-02 10:00:00', 2, 3, 2), -- Cliente con ID 2 (María López), Servicio con ID 3 (Revisión de Frenos), Vehículo con ID 2 (Placa: DEF456)
('2024-01-03 11:00:00', 3, 4, 3), -- Cliente con ID 3 (Pedro Martínez), Servicio con ID 4 (Cambio de Batería), Vehículo con ID 3 (Placa: GHI789)
('2023-06-04 12:00:00', 4, 2, 4), -- Cliente con ID 4 (Ana Sánchez), Servicio con ID 2 (Alineación y Balanceo), Vehículo con ID 4 (Placa: JKL012)
('2022-06-05 13:00:00', 5, 5, 5); -- Cliente con ID 5 (Luis González), Servicio con ID 5 (Lavado y Encerado), Vehículo con ID 5 (Placa: MNO345)

INSERT INTO factura_detalle (reparacion_id, factura_id, cantidad, precio) VALUES 
(1, 1, 1, 200000), -- Reparación con ID 1 asociada a la factura con ID 1 (Juan García)
(2, 2, 1, 250000), -- Reparación con ID 2 asociada a la factura con ID 2 (María López)
(3, 3, 1, 150000), -- Reparación con ID 3 asociada a la factura con ID 3 (Pedro Martínez)
(4, 4, 1, 300000), -- Reparación con ID 4 asociada a la factura con ID 4 (Ana Sánchez)
(5, 5, 1, 200000); -- Reparación con ID 5 asociada a la factura con ID 5 (Luis González)


INSERT INTO ubicacion (zona, descripcion) VALUES 
('Zona 1', 'Descripción de la zona 1'),
('Zona 2', 'Descripción de la zona 2'),
('Zona 3', 'Descripción de la zona 3'),
('Zona 4', 'Descripción de la zona 4'),
('Zona 5', 'Descripción de la zona 5'),
('Zona 6', 'Descripción de la zona 6');

INSERT INTO inventario (cantidad, repuesto_id, ubicacion_id, stock_inicial) VALUES 
(10, 1, 1,5), -- 10 unidades del repuesto con ID 1 en la ubicación con ID 1
(20, 2, 2,300), -- 20 unidades del repuesto con ID 2 en la ubicación con ID 2
(15, 3, 3,10), -- 15 unidades del repuesto con ID 3 en la ubicación con ID 3
(25, 4, 4,100), -- 25 unidades del repuesto con ID 4 en la ubicación con ID 4
(30, 5, 5, 23); -- 30 unidades del repuesto con ID 5 en la ubicación con ID 5

INSERT INTO empresa (empresa, ciudad, direccion, contacto) VALUES 
('tallerING S.A.', 'Bucaramanga', 'Calle Ejemplo #123', 'Hader Cabrera');

-- MODIFIQUE LA TABLA TELEFONO (QUITE PRIMARY COMPUESTA)
INSERT INTO telefono (cliente_id, empleado_id, telefono) VALUES 
(1, NULL, '+1234567890'), -- Teléfono del cliente con ID 1 (Juan García), sin empleado asociado
(NULL, 1, '+0987654321'), -- Teléfono del empleado con ID 1 (Juan Pérez), sin cliente asociado
(2, NULL, '+2345678901'), -- Teléfono del cliente con ID 2 (María López), sin empleado asociado
(NULL, 2, '+9876543210'), -- Teléfono del empleado con ID 2 (María López), sin cliente asociado
(3, NULL, '+3456789012'); -- Teléfono del cliente con ID 3 (Pedro Martínez), sin empleado asociado

INSERT INTO pieza_reparacion (repuesto_id, reparacion_id, cantidad) VALUES 
(1, 1, 2), -- Repuesto con ID 1 en la reparación con ID 1, cantidad: 2
(2, 1, 3), -- Repuesto con ID 2 en la reparación con ID 1, cantidad: 3
(3, 2, 1), -- Repuesto con ID 3 en la reparación con ID 2, cantidad: 1
(4, 2, 2), -- Repuesto con ID 4 en la reparación con ID 2, cantidad: 2
(5, 3, 2), -- Repuesto con ID 5 en la reparación con ID 3, cantidad: 2
(1, 4, 3), -- Repuesto con ID 1 en la reparación con ID 4, cantidad: 3
(2, 4, 2), -- Repuesto con ID 2 en la reparación con ID 4, cantidad: 2
(3, 5, 1), -- Repuesto con ID 3 en la reparación con ID 5, cantidad: 1
(4, 5, 2), -- Repuesto con ID 4 en la reparación con ID 5, cantidad: 2
(5, 6, 2); -- Repuesto con ID 5 en la reparación con ID 6, cantidad: 2
