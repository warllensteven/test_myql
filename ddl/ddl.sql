-- creacionde la base de datos
create database sakilacampus;
use sakilacampus;

-- creacion tabla pelicula
create table pelicula(
id_pelicula int primary key,
titulo varchar(255),
descripcion text,
anyio_lanzamiento int,
id_idioma int,
id_idioma_original varchar(20),
duracion_alquiler int,
rental_rate decimal(4,2),
duracion int,
replacement_cost decimal(5,2),
clasificacion enum('G','PG','PG-13','R','NC-17'),
caracteristicas_especiales varchar(255),
ultima_actualizacion datetime,
foreign key (id_idioma) references idioma(id_idioma)
);

-- creacion tabla idioma
create table idioma(
	id_idioma int primary key,
	nombre varchar(20),
	ultima_actualizacion datetime
);

-- creacion tabla actor
create table actor(
id_actor int primary key,
nombre varchar(45),
apellidos varchar(45),
ultima_actualizacion datetime
);

-- creacion tabla pelicula_actor

create table pelicula_actor(
id_actor int,
id_pelicula int,
ultima_actualizacion datetime,
primary key(id_actor,id_pelicula),
foreign key (id_actor) references actor(id_actor),
foreign key (id_actor) references actor(id_actor)
);

-- creacion tabla categoria
create table categoria(
id_categoria int primary key,
nombre varchar(50),
ultima_actualizacion datetime
);

-- creacion tabla pelicula_categoria
create table pelicula_categoria(
id_pelicula int,
id_categoria int,
ultima_actualizacion datetime,
primary key(id_pelicula,id_categoria),
foreign key(id_pelicula) references pelicula(id_pelicula),
foreign key(id_categoria) references categoria(id_categoria)
);

-- creacion pais
create table pais(
id_pais int primary key,
nombre varchar(50),
ultima_actualizacion datetime
);

-- creacion tabla ciudad
create table ciudad(
id_ciudad int primary key,
nombre varchar(50),
id_pais int,
ultima_actualizacion datetime,
foreign key (id_pais) references pais(id_pais)
);

-- creacion tabla direccion
create table direccion(
id_direccion int primary key,
direccion varchar(50),
direccion2 varchar(50),
distrito varchar(50),
id_ciudad int,
codigo_postal varchar(50),
telefono varchar(20),
ultima_actualizacion datetime,
foreign key (id_ciudad) references ciudad(id_ciudad)
);

-- almacen
create table almacen(
id_almacen int primary key,
id_empleado_jefe int,
id_direccion int,
ultima_actualizacion datetime,
foreign key (id_direccion) references direccion(id_direccion)
);


-- empleado 
create table empleado(
id_empleado int primary key,
nombre varchar(50),
apellidos varchar(50),
id_direccion int,
imagen blob,
email varchar(50),
id_almacen int,
activo int,
username varchar(50),
password varchar(50),
ultima_actualizacion datetime,
foreign key (id_almacen) references almacen(id_almacen)
);

-- inventario
create table inventario(
id_inventario int primary key,
id_pelicula int,
id_almacen int,
ultima_actualizacion datetime,
foreign key (id_pelicula) references pelicula(id_pelicula),
foreign key (id_almacen) references almacen(id_almacen)
);

-- cliente
create table cliente(
id_cliente int primary key,
id_almacen int, 
nombre varchar(50),
apellidos varchar(50),
email varchar(50),
id_direccion int,
activo int,
fecha_creacion datetime,
ultima_actualizacion datetime,
foreign key (id_almacen) references almacen(id_almacen),
foreign key (id_direccion) references direccion(id_direccion)
);

-- alquiler
create table alquiler(
id_alquiler int primary key,
fecha_alquiler datetime,
id_inventario int,
id_cliente int,
fecha_devolucion datetime,
id_empleado int,
ultima_actualizacion datetime,
foreign key (id_inventario) references inventario(id_inventario),
foreign key (id_cliente) references cliente(id_cliente),
foreign key (id_empleado) references empleado(id_empleado)
);

-- pago 
create table pago(
id_pago int primary key,
id_cliente int,
id_empleado int,
id_alquiler int,
total decimal(5,2),
fecha_pago datetime,
ultima_actualizacion datetime,
foreign key (id_alquiler) references alquiler(id_alquiler),
foreign key (id_cliente) references cliente(id_cliente),
foreign key (id_empleado) references empleado(id_empleado)
);



