create database Exercicio;

USE exercicio;

Create Table Cursos(IDCurso int primary key auto_increment, Nome varchar(30), Tempo int, Preco Float(10,2), ID_Prereq int);

Alter Table Cursos add constraint FK_Prereq
foreign key (ID_Prereq) references Cursos(IDCurso);

Insert into Cursos values(null, 'Lógica de Programação', 10, 25.00, null);
Insert into Cursos values(null, 'Java', 30, 75.00, 1);
Insert into Cursos values(null, 'Banco de Dados', 15, 30.39, null);
Insert into Cursos values(null, 'Power Bi', 20, 40.50, 3);
Insert into Cursos values(null, 'Relatorios Avançados', 12, 29.99, 4);

select c.Nome, c.tempo, c.preco, ifnull(p.nome, "=========") as Prereq
from Cursos c
left join cursos p
on p.IDCurso = c.ID_Prereq;