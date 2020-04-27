drop table if exists persona;
create table persona(
	id INT primary key,
	contrasena varchar(30) not null,
	horas_beca INT,
	carrera varchar(100),
	correo varchar(100),
	carne INT,
	genero varchar(30) not null,
	nombre varchar(100) not null,
	facultad varchar(100),
	apellido varchar(50)
);

drop table if exists tipo;
create table tipo(
	id_tipo INT primary key,
	tipo varchar(30) not null
);


drop table if exists taller;
create table taller(
	id_taller INT primary key,
	nombre varchar(50) not null,
	salon varchar(10),
	fecha DATE not null,
	descripcion varchar(100) not null
);

drop table if exists equipo;
create table equipo(
	id_equipo INT primary key,
	nombre varchar(50) not null,
	deporte varchar(50) not null
);

drop table if exists es;
create table es (
	id_es int primary key,
	id_tipo int references tipo(id_tipo),
	id_persona int references persona(id)
);

drop table if exists participacion_taller;
create table participacion_taller (
	id_part_taller int primary key,
	id_persona int references persona(id),
	id_taller int references taller(id_taller),
	semestre varchar(30) not null 
);

drop table if exists torneo;
create table torneo (
	id_torneo int primary key,
	id_persona int references persona(id),
	id_equipo int references equipo(id_equipo),
	semestre varchar(30) not null
);