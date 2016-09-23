use master;

create database ejemplo;
use ejemplo;


create table ciudades
(
cod_ciudad int not null constraint pk_cod_ciudad primary key,
nom_ciudad varchar(50)not null,
)
go

create table usuario
(
rut char(12) not null constraint pk_rut primary key,
nombre varchar(50)not null,
telefono varchar(10)not null,
ciudad int not null constraint fk_ciudades references ciudades(cod_ciudad),
)
go

select * from usuario;
select * from ciudades;
                         
          

insert into ciudades values(01,'Seleccione');
insert into ciudades values(02,'Temuco');
insert into ciudades values(03,'Valdivia');
insert into ciudades values(04,'Santiago');
insert into ciudades values(05,'La serena');
insert into ciudades values(06,'Antofagasta');


insert into  usuario values(22767921-2,'cristian Cordoba','3366985',01);
insert into  usuario values(22767921-3,'juanita Perez','3355985',02);
insert into  usuario values(22767921-7,'pepita pepe','337985',03);
insert into  usuario values(1122334455,'Oscar fuentes','111122',06);


drop table usuario;
drop table ciudades;

SELECT    usuario.rut, usuario.nombre, usuario.telefono, ciudades.nom_ciudad
          FROM      usuario INNER JOIN
          ciudades ON  ciudades.cod_ciudad= usuario.ciudad