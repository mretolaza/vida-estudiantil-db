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