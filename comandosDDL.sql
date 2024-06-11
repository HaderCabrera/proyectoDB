CREATE DATABASE taller;
use taller;

CREATE TABLE IF NOT EXISTS cargo (
	id_cargo INT AUTO_INCREMENT,
	cargo VARCHAR(45) NOT NULL,
	CONSTRAINT PK_id_cargo PRIMARY KEY(id_cargo)
);

CREATE TABLE IF NOT EXISTS empleado (
	id_empleado INT AUTO_INCREMENT,
	nombre VARCHAR(45) NOT NULL,
	apellido VARCHAR(45) NOT NULL,
	cargo_id INT,
	CONSTRAINT PK_id_empleado PRIMARY KEY(id_empleado),
	CONSTRAINT FK_cargo_id FOREIGN KEY(cargo_id) REFERENCES cargo(id_cargo)	
);

CREATE TABLE IF NOT EXISTS proveedor (
	id_proveedor INT AUTO_INCREMENT,
	proveedor VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	CONSTRAINT PK_id_proveedor PRIMARY KEY(id_proveedor)
);

CREATE TABLE IF NOT EXISTS orden_compra (
	id_orden INT AUTO_INCREMENT,
	total DECIMAL(10,2) NOT NULL,
	empleado_id INT NOT NULL,
	proveedor_id INT NOT NULL,
	CONSTRAINT PK_id_orden PRIMARY KEY(id_orden),
	CONSTRAINT FK_empleado_id FOREIGN KEY(empleado_id) REFERENCES empleado(id_empleado),
	CONSTRAINT FK_proveedor_id FOREIGN KEY(proveedor_id) REFERENCES proveedor(id_proveedor)
);


CREATE TABLE IF NOT EXISTS repuesto (
	id_repuesto INT AUTO_INCREMENT,
	repuesto VARCHAR(45) NOT NULL,
	descripcion VARCHAR(255),
	precio DECIMAL(10,2) NOT NULL,
	proveedor_id INT,
	CONSTRAINT PK_id_repuesto PRIMARY KEY(id_repuesto),
	CONSTRAINT FK_proveedor_repuesto FOREIGN KEY(proveedor_id) REFERENCES proveedor(id_proveedor)
);

CREATE TABLE IF NOT EXISTS orden_detalle (
	id_orden INT AUTO_INCREMENT,
	cantidad TINYINT(1),
	precio DECIMAL(10,2) NOT NULL,
	empleado_id INT NOT NULL,
	proveedor_id INT NOT NULL,
	repuesto_id INT NOT NULL,
	CONSTRAINT PK_id_orden PRIMARY KEY(id_orden),
	CONSTRAINT FK_empleado_orden_detalle FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado),
	CONSTRAINT FK_proveedor_orden_detalle FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor),
	CONSTRAINT FK_repuesto_orden_detalle FOREIGN KEY (repuesto_id) REFERENCES repuesto(id_repuesto)
);

CREATE TABLE IF NOT EXISTS contacto (
	id_contacto INT AUTO_INCREMENT,
	nombre VARCHAR(45) NOT NULL,
	telefono VARCHAR(13) NOT NULL,
	correo VARCHAR(100),
	proveedor_id INT,
	CONSTRAINT PK_id_contacto PRIMARY KEY(id_contacto),
	CONSTRAINT FK_contacxto_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor)
);

CREATE TABLE IF NOT EXISTS servicio (
	id_servicio INT AUTO_INCREMENT,
	servicio VARCHAR(45) NOT NULL,
	descripcion TEXT,
	costo DECIMAL(10,2),
	CONSTRAINT PK_id_servicio PRIMARY KEY(id_servicio)
);

CREATE TABLE IF NOT EXISTS cliente (
	id_cliente INT AUTO_INCREMENT,
	nombre VARCHAR(45) NOT NULL,
	apellido VARCHAR(45),
	direccion VARCHAR(45),
	email VARCHAR(100),
	CONSTRAINT PRIMARY KEY(id_cliente)
);

