update persons
set first_name = 'Jenny', last_name = 'Gonzalez'
where id ='fdd74a37-32d5-48c5-9144-bd24ac76c4f5';

update persons
set available = false;

delete from persons where id is null;

TRUNCATE table persons;


drop table if EXISTS persons;
drop table if exists jobs;
drop table if exists personas;


--Crear la tabla personas 

Create table persons (
    id uuid DEFAULT gen_random_uuid() not null,
    first_name varchar(60) not null,
    last_name varchar(60) not null,
    birthday date not null,
    created_at timestamp DEFAULT now() not null,
    updated_at timestamp,
    CONSTRAINT persons_id_pk primary key(id),
    CONSTRAINT persons_first_name_uk unique (first_name, last_name)
 );


 insert into persons
 values (default,'Alexys','Lozada',now(),DEFAULT,null);

 
 insert into persons
 values (default,'Alexys','Montes',now(),DEFAULT,null);

 insert into persons
 values (default,'Patricia','Montes',now(),DEFAULT,null);

 insert into persons
 values (default,'Carlos','Luis',now(),DEFAULT,null);


drop table if exists jobs;

Create table jobs (
    id uuid DEFAULT gen_random_uuid() not null,
    persons_id uuid not null,
    job_name varchar(50) not null,
    created_at timestamp DEFAULT now() not null,
    updated_at timestamp,
    CONSTRAINT jobs_id_pk primary key(id),
    constraint jobs_persons_id_fk FOREIGN key (persons_id)
        REFERENCES persons(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
 );


 --Inserta datos en los empleos
 insert into jobs
 values (default, '132cf129-57c5-41a8-af9a-59e39e90fc18','designer',DEFAULT,DEFAULT);

  insert into jobs
 values (default, 'abccf129-57c5-41a8-af9a-59e39e90fc18','designer',DEFAULT,DEFAULT);

 --Intento de borrado de informacion de pg_get_wal_resource_managers
 delete from persons
 where id = '132cf129-57c5-41a8-af9a-59e39e90fc18';