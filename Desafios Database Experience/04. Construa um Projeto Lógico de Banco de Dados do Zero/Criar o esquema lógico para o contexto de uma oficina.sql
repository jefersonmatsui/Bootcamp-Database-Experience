-- Criação do banco de dados para o cenário de Oficina
-- drop database oficina;
create database oficina;
use oficina;

-- criar tabela cliente
create table cliente(
	idCliente int auto_increment primary key,
    Pnome varchar(10),
    Minic char(1),
    Unome varchar(20),
    CPF char(11),
    Num_contato varchar(70),
    constraint unique_cpf_cliente unique (CPF)
);
desc cliente;

-- criar tabela veículo
create table veiculo(
	idVeiculo int auto_increment primary key,
    idVeiculoCliente int,
    Modelo varchar(30) not null,
	Placa varchar(30) not null,
    Cor enum('Preto', 'Branco', 'Vermelho', 'Azul'),
    Fabricante enum('Ford', 'Toyota'),
    constraint fk_veiculo_cliente foreign key (idVeiculoCliente) references cliente(idCliente)
);
desc veiculo;

-- criar tabela OS
create table os(
	idOS int auto_increment primary key,
    Emissão varchar(20) not null,
    Valor float not null,
	Condição enum('Em andamento', 'Concluído') not null default 'Em andamento',
    Conclusão varchar(20) not null
);
desc os;

-- criar tabela Peças
create table pecas(
	idPecas int auto_increment primary key,
    ModeloPeca varchar(5) not null,
    ValorPeca float not null,
	Fabricante enum('Ford', 'Toyota')
);
desc pecas;

-- criar tabela Serviço
create table servico(
	idServico int auto_increment primary key,
    Conserto bool,
    Revisão bool,
	Valorservico float
);
desc servico;

-- criar tabela Mecânico
create table mecanico(
	idMecanico int auto_increment primary key,
    idMVveiculo int,
    idMOos int,
    Pnome varchar(10),
    Minic char(1),
    Unome varchar(20),
    Endereco varchar(70),
    Especialidade varchar(10),
    constraint fk_mecanico_veiculo_veiculo foreign key (idMVveiculo) references veiculo(idVeiculo),
    constraint fk_mecanico_os_os foreign key (idMOos) references os(idOS)
);
desc mecanico;

-- criar tabela Cliente <-> OS
create table cliente_os(
	idCOcliente int,
    idCOos int,
    Autorizacao bool,
    primary key(idCOcliente, idCOos),
    constraint fk_cliente_os_cliente foreign key (idCOcliente) references cliente(idCliente),
    constraint fk_cliente_os_os foreign key (idCOos) references os(idOS)
);
desc cliente_os;

-- criar tabela Peças <-> OS
create table pecas_os(
	idPOos int,
    idPOpecas int,
    primary key(idPOos, idPOpecas),
    constraint fk_pecas_os_os foreign key (idPOos) references os(idOS),
    constraint fk_pecas_os_pecas foreign key (idPOpecas) references pecas(idPecas)
);
desc pecas_os;

-- criar tabela Serviço <-> OS
create table servico_os(
	idSOos int,
    idSOservico int,
    primary key(idSOos, idSOservico),
    constraint fk_servico_os_os foreign key (idSOos) references os(idOS),
    constraint fk_servico_os_servico foreign key (idSOservico) references servico(idServico)
);
desc servico_os;

-- criar tabela Mecanico <-> Serviço
create table mecanico_servico(
	idMSmecanico int,
    idMSservico int,
    idMVveiculo int,
    primary key(idMSmecanico, idMSservico, idMVveiculo),
    constraint fk_mecanico_servico_mecanico foreign key (idMSmecanico) references mecanico(idMecanico),
    constraint fk_mecanico_servico_servico foreign key (idMSservico) references servico(idServico)
);
desc mecanico_servico;