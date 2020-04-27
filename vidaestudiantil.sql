drop table if exists persona cascade;
create table persona(
	id serial primary key,
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

drop table if exists tipo cascade;
create table tipo(
	id_tipo serial primary key,
	tipo varchar(30) not null
);


drop table if exists taller cascade;
create table taller(
	id_taller serial  primary key,
	nombre varchar(50) not null,
	salon varchar(10),
	fecha DATE not null,
	descripcion varchar(100) not null
);

drop table if exists equipo cascade;
create table equipo(
	id_equipo serial primary key,
	nombre varchar(50) not null,
	deporte varchar(50) not null
);

drop table if exists es cascade;
create table es (
	id_es serial primary key,
	id_tipo int references tipo(id_tipo),
	id_persona int references persona(id)
);

drop table if exists participacion_taller cascade;
create table participacion_taller (
	id_part_taller serial primary key,
	id_persona int references persona(id),
	id_taller int references taller(id_taller),
	semestre varchar(30) not null 
);

drop table if exists torneo cascade;
create table torneo (
	id_torneo serial primary key,
	id_persona int references persona(id),
	id_equipo int references equipo(id_equipo),
	semestre varchar(30) not null
);


drop table if exists asociacion_club cascade;
create table asociacion_club(
	id_ca serial primary key,
	nombre varchar(50) not null,
	tipo varchar(30) not null,
	descripcion varchar (100) not null
);

drop table if exists miembro cascade;
create table miembro(
	id_relacion serial primary key,
	id_persona int references persona(id),
	id_ca int references asociacion_club(id_ca),
	anio int not null
);