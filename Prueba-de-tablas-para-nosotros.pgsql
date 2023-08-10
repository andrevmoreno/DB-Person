Create table usuario (
    id uuid DEFAULT gen_random_uuid() not null,
    first_name varchar(60) not null,
    last_name varchar(60) not null,
    email varchar(60) not null,
    birthday Date,
    password varchar(60) not null,
    available bool
 );

 insert into usuario
 values (default,'Andrea','Moreno','andreavalentinamoreno158@gmail.com','1996-08-15', 'xxxxxxxx',TRUE);


 insert into usuario
 values (default,'Robert','Garcia','rbert.g.ch@gmail.com','1995-10-27', 'yyyyyyyy',TRUE);


 
 Create table Bancos (
    id uuid
    usuario_id UUID,
    account varchar(200),
    bank varchar(60) not null,
    cell varchar(60) not null,
    currently bool
 );
