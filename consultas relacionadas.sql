-- consultas relacionadas

-- Listar el nombre de los empleados y de las sucursales en 
-- los q trabajan
create database empresa;

use empresa;

create table sucursales(suc_id int, suc_nombre varchar(30));
create table empleados(emp_id int, emp_nombre varchar(30), suc_id int);

insert into sucursales values (1,'Centro'),(2,'Congreso'),(3,'Palermo');
insert into empleados values (1,'Juan',1),(2,'Carlos',2),(3,'Jose',2),(4,'Maria',null);

select * from sucursales;
select * from empleados;

select		emp_nombre, suc_nombre
from		empleados
inner join	sucursales
on			empleados.suc_id = sucursales.suc_id;

-- variante
select		emp_nombre, suc_nombre
from		empleados e
inner join	sucursales as s
on			e.suc_id = s.suc_id;

-- variante ansi sql
select		emp_nombre, suc_nombre
from		empleados e, sucursales as s
where		e.suc_id = s.suc_id;

-- Listar los empleados q no trabajan en ninguna sucursal
-- tabla ppal: es aquella de la cual quiero obtener datos
-- tabla ppal: empleados
select		e.*, s.suc_nombre
from		empleados e  left join sucursales s
on			e.suc_id = s.suc_id
where		s.suc_id is null;

-- Listar las sucursales q no tienen empleados
select		s.*
from		empleados e right join sucursales s
on			e.suc_id = s.suc_id
where		e.emp_id is null;
