
create database Vehiculos

use Vehiculos

create table Usuarios
(
	IDUsuario int identity(1,1),
	Email varchar(50),
	Clave varchar(30),
	NombreU varchar(50),
	Apellido varchar(50),
	constraint PK_IDUsuario primary key (IDUsuario),
	constraint UQ_Email unique (Email)
)

create table Placa
(
	IDPlaca int identity (1,1),
	NumPlaca  varchar(6),
	IDUsuario int,
	Monto money,
	constraint PK_IDPlaca primary key (IDPlaca),
	constraint FK_IDUsuario foreign key (IDUsuario) references Usuarios (IDUsuario),
	constraint UQ_NumPlaca unique (NumPlaca)
)

-- Login

create procedure ValidarUsuario
@Email varchar(50),
@Clave varchar(30)
as
	begin
		select * from Usuarios where Email = @Email and Clave = @Clave
	end

exec ValidarUsuario 'pablo@uh.cr', '345'

-- Usuarios

create procedure ConsultaUsuarios
as
	begin
		select u.IDUsuario, u.NombreU, u.Apellido, u.Email from Usuarios u
	end

exec ConsultaUsuarios

create procedure IngresarUsuario
@Email varchar(50),
@Clave varchar(30),
@NombreU varchar(50),
@Apellido varchar(50)
as
	begin
		insert into Usuarios(Email, Clave, NombreU, Apellido) values (@Email, @Clave, @NombreU, @Apellido)
	end

exec IngresarUsuario 'pablo@uh.cr', '345', 'Pablo', 'Aguilar'
exec ConsultaUsuarios

create procedure BorrarUsuario
@IDUsuario varchar(10)
as
	begin
		delete Usuarios where IDUsuario = @IDUsuario
	end

exec BorrarUsuario 2
exec ConsultaUsuarios

create procedure ActualizarUsuario
@Email varchar(30),
@Clave varchar(30),
@NombreU varchar(50),
@Apellido varchar(50)
as
	begin
		update Usuarios set Clave = @Clave, NombreU = @NombreU, Apellido = @Apellido where Email = @Email
	end

exec ActualizarUsuario
exec ConsultaUsuarios

-- Placas

create procedure ConsultaPlaca
as
	begin
		select * from Placa
	end

exec ConsultaPlaca

create procedure IngresarPlaca
@NumPlaca varchar(6),
@IDUsuario varchar(10),
@Monto money

as
	begin
		insert into Placa(NumPlaca, IDUsuario, Monto) values (@NumPlaca, @IDUsuario, @Monto)
	end

exec IngresarPlaca
exec ConsultaPlaca

create procedure BorrarPlaca
@IDPlaca varchar(10)
as
	begin
		delete Placa where IDPlaca = @IDPlaca
	end

exec BorrarPlaca 2
exec ConsultaPlaca

create procedure ActualizarPlaca
@NumPlaca varchar(6),
@IDUsuario varchar(10),
@Monto money,
@IDPlaca varchar(10)
as
	begin
		update Placa set NumPlaca = @NumPlaca, IDUsuario = @IDUsuario, Monto = @Monto where IDPlaca = @IDPlaca
	end

exec ActualizarPlaca
exec ConsultaPlaca

-- Reporte

create procedure Reporte
@NumPlaca varchar(6)
as
	begin
		select u.NombreU, u.Apellido, p.NumPlaca, p.Monto, p.Monto*0.13 as IVA, p.Monto*1.13 as Total
		from Placa p
		inner join Usuarios u on u.IDUsuario = p.IDUsuario
		where p.NumPlaca = @NumPlaca
	end

create procedure MostrarReporte
as
	begin
		select u.NombreU, u.Apellido, p.NumPlaca, p.Monto, p.Monto*0.13 as IVA, p.Monto*1.13 as Total
		from Placa p
		inner join Usuarios u on u.IDUsuario = p.IDUsuario
	end