CREATE DATABASE Comercio;
USE Comercio;
/**/
CREATE Table Cliente(IDCliente INT PRIMARY KEY Auto_Increment, Nome VARCHAR(40) NOT NULL, Sexo ENUM('M', 'F') NOT NULL,
			 CPF VARCHAR(11) UNIQUE, Email VARCHAR(50) UNIQUE);
/**/
CREATE Table Endereco(IDEndereco INT PRIMARY KEY Auto_Increment, Rua VARCHAR(30) NOT NULL, Bairro VARCHAR(30) NOT NULL,
			 Cidade VARCHAR(30) NOT NULL, Estado VARCHAR(30) NOT NULL, ID_Cliente INT UNIQUE,
			 FOREIGN KEY(ID_Cliente) REFERENCES Cliente(IDCliente));
/**/
CREATE Table Telefone(IDTelefone INT PRIMARY KEY Auto_Increment, Tipo ENUM('RES', 'COM', 'CEL')  NOT NULL, 
			 Numero VARCHAR(11) NOT NULL, ID_Cliente INT, FOREIGN KEY(ID_Cliente) REFERENCES Cliente(IDCliente));
/*Insert Cliente*/
Insert into Cliente values(null, 'joao', 'M', '09088596023','joaoxd@gmail.com');
Insert into Cliente values(null, 'claudia', 'F', '98732159124','claudia@outlook.com');
Insert into Cliente values(null, 'sebastiao', 'M', '37852216354','sebasmole@gmail.com');
Insert into Cliente values(null, 'cristina', 'F', '09423009801','cristi@gmail.com');
Insert into Cliente values(null, 'marcos', 'M', '62098035008','marquinhos@yahoo.com');
Insert into Cliente values(null, 'sabrina', 'F', '53190058703','sabrina@bol.com');
Insert into Cliente values(null, 'alexandre', 'M', '59120457705','alexandre@gmail.com');
Insert into Cliente values(null, 'rosangela', 'F', '05796082707','rosbife@outlook.com');
/*Insert Endereço*/
insert into Endereco values(null, 'Rua - Marcelo Gomes', 'Dorneles Cardoso', 'Santa Teresa', 'RJ', 1);
insert into Endereco values(null, 'Rua - teroubo nakara', 'Trafico Solto', 'Osasco', 'SP', 2);
insert into Endereco values(null, 'Rua - Souza Lobo', 'Sao Jeronimo', 'Gravatai', 'RS', 3);
insert into Endereco values(null, 'Rua - vodor mihr', 'kansei', 'Jaquie', 'BH', 4);
insert into Endereco values(null, 'Rua - Mestre Ramon', 'Dinoricos', 'Rio Branco', 'AC', 5);
insert into Endereco values(null, 'Rua - Fonseca Ramos', 'Medianeira', 'Porto Alegre', 'RS', 6);
insert into Endereco values(null, 'Rua - General Adolfus', 'Little Germany', 'Florianopolis', 'SC', 9);
insert into Endereco values(null, 'Rua - Brasilio Pinto', 'Centro', 'Quixada', 'CE', 10);
/*Inssert Telefone*/
insert into Telefone values(null, 'CEL', '996832214', 1);
insert into Telefone values(null, 'CEL', '938627623', 2);
insert into Telefone values(null, 'CEL', '978654321', 3);
insert into Telefone values(null, 'CEL', '993547101', 4);
insert into Telefone values(null, 'CEL', '992346158', 5);
insert into Telefone values(null, 'CEL', '982679352', 6);
insert into Telefone values(null, 'CEL', '978656323', 9);
insert into Telefone values(null, 'CEL', '995682461', 10);
insert into Telefone values(null, 'RES', '996231928', 2);
insert into Telefone values(null, 'RES', '946035214', 3);
insert into Telefone values(null, 'RES', '964597128', 9);

/*Join*/
Select Nome, Email, cidade, estado
from Cliente
	Inner Join Endereco
	On IDCliente = ID_Cliente
Where Sexo = 'F';

/*Criando View*/
CREATE VIEW V_Relatorio AS 
Select c.Nome, c.CPF, c.Email, t.Numero, t.Tipo, e.Rua, e.Cidade, e.Estado
from Cliente c
Inner Join Endereco e
On c.IDCliente = e.ID_Cliente
Inner Join telefone t
On c.IDCliente = t.ID_Cliente;

/*Criando procedure*/
create procedure ADCliente(PNome varchar(40), PSexo Enum('m','f'), PCPF varchar(11), PEmail varchar(50))
begin
	
	Insert into Cliente values(null, PNome, PSexo, PCPF, PEmail);

end/

create procedure VECliente()
begin

	Select c.IDCliente, c.Nome, c.Email, t.Numero, e.Cidade, e.Estado from Cliente c
		Inner Join telefone t
		on c.IDCliente = t.ID_Cliente
		Inner Join endereco e
		on c.IDCliente = e.ID_Cliente;

end/

create procedure VEC_fem()
begin

	Select c.IDCliente, c.Nome, c.Email, t.Numero, e.Cidade, e.Estado from Cliente c
		Inner Join telefone t
		on c.IDCliente = t.ID_Cliente
		Inner Join endereco e
		on c.IDCliente = e.ID_Cliente
		where c.Sexo = 'F';

end

create procedure VEC_male()
begin

	Select c.IDCliente, c.Nome, c.Email, t.Numero, e.Cidade, e.Estado from Cliente c
		Inner Join telefone t
		on c.IDCliente = t.ID_Cliente
		Inner Join endereco e
		on c.IDCliente = e.ID_Cliente
		where c.Sexo = 'M';

end/