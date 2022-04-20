/*

O banco de dados 'estacionamento' possui duas tabelas, cliente e carro;

Um otimo exemplo de banco a ser utilizado em estacionamentos, podendo o cliente ter mais de uma carro registrado

Dados gerados no https://www.4devs.com.br/gerador_de_pessoas e https://www.4devs.com.br/gerador_de_veiculos

*/

create database estacionamento

create table cliente (

idCliente int primary key identity(1,1) not null,

nomeCliente varchar(100) not null,

CPFCliente numeric(11) not null,

RGCliente varchar(10) not null,

enderecoCliente varchar(150) not null,

emailCliente varchar(50),

celularCliente varchar(15) not null,

diaDePG numeric(2) not null)

create table carro (

idCliente int foreign key References cliente(idCliente) not null,

RENAVAMCarro numeric(11) not null,

placaCarro varchar(10) not null,

marcaCarro varchar(20) not null,

modeloCarro varchar(40) not null,

anoCarro numeric(4),

corCarro varchar(15),

constraint pk_carro primary key (RENAVAMCarro)

)

insert into cliente values

('Allana Simone Elaine Costa', 98636792592, '103620886', 'Quadra 109 Sul Avenida Juscelino Kubitschek 721', 'allana.simone.costa@scalioni.com.br', '63986313522', 20),

('Jennifer Marli Cardoso', 88532829244, '133931845', 'Rua Santa Isabel 231', 'jennifer_marli_cardoso@agacapital.com.br', '79991493961', 15),

('Henrique José Teixeira', 63745148584, '143123932', '2ª Travessa Panelas 481', 'henriquejoseteixeira@dglnet.com.br', '81989042957', 12),

('Thales Matheus Souza', 84728325202,'346179634', 'Rua Bahia 537', 'thales_souza@multmed.com.br', '79999500080', 30)

insert into carro values

(4, 05788721128, 'NEL7075', 'Daihatsu','Cuore 0/TS0 85i', 1995, 'Marrom'),

(2, 52437712900, 'LWN8839', 'Ferrari', '360 Modena', 1999, 'Vermelho'),

(3, 65178485521, 'HZX1035', 'Jaguar', 'XJ-6', 1994, 'Dourado'),

(4, 21867701300, 'MUA2706', 'Peugeot', '206 Selection 1.6 16V 110cv 3p', 2003, 'Laranja'),

(2 ,92037869592, 'NAQ7565', 'Walk', 'Buggy Walk Sport 1.6 8V 58cv', 2005, 'Preto'),

(1 ,99190097913, 'JNX5470', 'GEELY', 'EC7 1.8 16V 130cv 4p Mec.', 2014, 'Bege')

select * from cliente

select * from carro