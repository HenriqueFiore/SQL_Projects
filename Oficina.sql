CREATE DATABASE Oficina;

CREATE Table Cliente(IDCliente int Primary Key Auto_Increment, Nome VARCHAR(40) not null,
				CPF VARCHAR(11) not null unique, ID_Carro int unique);


CREATE Table Telefone(IDTelefone int Primary Key Auto_Increment, Numero VARCHAR(20) not null,
				Tipo ENUM('CEL', 'RES') not null, ID_Cliente int);


CREATE Table Carro(IDCarro int Primary Key Auto_Increment, Placa VARCHAR(8) not null Unique,
				Modelo VARCHAR(30) not null, ID_Marca int);


CREATE Table Marca(IDMarca int Primary Key Auto_Increment, Marca VARCHAR(30) unique);

CREATE Table Carro_Cor(ID_Carro int, ID_Cor int, Primary Key(ID_Carro, ID_Cor));

CREATE Table Cor(IDCor int Primary Key Auto_Increment, Cor VARCHAR(30) Unique);


Alter Table Cliente ADD Constraint FK_Cliente_Carro
Foreign Key(ID_Carro) References Carro(IDCarro);

Alter Table Telefone ADD Constraint FK_Telefone_Cliente
Foreign Key(ID_Cliente) References Cliente(IDCliente);

Alter Table Carro ADD Constraint FK_Carro_Marca
Foreign Key(ID_Marca) References Marca(IDMarca);

Alter Table Carro_Cor ADD Constraint FK_Cor
Foreign Key(ID_Cor) References Cor(IDCor);

Alter Table Carro_Cor ADD Constraint FK_Carro
Foreign Key(ID_Carro) References Carro(IDCarro);


Insert into Cor Values(null, 'Preto');
Insert into Cor Values(null, 'Branco');
Insert into Cor Values(null, 'Cinza');
Insert into Cor Values(null, 'Azul');
Insert into Cor Values(null, 'Vermelho');
Insert into Cor Values(null, 'Amarelo');
Insert into Cor Values(null, 'Verde');

Insert into Marca Values(null, 'Audi');
Insert into Marca Values(null, 'Mercedes');
Insert into Marca Values(null, 'Toyota');
Insert into Marca Values(null, 'Fiat');
Insert into Marca Values(null, 'Tesla');
Insert into Marca Values(null, 'Jeep');
Insert into Marca Values(null, 'Chevrolet');
Insert into Marca Values(null, 'Wolkswagen');
Insert into Marca Values(null, 'Hyundai');
Insert into Marca Values(null, 'Honda');
Insert into Marca Values(null, 'Renault');
Insert into Marca Values(null, 'BMW');
Insert into Marca Values(null, 'Ford');
Insert into Marca Values(null, 'Citroen');
Insert into Marca Values(null, 'Peugeot');

Insert into Carro Values(null, 'jkl9875', 'Renegade', 6);
Insert into Carro Values(null, 'rhj4329', 'Mustang', 13);
Insert into Carro Values(null, 'qua1735', 'Onix', 7);
Insert into Carro Values(null, 'kjh6152', 'A3', 1);
Insert into Carro Values(null, 'vmy3417', 'a200', 2);
Insert into Carro Values(null, 'ynt8827', 'Model S', 5);
Insert into Carro Values(null, 'cmh6829', 'Civic Turbo', 10);
Insert into Carro Values(null, 'wsi8463', 'HR-V', 10);
Insert into Carro Values(null, 'gyn4682', 'Camry', 3);
Insert into Carro Values(null, 'dio3752', 'HB20', 9);
Insert into Carro Values(null, 'ecr6480', 'Argo', 4);
Insert into Carro Values(null, 'sno1618', 'i5', 12);
Insert into Carro Values(null, 'vao3134', 'TCross', 8);

Insert into Carro_Cor Values( 1, 6);
Insert into Carro_Cor Values( 2, 1);
Insert into Carro_Cor Values( 3, 4);
Insert into Carro_Cor Values( 4, 2);
Insert into Carro_Cor Values( 5, 1);
Insert into Carro_Cor Values( 6, 2);
Insert into Carro_Cor Values( 7, 3);
Insert into Carro_Cor Values( 8, 5);
Insert into Carro_Cor Values( 9, 3);
Insert into Carro_Cor Values( 10, 5);
Insert into Carro_Cor Values( 11, 4);
Insert into Carro_Cor Values( 12, 6);
Insert into Carro_Cor Values( 13, 1);


