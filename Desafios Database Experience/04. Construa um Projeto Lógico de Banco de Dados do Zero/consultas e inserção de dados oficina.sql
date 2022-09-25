-- inserção de dados e queries

use oficina;

show tables;

-- idCliente, Pnome, Minic, Unome, CPF, Num_contato
insert into cliente (Pnome, Minic, Unome, CPF, Num_contato) values
						('Pedro', 'C', 'Santos', '03889047086', '123456789'),
                        ('Rafael', 'S', 'Pinho', '04691053075', '987654321'),
                        ('Graziela', 'E', 'Luz', '03386062035', '123789456');
select * from cliente;

-- idVeiculo, idVeiculoCliente, Modelo, Placa, Cor, Fabricante				
insert into veiculo (idVeiculoCliente, Modelo, Placa, Cor, Fabricante) values
						('1', 'Ka', 'yjc1320', 'Branco', 'Ford'),
                        ('2', 'Corolla', 'iwr9643', 'Preto', 'Toyota'),
                        ('3', 'SW4', 'ind1762', 'Vermelho', 'Toyota');
 select * from veiculo;
 
-- idOS, Emissão, Valor, Condição, Conclusão			
insert into os (Emissão, Valor, Condição, Conclusão) values
						('2022-24-08', 1200, 'Em andamento', '2022-06-09'),
                        ('2022-15-08', 2200, 'Concluído', '2022-22-09'),
                        ('2022-02-09', 300, 'Em andamento', '2022-12-09');
select * from os; 
                     	
-- idPecas, ModeloPeca, ValorPeca, Fabricante
insert into pecas (ModeloPeca, ValorPeca, Fabricante) values 
						('fd321', '200', 'Ford'),
                        ('ty492', '700', 'Toyota'),
                        ('ty378', '300', 'Toyota');
select * from pecas;  
                      
-- idServico, Conserto, Revisão, Valorservico
insert into servico (Conserto, Revisão, Valorservico) values 
						(true, null, '1000'),
                        (true, null, '1500'),
                        (null, false, '300');                        
select * from servico;    
                      
-- idMecanico, idMVveiculo, idMOos, Pnome, Minic, Unome, Endereco, Especialidade
insert into mecanico (idMVveiculo, idMOos, Pnome, Minic, Unome, Endereco, Especialidade) values 
						(1, 1, 'Carlos', 'A', 'Silva', 'Lima e Silva, 912 - Porto alegre', 'Chapeador'),
                        (2, 2, 'João', 'G', 'Costa', 'Borges de Medeiros, 501 - Porto alegre', 'Elétrica'),
                        (3, 3, 'Osvaldo', 'F', 'Santos', 'José de Alencar, 1001 - Porto alegre', 'Motor');
select * from mecanico;

-- idCOcliente, idCOos, Autorizacao
insert into cliente_os (idCOcliente, idCOos, Autorizacao) values 
						(1, 1, true),
                        (2, 2, false),
                        (3, 3, true);
select * from cliente_os;
					
-- idPOos, idPOpecas
insert into pecas_os (idPOos, idPOpecas) values 
						(1, 1),
                        (2, 2),
                        (3, 3);
select * from pecas_os;

-- idSOos, idSOservico
insert into servico_os (idSOos, idSOservico) values 
						(1, 1),
                        (2, 2),
                        (3, 3);
select * from servico_os;

-- idMSmecanico, idMSservico, idMVveiculo
insert into mecanico_servico (idMSmecanico, idMSservico, idMVveiculo) values 
						(1, 1, 1),
                        (2, 2, 2),
                        (3, 3, 3);
select * from mecanico_servico;

select count(*) from cliente;
select * from cliente c, veiculo v where c.idCliente = v.idVeiculo;
select concat(Pnome, ' ', Minic, ' ', Unome) as Nome_Completo, CPF, Num_contato, Modelo, Placa, Cor, Fabricante from cliente c, veiculo v where c.idCliente = v.idVeiculo;

select concat(Pnome, ' ', Minic, ' ', Unome) as Nome_Completo, Endereco, Especialidade, Modelo, Placa, Cor, Fabricante from mecanico m, veiculo v where m.idMecanico = v.idVeiculo;
select concat(Pnome, ' ', Minic, ' ', Unome) as Nome_Completo, Endereco, Especialidade, Emissão, Valor, Condição, Conclusão from mecanico m, os o where m.idMecanico = o.idOS;
select concat(Pnome, ' ', Minic, ' ', Unome) as Nome_Completo, Endereco, Especialidade, Autorizacao from mecanico m, cliente_os o where m.idMecanico = o.idCOcliente;

select c.idCliente, Pnome, count(*) as Numero_veiculos from cliente c
		inner join veiculo v on c.idCliente = v.idVeiculo
	group by idCliente;

 select * from cliente c
		inner join veiculo v on c.idCliente = v.idVeiculoCliente
	group by idCliente;
    
     select * from os o
		inner join cliente_os c on o.idOS = c.idCOos
	group by idOS;