drop table if exists persona cascade;
create table persona(
	id serial primary key,
	horas_beca INT,
	carrera varchar(100),
	carne INT,
	genero varchar(30),
	facultad varchar(100),
	email varchar(30) REFERENCES users(email)
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

drop table if exists evento_ca cascade;
create table evento_ca(
	id_evento_ca serial primary key,
	nombre varchar(50) not null,
	salon varchar(10),
	fecha DATE not null,
	descripcion varchar (100) not null,
	ingresos float,
	egresos float	
);

drop table if exists realizacion cascade;
create table realizacion (
	id_realizacion serial primary key,
	id_ca int references asociacion_club(id_ca),
	id_evento_ca int references evento_ca(id_evento_ca)
);

drop table if exists participacion_evento cascade;
create table participacion_evento (
	id_part_evento serial primary key,
	id_evento int references evento_ca(id_evento_ca),
	id_persona int references persona(id)
);

drop table if exists evento cascade;
create table evento(
	id_evento serial primary key,
	nombre varchar(50) not null,
	salon varchar(10),
	fecha DATE not null,
	descripcion varchar (100) not null
);

drop table if exists permiso cascade;
create table permiso(
	id_permiso serial primary key,
	nombre varchar(50) not null	
);

drop table if exists part_horas_beca cascade;
create table part_horas_beca (
	id_part_horas_beca serial primary key,
	id_persona int references persona(id),
	id_evento int references evento(id_evento),
	horas_realizadas float not null
);

drop table if exists sesion cascade;
create table sesion (
	id_sesion serial primary key,
	id_persona int references persona(id),
	id_ca int references asociacion_club(id_ca),
	fecha date not null
);

drop table if exists roles cascade;
create table roles (
	id_roles serial primary key,
	id_permiso int references permiso(id_permiso),
	id_persona int references persona(id)
);

drop table if exists skill cascade;
create table skill (
	id_skill serial primary key,
	skill VARCHAR(30)
);

drop table if exists posee cascade;
create table posee (
	id_posee serial primary key,
	id_persona int references persona(id),
	id_skill int references skill(id_skill)
);