Insert into Cliente Values(null, 'Marcos', '45636974123', 1);
Insert into Cliente Values(null, 'Juliana', '78566214565', 2);
Insert into Cliente Values(null, 'João', '76312512209', 3);
Insert into Cliente Values(null, 'Yasmin', '35942800215', 4);
Insert into Cliente Values(null, 'Diego', '92739516507', 5);
Insert into Cliente Values(null, 'Ana', '98732602501', 6);
Insert into Cliente Values(null, 'Henrique', '79130005008', 7);
Insert into Cliente Values(null, 'Natália', '06958254041', 8);
Insert into Cliente Values(null, 'Maicon', '04643524385', 9);
Insert into Cliente Values(null, 'Andressa', '34929416742', 10);
Insert into Cliente Values(null, 'Jonas', '92648212532', 11);
Insert into Cliente Values(null, 'Quimberly', '08761583495', 12);
Insert into Cliente Values(null, 'Alexandre', '83450298214', 13);

Insert into Telefone values(null, '961758158', 'CEL', 1);
Insert into Telefone values(null, '936416857', 'CEL', 2);
Insert into Telefone values(null, '941236588', 'CEL', 3);
Insert into Telefone values(null, '931896543', 'CEL', 4);
Insert into Telefone values(null, '984232184', 'CEL', 5);
Insert into Telefone values(null, '924987522', 'CEL', 6);
Insert into Telefone values(null, '957432187', 'CEL', 7);
Insert into Telefone values(null, '935421875', 'CEL', 8);
Insert into Telefone values(null, '974163285', 'CEL', 9);
Insert into Telefone values(null, '936854768', 'CEL', 10);
Insert into Telefone values(null, '946385716', 'CEL', 11);
Insert into Telefone values(null, '983721645', 'CEL', 12);
Insert into Telefone values(null, '998322313', 'CEL', 13);
Insert into Telefone values(null, '968715476', 'RES', 2);
Insert into Telefone values(null, '912313548', 'RES', 3);
Insert into Telefone values(null, '963485987', 'RES', 7);
Insert into Telefone values(null, '963485987', 'RES', 8);
Insert into Telefone values(null, '943621867', 'RES', 10);
Insert into Telefone values(null, '918624356', 'RES', 11);
Insert into Telefone values(null, '996267843', 'RES', 13);

CREATE Procedure Ve_Placa(Placa varchar(8))
begin
	Select k.IDCliente, k.Nome, k.CPF, t.Numero, t.Tipo, c.IDCarro, m.Marca, c.Modelo, c.Placa, z.cor  from Carro c
		Inner Join Marca m
		On c.ID_Marca = m.IDMarca
		Inner Join Carro_Cor x
		on (c.IDCarro = x.ID_Carro)
		Inner Join cor z
		on z.IDCor = x.ID_Cor
		Inner Join Cliente k
		on k.ID_Carro = c.IDCarro
		Inner Join telefone t
		on k.IDCliente = t.ID_Cliente
		where Placa = c.Placa;
end:

CREATE Procedure Ve_CPF(CPF varchar(11))
begin
	Select k.IDCliente, k.Nome, k.CPF, t.Numero, t.Tipo, c.IDCarro, m.Marca, c.Modelo, c.Placa, z.cor  from Carro c
		Inner Join Marca m
		On c.ID_Marca = m.IDMarca
		Inner Join Carro_Cor x
		on (c.IDCarro = x.ID_Carro)
		Inner Join cor z
		on z.IDCor = x.ID_Cor
		Inner Join Cliente k
		on k.ID_Carro = c.IDCarro
		Inner Join telefone t
		on k.IDCliente = t.ID_Cliente
		where CPF = k.CPF;
end:

CREATE Procedure Ve_IDC(IDC int)
begin
	Select k.IDCliente, k.Nome, k.CPF, t.Numero, t.Tipo, c.IDCarro, m.Marca, c.Modelo, c.Placa, z.cor  from Carro c
		Inner Join Marca m
		On c.ID_Marca = m.IDMarca
		Inner Join Carro_Cor x
		on (c.IDCarro = x.ID_Carro)
		Inner Join cor z
		on z.IDCor = x.ID_Cor
		Inner Join Cliente k
		on k.ID_Carro = c.IDCarro
		Inner Join telefone t
		on k.IDCliente = t.ID_Cliente
		where IDC = c.IDCarro;
end:

CREATE Procedure Ve_IDK(IDK int)
begin
	Select k.IDCliente, k.Nome, k.CPF, t.Numero, t.Tipo, c.IDCarro, m.Marca, c.Modelo, c.Placa, z.cor  from Carro c
		Inner Join Marca m
		On c.ID_Marca = m.IDMarca
		Inner Join Carro_Cor x
		on (c.IDCarro = x.ID_Carro)
		Inner Join cor z
		on z.IDCor = x.ID_Cor
		Inner Join Cliente k
		on k.ID_Carro = c.IDCarro
		Inner Join telefone t
		on k.IDCliente = t.ID_Cliente
		where IDK = k.IDCliente;
end:
