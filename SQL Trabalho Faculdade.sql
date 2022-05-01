/*  
1. Utilizando o banco de dados MySQL, crie um script contendo os comandos DDL necessários para 
criar um banco de dados e suas tabelas. O banco deverá ser chamado de “universidade-bd” e algumas 
das tabelas deste banco são as seguintes:  
ALUNO: armazena os dados pessoais dos alunos (nome, cpf, endereço, ...) 
PROFESSOR: armazena os dados dos professores da escola (nome, cpf, salário, carga horária...). 
CURSO: armazena os dados dos cursos ofertados pela universidade
MATRÍCULA: tabela que agrega as informações de alunos matriculados em determinados cursos 
Você deverá implementar obrigatoriamente estas três tabelas, porém ficará a seu critério a definição 
dos atributos que cada tabela terá, e ainda poderá inserir mais tabelas desde que continue de acordo 
com a temática da tarefa. Não se esqueça de definir corretamente os relacionamentos entre as 
tabelas por meio da integridade referencial. 
2. Elabore o código para uma consulta SQL que exiba corretamente os dados completos de uma 
matrícula, contendo nome do aluno, seu número de matrícula, o curso que está matriculado, e 
demais informações que houver 
*/ 

/*  
site para gerar dados aleatorios e preencher a tabela  
"https://www.mockaroo.com/" 
*/ 

create database universidade_bd 

use universidade_bd

create table ALUNO ( 
idAluno int primary key identity(1,1), 
nomeAluno varchar(70) not null, 
cpfAluno numeric(11) unique, 
enderecoAluno varchar(100) not null  
) 

create table PROFESSOR( 
idProfessor int Primary Key identity(1,1), 
nomeProfessor varchar(70) not null, 
cpfProfessor numeric(11) unique, 
salarioProf numeric(6,2) not null, 
cargaHoraria int  
) 

create table CURSO( 
idCurso int Primary key identity(1,1), 
nomeCurso varchar(50) not null, 
cargaHoraria int not null, 
idProfessor int foreign key references PROFESSOR(idProfessor) 
) 

create table MATRICULA( 
idAluno int foreign key references ALUNO(idAluno) not null, 
idCurso int foreign key references CURSO(idCurso) not null, 
numeroMatricula int not null, 
dataMatricula date not null, 
constraint pk_MATRICULA primary key (numeroMatricula) 
) 

create unique index idx_MatriculaAlunoCurso on MATRICULA(idAluno, idCurso); 
select * from CURSO 
select * from ALUNO 
select * from PROFESSOR 
select * from MATRICULA 
  
insert into ALUNO values 
('Fielding', 67325706660, '741 Carberry Place'), 
('Dulsea', 86506525219, '39457 Vermont Terrace'), 
('Joey', 98466862806, '86 Arapahoe Place'), 
('Jemima', 16339453939, '7675 Browning Lane'), 
('Markus', 60301662949, '014 5th Avenue') 
  
insert into PROFESSOR values 
('Anica', 59931776852, 9140.00, 30), 
('Noelani', 66076684122, 4544.23, 4), 
('Pammi', 80328330954, 5460.08, 4), 
('Idalina', 53328359217, 6668.97, 34), 
('Loella', 72711910648, 2881.97, 40) 
  
insert into CURSO values 
('Arquitetura e Urbanismo', 3600, 1), 
('Biomedicina', 3200, 2), 
('Ciência da Computação', 3808, 3), 
('Ciências Contábeis', 3000, 4), 
('Direito', 3700, 5), 
('Educação Física', 3200, 3), 
('Enfermagem', 4000, 4), 
('Engenharia Civil', 3600, 2), 
('Turismo', 3000, 1), 
('Engenharia Elétrica', 4100, 4)  

insert into MATRICULA values 
(1, 8, 467, '04/10/2020'), 
(3, 3, 243, '17/09/2021'), 
(1, 5, 38, '17/03/2021'), 
(2, 7, 855, '01/02/2020'), 
(2, 4, 684, '30/10/2021'), 
(4, 2, 199, '12/08/2020'), 
(2, 11, 385, '16/10/2020'), 
(4, 10, 421, '29/05/2020'), 
(3, 8, 964, '06/12/2019'), 
(5, 9, 307, '30/12/2020'), 
(4, 11, 119, '26/03/2020'), 
(1, 7, 413, '22/05/2021'), 
(3, 9, 606, '19/04/2021'), 
(2, 10, 111, '13/11/2021'), 
(3, 10, 302, '16/07/2021') 


select m.numeroMatricula as Matricula, a.nomeAluno as Aluno, m.dataMatricula as DataDeMatricula, c.nomeCurso as Curso from MATRICULA m 
inner join ALUNO a on m.idAluno = a.idAluno 
inner join CURSO c on m.idCurso = c.idCurso 
order by c.nomeCurso 