create database MAQUINAS

use MAQUINAS 

create table Cajeros 
(
Codigo_Cajero int identity (1,1),
Nombre nvarchar (50)not null,
apellidos nvarchar (200)not null
constraint PK_CodigoCajero Primary Key(Codigo_Cajero)
)
-- ingresar para probar

insert into Cajeros values ('danny','Castro Barboza')
insert into Cajeros values ('Natalia','Solano Chacon')

select * from Cajeros


create table Productos
(
Codigo_Producto int identity (1,1),
Nombre nvarchar(100)not null,
Precio float not null default 0
constraint PK_CodigoProducto Primary Key(Codigo_Producto)
)
-- ingresar para probar
insert into Productos values ('Galleta Maria',12000) 
insert into Productos values ('Fresco Tampico',1000)
insert into Productos values ('Gomitas',5000)
select * from Productos


create table Maquinas_Registradoras
(
Codigo_Maquinas int identity (1,1),
Piso int 
constraint PK_CodigoMaquinas Primary Key(Codigo_Maquinas)
)
create table Piso
(
Piso int identity (1,1),
Descripcion varchar (20)
)
insert into Piso values ('Piso 1'),('Piso 2')

-- ingresar para probar

insert into Maquinas_Registradoras values (1)
insert into Maquinas_Registradoras values (2)
select * from Maquinas_Registradoras


create table Venta
(
Codigo_Venta int identity (1,1),
Cajero int, 
Maquina int,
Producto int,
Fecha date not null default GetDate()
constraint PK_CodigoVenta Primary Key(Codigo_Venta)

constraint Fk_Cajero foreign key (Cajero) References Cajeros(Codigo_Cajero),
constraint Fk_Maquina foreign key (Maquina) References Productos(Codigo_Producto),
constraint Fk_Producto foreign key (Producto) References Maquinas_Registradoras(Codigo_Maquinas)
)

create table seguro
(
nombre int identity (1,1),
Descripcion varchar (20)
)

-- actualizar productos

	update Productos set nombre = 'Sofia' where nombre = 'Natalia'
    update Productos set Precio= '2000' where Precio = 12000

Select c.nombre, c.apellidos, Venta.Cajero, Venta.Maquina, Venta.Producto, Venta.Fecha
from Cajeros c
inner join Venta on c.Codigo_Cajero = Venta.Codigo_Venta






Select c.nombre, c.apellidos,p.nombre, p.precio, m.Piso
from Cajeros c, Productos p, Maquinas_Registradoras m
inner join Venta on c.Codigo_Cajero p.Codigo_Producto m.Codigo_Maquinas = Venta.Codigo_Venta