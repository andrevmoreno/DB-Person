-- AGRUPACIONES

-- Creamos unas tablas para el ejercicio de agrupaciones

-- Productos
CREATE TABLE products (
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    product_name VARCHAR(30) NOT NULL,
    price NUMERIC (10,2) NOT NULL,
    CONSTRAINT products_id_pk PRIMARY KEY (id),
    CONSTRAINT products_product_name_uk UNIQUE (product_name)
);

-- Encabezado de facturación
CREATE TABLE invoices (
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    invoice_date DATE DEFAULT NOW() NOT NULL,
    person_id UUID NOT NULL,
    CONSTRAINT invoices_id_pk PRIMARY KEY (id),
    CONSTRAINT invoices_person_id_fk FOREIGN KEY (person_id)
        REFERENCES persons (id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- Detalle de facturación
CREATE TABLE invoice_items (
    id UUID DEFAULT gen_random_uuid() NOT NULL ,
    invoice_id UUID NOT NULL,
    product_id UUID NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    quantity INT DEFAULT 1 NOT NULL,
    CONSTRAINT invoice_items_id_pk PRIMARY KEY (id),
    CONSTRAINT invoice_items_invoice_id_fk FOREIGN KEY (invoice_id)
        REFERENCES invoices (id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT invoice_items_product_id_fk FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

99ab6d5c-17d4-4520-b7c9-e6963e7429a3
-- INSERTAMOS DATOS EN PRODUCTOS
INSERT INTO products
VALUES (DEFAULT, 'ARROZ', 12.31),
       (DEFAULT, 'PAPA', 1.44),
       (DEFAULT, 'CARNE', 20);

-- INSERTAMOS DATOS EN FACTURACIÓN
INSERT INTO invoices (person_id) VALUES ('132cf129-57c5-41a8-af9a-59e39e90fc18') RETURNING id, invoice_date;
INSERT INTO invoice_items
VALUES (DEFAULT, '417a6517-d175-4f37-9e96-91a55d42f33f', 'a80f29ac-1f2f-4d6a-8efa-39bd3a1c5df5', 14.11, 2),
       (DEFAULT, '417a6517-d175-4f37-9e96-91a55d42f33f', 'a90dae91-90fa-4548-8807-bdb3140ddfec', 1.44, 1),
       (DEFAULT, '417a6517-d175-4f37-9e96-91a55d42f33f', '9b5803bb-b497-4751-981e-9168f47b1f03', 21, 3);

INSERT INTO invoices (person_id) VALUES ('132cf129-57c5-41a8-af9a-59e39e90fc18') RETURNING id;
INSERT INTO invoice_items
VALUES (DEFAULT, '7969a244-ff37-4f28-9938-0bb110b56fb3', 'a80f29ac-1f2f-4d6a-8efa-39bd3a1c5df5', 1.44, 3),
       (DEFAULT, '7969a244-ff37-4f28-9938-0bb110b56fb3', '9b5803bb-b497-4751-981e-9168f47b1f03', 21, 12);

INSERT INTO invoices (person_id) VALUES ('2af2d62c-b318-437e-8a44-4a64e903fa6f') RETURNING id;
INSERT INTO invoice_items
VALUES (DEFAULT, '1db4121d-b6fa-4417-b719-408bede9d0cf', 'a80f29ac-1f2f-4d6a-8efa-39bd3a1c5df5', 14.11, 1),
       (DEFAULT, '1db4121d-b6fa-4417-b719-408bede9d0cf', 'a80f29ac-1f2f-4d6a-8efa-39bd3a1c5df5', 1.44, 5);

INSERT INTO invoices (person_id) VALUES ('d2498dce-5625-4363-a418-0e1fe87bc7cb') RETURNING id;
INSERT INTO invoice_items
VALUES (DEFAULT, 'a85f85ac-4e86-4ad9-8d2f-69304e37677b', 'a90dae91-90fa-4548-8807-bdb3140ddfec', 2, 5);

INSERT INTO invoices (person_id) VALUES ('baa6302f-564f-4841-bd26-b5a466211584') RETURNING id;
INSERT INTO invoice_items
VALUES (DEFAULT, '51c9353f-1b48-4cc4-b573-26e884dd1110', 'a80f29ac-1f2f-4d6a-8efa-39bd3a1c5df5', 14.11, 1),
       (DEFAULT, '51c9353f-1b48-4cc4-b573-26e884dd1110', 'a80f29ac-1f2f-4d6a-8efa-39bd3a1c5df5', 1.44, 12);



-- CONSULTA DE AGRUPACIONES

 SELECT distinct first_name, last_name from persons;       

 -- 2 GROUP BY
-- Debe contener los campos proyectados a excepción de las funciones

SELECT last_name
from persons
group by last_name;


SELECT first_name, last_name
from persons
GROUP by first_name, last_name;

-- Consultando información con funciones
SELECT first_name, count(*) as cantidad
from persons
group by first_name;

SELECT count(*)
FROM persons;

SELECT first_name, count(updated_at) as cantidad
from persons
group by first_name;


-- Preguntas que resolvemos con SQL:

-- Cuánto es el total de venta de la primer factura?

SELECT * from invoices;

SELECT * FROM invoice_items WHERE invoice_id = '2561978a-2d3a-468a-8a28-b9ae6172c9d9';

SELECT price * quantity
from invoice_items
where invoice_id = '417a6517-d175-4f37-9e96-91a55d42f33f';

select sum(price * quantity)
from invoice_items
where invoice_id = '417a6517-d175-4f37-9e96-91a55d42f33f';

--resultado: 92.66

-- Cuánto es el total de venta de todas las facturas, agrupado por factura?

select invoice_id, sum(price * quantity)
FROM invoice_items
GROUP BY invoice_id
ORDER BY invoice_id;

--Cuanto ha comprado en total el cliente Alexys Lozada? 
select sum (price * quantity)
from invoice_items
WHERE invoice_id in (SELECT id from invoices where person_id = '132cf129-57c5-41a8-af9a-59e39e90fc18');

--respuesta: 348.98

--Cuanto ha comprado en total el cliente Carlos Luis? 
select sum (price * quantity)
from invoice_items
WHERE invoice_id in (SELECT id from invoices where person_id = 'baa6302f-564f-4841-bd26-b5a466211584');

--respuesta: 31.39

-- Cuál producto se ha vendido más/menos en cantidad?
SELECT product_id,count(*) as registro, sum (price * quantity) valor_venta, sum(quantity) cantidad
from invoice_items
GROUP by product_id
ORDER by 4;

--HAVING
--Es como la clasula WHERE pero por grupos de registros: 

--Cual cliente ha hecho mas compras? Teniendo en cuenta que contamos una factura como una compra.

SELECT * FROM invoices;

select person_id, count(*) as cantidad
From invoices 
GROUP by person_id
having count(*) >= 2;

select person_id, count(*) as cantidad
From invoices 
GROUP by person_id
having count(*) >= 1;

-- LIMIT Y OFFSET
-- Permite limitar la cantidad de registros devueltos. Sirve para paginar las consultas.

SELECT * from invoice_items order by id;

--Mostrar los primeros tres products

SELECT * from invoice_items order by id limit 3;


SELECT * from invoice_items order by id limit 3 OFFSET 0; --pag 1
SELECT * from invoice_items order by id limit 3 OFFSET 3; --pag 2
SELECT * from invoice_items order by id limit 3 OFFSET 6; --pag 3
SELECT * from invoice_items order by id limit 3 OFFSET 8; --pag 4

-- REGISTROS A LIMITAR, PÁGINA ?

-- Paginación
-- offset := página * límite - límite
-- offset := 1 * 5 - 5 = 0
-- offset := 2 * 5 - 5 = 5
-- offset := 3 * 5 - 5 = 10
