-- borra la bd si existe
DROP DATABASE IF EXISTS Pelicula;
-- creamos la bd
CREATE DATABASE Pelicula;
-- activamos la bd
USE Pelicula;

create table Tipo_User(
	cod_tipo char(2) not null,
    desc_tipo varchar(40) not null,
    primary key(cod_tipo)
);

create table Usuario(
	usuario char(15) not null,
    nombre varchar(40) not null,
    telefono char(9) null,
    direccion char(100) null,
    tipo_usuario char(2) null,
    password varchar(50) not null,
    primary key(usuario),
    foreign key (tipo_usuario) references Tipo_User(cod_tipo)
);

create table Tipo_peli(
	cod_tipo int not null AUTO_INCREMENT,
    desc_tipo varchar(40) not null,
    primary key(cod_tipo)
);

create table Tipo_Proove(
	id int not null AUTO_INCREMENT,
    descrip varchar(50) not null,
    primary key(id)
);

create table proveedor(
	id int not null AUTO_INCREMENT,
    nombre varchar(50) not null,
    telf char(9) not null,
    direc varchar(50),
    Tipo_Provee int not null,
    primary key(id),
    foreign key(Tipo_Provee) references Tipo_Proove(id) 
);

create table Peliculas(
	cod_peli char(5) not null,
    nombre varchar(100) not null,
    tipo_peli int not null,
    fecha_Estreno date not null,
    fecha_final date null,
    id_proveedor int not null,
    primary key (cod_peli),
	foreign key (tipo_peli) references Tipo_peli(cod_tipo),
    foreign key (id_proveedor) references proveedor(id)
);

create table seccion_Cine(
	cod_Sec char(5) not null,
    disp_asient int not null,
    asientos int not null,
	estado boolean not null,
    primary key(cod_Sec)
);

create table Comustibles(
	cod_Com char(5) not null,
    descrip varchar(50) not null,
    precio float not null,
    stock_Actual int not null,
	id_proveedor int not null,
    primary key (cod_Com),
    foreign key (id_proveedor) references proveedor(id)
);

create table Tipo_Boleta(
	id int not null AUTO_INCREMENT,
    descrip varchar(50) not null,
    primary key (id)
);

create table Header_Boleta(
	cod_bol char(5) not null,
    cod_user char(15) not null,
    fecha_bol date not null,
    prec_total float not null,
    Tipo_Boleta int not null,
    primary key (cod_bol),
    foreign key (cod_user) references Usuario(usuario),
	foreign key (Tipo_Boleta) references Tipo_Boleta(id)
);

create table body_Boleta_Pelicula(
	cod_body char(5) not null,
	cod_bol char(5) not null,
    cod_peli char(5) null,
    cod_Com char(5) null,
    cantidad int not null,
	cod_Sec char(5) null,
    total float not null,
    primary key(cod_body),
    foreign key (cod_bol) references Header_Boleta(cod_bol),
    foreign key (cod_peli) references Peliculas(cod_peli),
    foreign key (cod_Com) references Comustibles(cod_Com),
	foreign key (cod_Sec) references seccion_Cine(cod_Sec)
);



