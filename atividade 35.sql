create database empresa;
use empresa;
create table cliente(
cpf bigint primary key auto_increment,
nome varchar(80) not null, 
rg varchar(20) not null,
estado_civil varchar(20) not null,
logradouro varchar(60),
numero smallint,
complemento varchar(20),
bairro varchar(60),
cidade varchar(60),
uf char(2),
cep char(9)
);
create table tel_cliente(
cliente bigint not null,
foreign key(cliente) references cliente(cpf),
telefone char(14) not null,
tel_tipo char(1) not null
);

create table agencia (
codigo int primary key auto_increment,
nome varchar(45) not null,
gerente varchar(80) not null,
logradouro varchar(60),
numero smallint,
complemento varchar(20),
bairro varchar(60),
cidade varchar(60),
uf char(2),
cep char(9)
);

create table funcionario (
matricula bigint primary key auto_increment,
nome varchar(80) not null,
cargo varchar(20) not null,
logradouro varchar(60),
numero smallint,
complemento varchar(20),
bairro varchar(60),
cidade varchar(60),
uf char(2),
cep char(9),
agencia_codigo int, 
foreign key (agencia_codigo) references agencia(codigo)
);
create table conta(
numero int primary key auto_increment,
agencia_codigo int, 
foreign key (agencia_codigo) references agencia(codigo),
cliente_cpf int, 
foreign key (cliente_cpf) references cliente(cpf),
data_abertura date,
saldo_atual double,
data_saldo timestamp
);
create table movimento(
data date,
hora time,
tipo char,
quantia double,
conta_numero int,
foreign key (conta_numero) references conta (numero),
funcionario_matricula bigint,
foreign key (funcionario_matricula) references funcionario (matricula)
);






