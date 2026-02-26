create database oficina;

use oficina;

create table fabricante (
codigo_fabricante int primary KEY ,
nome varchar (100) not null,
telefone varchar (20),
email varchar (100),
responsavel varchar (100)

);

create table modelo(
codigo_modelo int primary key, 
tipo varchar (100),
peso decimal (10, 2),
fabricante int not null, 
horario_teste time,
oficina int, 
FOREIGN key (fabricante) references fabricante (codigo_fabricante)
	on delete restrict on update cascade,
FOREIGN key (oficina) references oficina (codigo_oficina)
	on delete set null on update cascade
);

create table oficina (
codigo_oficina int primary key, 
cnpj varchar (18) unique not null, 
nome varchar (100) not null, 
responsavel varchar (100),
telefone varchar (20),
email varchar (100)

);

create table maquina (
numero_registro int primary key, 
ano_fabricante year, 
horas_uso decimal (10,
2),
codigomodel int not null,
foreign key (codigomodel) references modelo (codigo_modelo)
on
delete
	restrict to
	update
		cascade

);

create table tecnico (
codigo_func int primary key,
telefone varchar (20),
endereco varchar (200),
salario decimal (10,
2),
qualificacao varchar (120),
oficina_codigo int not null,
foreign key (oficina_codigo) references oficina (codigo_oficina) 
on
delete
	restrict on
	update
		cascade
);

create table teste (
codigo int primary key,
pontos decimal (5,
2),
resultado varchar (50),
recomendacao text,
oficina_cod int not null, 
tecnico_codigo int not null, 
foreign key (oficina_cod) references oficina (codigo_oficina)
on
delete
	restrict on
	update
		cascade,
		foreign key (tecnico_codigo) references tecnico (codigo_func)
on
		delete
			restrict on
			update
				cascade
);
