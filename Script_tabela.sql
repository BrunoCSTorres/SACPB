use ProjetoSenai

create table tbl_usuario(
id_usuario int primary key identity,
Nome_usuario varchar(100) not null,
Senha varchar(50) not null,
Sexo char(10),
Data_admissao date,
Data_demissao date,
id_cargo int
constraint fk_id_cargo foreign key (id_cargo)
references tbl_cargo(id_cargo)
);

create table tbl_cargo(
id_cargo int primary key identity,
Nome_cargo varchar(50) not null
);

create table tbl_ticket(
id_ticket int primary key identity,
descricao varchar(500) not null,
cliente varchar(100) not null,
id_responsavel int
constraint fk_id_responsavel foreign key (id_responsavel)
references tbl_usuario(id_usuario)
);

select * from tbl_ticket

sp_help tbl_ticket

sp_help tbl_usuario


select * from tbl_ticket

insert into tbl_cargo(Nome_cargo)
values('Admin')

select * from tbl_cargo

insert into tbl_usuario(Nome_usuario,Senha,id_cargo)
values('Admin','123456',1)

select * from tbl_usuario

alter table tbl_usuario
alter column Sexo char(1)

alter table tbl_usuario
add usuario varchar(20)

delete from tbl_usuario

insert into tbl_usuario(Nome_usuario,Senha,id_cargo,usuario)
values('Admin','123456',1,'Admin')

insert into tbl_usuario(Nome_usuario,Senha,id_cargo,usuario)
values('Admin','123456',1,'Admin')

insert into tbl_usuario(Nome_usuario,Senha,Sexo,Data_admissao,id_cargo,usuario)
values('Bruno Torres','123456','Masculino','25/03/1998',1,'brn')

insert into tbl_cargo(Nome_cargo)
values('Assistente TI'),
('Contabilidade')

insert into tbl_ticket(descricao,cliente)
values('Manutenção Computador', 'Bruno torres')

select * from tbl_ticket

alter table tbl_usuario
drop column sexo

alter table tbl_usuario
add Sexo char(1)

select * from tbl_usuario

select* from tbl_ticket

alter table tbl_ticket
add Contato varchar(15)

alter table tbl_ticket
drop column Contato

alter table tbl_ticket
drop column cliente

create table tbl_cliente(
id_cliente int primary key identity,
Nome_cliente varchar(500),
Endereço varchar(100),
Email varchar(50),
Telefone varchar(20),
CPF int
)

alter table tbl_ticket
add id_cliente int

alter table tbl_ticket
add constraint fk_id_cliente foreign key (id_cliente)
references tbl_cliente (id_cliente)

alter table tbl_cliente
alter column CPF varchar(20)

select * from tbl_ticket

sp_help tbl_cliente

insert into tbl_cliente
values('Bruno Caetano','Rua Efigênia Rufino de Souza, 101, Colinas','caetanob3@gmail.com','(32) 98421-3625','130.228.856.36')

select * from tbl_usuario

  SELECT distinct 
		tbl_ticket.id_ticket,   
         tbl_ticket.descricao,   
         tbl_ticket.id_cliente,   
         tbl_cliente.Nome_cliente,   
         tbl_ticket.id_responsavel,   
         tbl_usuario.Nome_usuario  
    FROM tbl_cliente,   
         tbl_ticket,   
         tbl_usuario 
		   WHERE ( tbl_cliente.id_cliente = tbl_ticket.id_cliente ) and  
         ( tbl_usuario.id_usuario = tbl_ticket.id_responsavel )   