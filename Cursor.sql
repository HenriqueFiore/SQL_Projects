Create database Cursores;

Use cursores;

Create Table Vendedor(IDVendedor int primary key auto_increment, Nome varchar(30), Jan int, Fev int, Mar int);

insert into Vendedor values(null, 'Julia', 2000, 3000, 6500);
insert into Vendedor values(null, 'Marcos', 1000, 8700, 1100);
insert into Vendedor values(null, 'Ana', 9500, 1000, 5200);
insert into Vendedor values(null, 'Cauã', 5000, 7000, 8900);

Create Table VendTotal(Nome varchar(30), Jan int, Fev int, Mar int, Media int, Total int);

Delimiter :

Create Procedure Inserir()
begin
	Declare Fim int default 0;
	Declare v1, v2, v3, VMed, VTotal int;
	Declare Vnome Varchar(30);

	Declare REG cursor for(
		Select Nome, Jan, Fev, Mar From Vendedor
	);

	Declare Continue Handler FOR NOT FOUND SET Fim = 1;

	Open REG;

	Repeat

		Fetch REG into VNome, v1, v2, v3;
		IF not Fim Then
			set VTotal = v1 + v2 + v3;
			set VMed = VTotal / 3;

			Insert into VendTotal values(Vnome, v1, v2, v3, VMed, VTotal);
		End IF;

	Until Fim end repeat;

	Close REG;
end:

delimiter ;

call inserir();

Select * from VendTotal;