--Crear tabla de personas
--ID, primer nombre, apellido, edad, fecha nacimiento, disponible
CREATE TABLE persons(
    id UUID,
    first_name varchar(60),
    last_name varchar (60),
    age smallint,
    birthday Date,
    available bool

);
--Crea la tabla de trabajos
--ID, ID persona, fecha inicial, fecha final, ultimo.
Create table jobs(
    id uuid
    persons_id UUID,
    begins_at DATE,
    end_at Date,
    currently bool
);

--Borrar la edad de la tabla personas 
Alter table persons drop column age;

--Agrega el nombre del trabajo a la tabla de trabajos
ALTER TABLE jobs ADD COLUMN job_name varchar(50);

--Crear una tabla que vamos a borrar 
create table para_borrar (
    id serial,
    howto varchar (50)
);

--Borrar tabla innecesaria
Drop table personas;

Create table familia (
    id uuid DEFAULT gen_random_uuid() not null,
    first_name varchar(60) not null,
    last_name varchar(60) not null,
    created_at timestamp DEFAULT now() not null,
    updated_at timestamp,
 );