CREATE TABLE IF NOT EXISTS factura(
	id_factura INT AUTO_INCREMENT,
	fecha DATE NOT NULL,
	total DECIMAL(10,2) NOT NULL,
	cliente_id INT,
	CONSTRAINT PK_id_factura PRIMARY KEY(id_factura),
	CONSTRAINT FK_cliente_factura FOREIGN KEY(cliente_id) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS vehiculo(
	id_vehiculo INT AUTO_INCREMENT,
	placa VARCHAR(6) NOT NULL,
	marca VARCHAR(45),
	modelo VARCHAR(45),
	kilometraje DOUBLE NOT NULL,
	año_registro_vehiculo INT,
	cliente_id INT NOT NULL,
	CONSTRAINT PK_id_vehiculo PRIMARY KEY(id_vehiculo),
	CONSTRAINT FK_cliente_vehiculo FOREIGN KEY(cliente_id) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS reparacion (
	id_reparacion INT AUTO_INCREMENT,
	fecha DATE NOT NULL,
	horas TINYINT(3) NOT NULL,
	costo_total DECIMAL(10,2),
	descripcion TEXT,
	vehiculo_id INT NOT NULL,
	empleado_id INT NOT NULL,
	servicio_id INT NOT NULL,
	CONSTRAINT PK_id_reparacion PRIMARY KEY(id_reparacion),
	CONSTRAINT FK_vehiculo_reparacion FOREIGN KEY(vehiculo_id) REFERENCES vehiculo(id_vehiculo),
	CONSTRAINT FK_empleado_reparacion FOREIGN KEY(empleado_id) REFERENCES empleado(id_empleado),
	CONSTRAINT FK_servicio_reparacion FOREIGN KEY(servicio_id) REFERENCES servicio(id_servicio)
);

CREATE TABLE IF NOT EXISTS cita (
	id_cita INT AUTO_INCREMENT,
	date DATETIME NOT NULL,
	cliente_id INT NOT NULL,
	servicio_id INT NOT NULL,
	vehiculo_id INT NOT NULL,
	CONSTRAINT PK_id_cita PRIMARY KEY(id_cita),
	CONSTRAINT FK_cliente_cita FOREIGN KEY(cliente_id) REFERENCES cliente(id_cliente),
	CONSTRAINT FK_servicio_cita FOREIGN KEY(servicio_id) REFERENCES servicio(id_servicio),
	CONSTRAINT FK_vehiculo_cita FOREIGN KEY(vehiculo_id) REFERENCES vehiculo(id_vehiculo)
);

CREATE TABLE IF NOT EXISTS factura_detalle(
	reparacion_id INT NOT NULL,
	factura_id INT NOT NULL,
	cantidad TINYINT(3),
	precio DECIMAL(10,2) NOT NULL,
	CONSTRAINT FK_reparacion_dt_factura FOREIGN KEY(reparacion_id) REFERENCES reparacion(id_reparacion),
	CONSTRAINT FK_factura_dt_factura FOREIGN KEY(factura_id) REFERENCES factura(id_factura),
	CONSTRAINT PK_dt_factura PRIMARY KEY(reparacion_id, factura_id)
);

CREATE TABLE IF NOT EXISTS ubicacion(
	id_ubicacion INT AUTO_INCREMENT,
	zona VARCHAR(45) NOT NULL,
	descripcion TEXT,
	CONSTRAINT PK_id_ubicacion PRIMARY KEY(id_ubicacion)
);

CREATE TABLE IF NOT EXISTS inventario(
	id_inventario INT AUTO_INCREMENT,
	cantidad TINYINT(3) NOT NULL,
	repuesto_id INT NOT NULL,
	ubicacion_id INT NOT NULL,
	stock_inicial INT NOT NULL,
	CONSTRAINT PK_id_inventario PRIMARY KEY(id_inventario),
	CONSTRAINT FK_repuesto_inventario FOREIGN KEY (repuesto_id) REFERENCES repuesto(id_repuesto),
	CONSTRAINT FK_ubicacion_inventario FOREIGN KEY(ubicacion_id) REFERENCES ubicacion(id_ubicacion)
);

CREATE TABLE empresa(
	empresa VARCHAR(45),
	ciudad VARCHAR(45) NOT NULL,
	direccion VARCHAR(255) NOT NULL,
	contacto VARCHAR(45) NOT NULL,
	CONSTRAINT PK_empresa PRIMARY KEY(empresa)
);
-- MODIFICADA...
CREATE TABLE IF NOT EXISTS telefono (
    id_telefono INT AUTO_INCREMENT,
	cliente_id INT,
	empleado_id INT,
	telefono VARCHAR(45) NOT NULL,
    CONSTRAINT PK_telefono PRIMARY KEY(id_telefono),
	CONSTRAINT FK_cliente_telefono FOREIGN KEY(cliente_id) REFERENCES cliente(id_cliente),
	CONSTRAINT FK_empleado_telefono FOREIGN KEY(empleado_id) REFERENCES empleado(id_empleado)
);


CREATE TABLE IF NOT EXISTS pieza_reparacion (
	repuesto_id INT NOT NULL,
	reparacion_id INT NOT NULL,
	cantidad TINYINT(3) NOT NULL,
	CONSTRAINT FK_repuesto_pieza FOREIGN KEY (repuesto_id) REFERENCES repuesto(id_repuesto),
	CONSTRAINT FK_reparacion_pieza FOREIGN KEY (reparacion_id) REFERENCES reparacion(id_reparacion),
	CONSTRAINT PK_repuesto_reparacion PRIMARY KEY(repuesto_id, reparacion_id)
);

