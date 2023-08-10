--insertar date_sortsupport
--1. Insert into tabla (campo1,..., campoN) Values(valor1,..., valorN);
Insert into persons (id,first_name, last_name, birthday, available)
Values (gen_random_uuid(), 'Andrea','Moreno','1996-08-15',true);

--2. Insert into tabla Values (valor1, valor2,..., valorN)
insert into persons
values (gen_random_uuid(), 'Andrea','Moreno','1996-08-15',true);

--Insert into tabla Values (default, valorM, valor,M,...., valorz);
insert into persons
values (default,'Andrea',default, default, true);

--Valores por defecto

create table students (
    id UUID Default gen_random_uuid(),
    first_name varchar(50),
    is_active BOOL default true,
    created_at timestamp default now() 
);

insert into students
values (default,'Pedro',DEFAULT, DEFAULT);

insert into students (first_name)
Values ('Juan');

--Inser into tablaValues (valorA1,....,ValorAn), (ValorB1, ...., valorBN);

insert into students
values
(default,'Dani',DEFAULT, DEFAULT),
(default,'Mari',DEFAULT, DEFAULT),
(default,'Guille',DEFAULT, DEFAULT),
(default,'Robert',DEFAULT, DEFAULT);


insert into students (first_name, created_at)
VALUES
('Robert','2023-01-02'),
('Paula', '2021-06-01');


create table tmp_students (
    f_name VARCHAR(50),

active BOOL
);

INSERT INTO tmp_students

VALUES

('Primero', true),

('Segundo', false),

('Tercero', true),

('Cuarto', true);

--Insert into tabla SELECT your-query;
insert into students(first_name, is_active)
select f_name, active
from tmp_students; 

--Datos nulos.

drop table studentss;
insert into students VALUES(null,null,null,null);

create table studentx (
    id UUID Default gen_random_uuid() not null,
    first_name varchar(50) not null,
    is_active BOOL not null,
    created_at timestamp default now() not null, 
    UPDATE_at timestamp
);

insert into studentx
values (default,'Pedro',true, DEFAULT, DEFAULT);