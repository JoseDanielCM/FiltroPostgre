-- CREAR BASE DE DATOS 
--   Concesionario

create table proveedores (
	id serial primary key,
	nombre varchar(100) not null
);

create table piezas(
	id serial primary key,
	nombre varchar(100) not null,
	cantidad integer check (cantidad >=0)
);

create table piezasXproveedores	(
	id_proveedor integer,
	id_pieza integer,
	cantidad integer check (cantidad >=0),
	foreign key (id_proveedor) references proveedores(id),
	foreign key (id_pieza) references piezas(id)
);

create type roles as enum  ('venta','servicio');

create table empleados (
	id serial primary key,
	nombre varchar(100) not null,
	apellido varchar(100),
	rol roles not null,
	fecha_contratacion date not null,
	hora_entrada time not null,
	hora_salida time not null
);

create table clientes (
	id serial primary key,
	nombre varchar(100) not null,
	apellido varchar(100),
	edad integer check (edad >= 18) not null,
	ha_comprado boolean not null,
	interes_compra boolean not null
);

create type estado as enum  ('nuevo','usado');
create type tipo as enum  ('venta','servicio');

create table vehiculos (
	id serial primary key,
	marca varchar(50),
	modelo varchar(70),
	year integer check (year >= 0),
	precio numeric check (precio >= 0),
	estado estado,
	tipo tipo,
	vendido boolean default false,	
	activo boolean default null
);

create table interes (
	id_vehiculo integer,
	id_cliente integer,
	fecha timestamp,
	foreign key (id_vehiculo) references vehiculos(id),
	foreign key (id_cliente) references clientes(id)
);

create table servicios (
	id serial primary key,
	fecha_inicio timestamp,
	fecha_finalizacion timestamp,
	id_vehiculo integer,
	id_cliente integer,
	foreign key (id_vehiculo) references vehiculos(id),
	foreign key (id_cliente) references clientes(id)
);

create table piezasXservicio (
	id_servicio integer,
	id_pieza integer,
	foreign key (id_servicio) references servicios(id),
	foreign key (id_pieza) references piezas(id)
);

create table empleadosXservicio (
	id_empleado integer,
	id_servicio integer,
	fecha timestamp,
	foreign key (id_empleado) references empleados(id),
	foreign key (id_servicio) references servicios(id)
);

create table ventas (
	id_empleado integer,
	id_vehiculo integer,
	id_cliente integer,
	fecha timestamp,
	foreign key (id_empleado) references empleados(id),
	foreign key (id_cliente) references clientes(id),
	foreign key (id_vehiculo) references vehiculos(id)
);


