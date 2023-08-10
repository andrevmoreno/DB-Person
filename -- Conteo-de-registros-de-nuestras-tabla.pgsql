-- Conteo de registros de nuestras tablas
SELECT count(*) FROM invoices;
SELECT count(*) FROM invoice_items;

--Cross Join utilizando la clausula JOIN

SELECT *
from invoices, invoice_items;

-- CROSS JOIN utilizando la clausula JOIN
SELECT *
FROM invoice_items CROSS JOIN invoices;


-- NATURAL JOIN
-- Filtra la relación de la tabla A con la tabla B con el nombre del campo idéntico.
CREATE TABLE alpha (
    id INT NOT NULL,
    description VARCHAR(50) NOT NULL,
    CONSTRAINT alpha_id_pk PRIMARY KEY (id)
);

CREATE TABLE beta (
    id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    CONSTRAINT beta_id_fk FOREIGN KEY (id)
        REFERENCES alpha (id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE gama (
    id INT NOT NULL,
    description VARCHAR(50) NOT NULL,
    CONSTRAINT gama_id_pk PRIMARY KEY (id)
);

-- Poblado de información
INSERT INTO alpha VALUES (1, 'UNO'), (2, 'DOS'), (3, 'TRES'), (4, 'CUATRO');
INSERT INTO beta VALUES (1, 'ONE'), (2, 'TWO'), (3, 'THREE');
INSERT INTO gama VALUES (1, 'ONE'), (2, 'TWO'), (3, 'THREE');

SELECT * from alpha cross JOIN beta;
SELECT * from alpha natural JOIN beta;

SELECT * from alpha natural JOIN gama;


--INNER JOIN
SELECT * from persons;
SELECT * from invoices;


--Encabezado de factura

SELECT persons.id, persons.first_name, persons.last_name,
       persons.birthday, invoices.invoice_date,
       products.product_name, invoice_items.price,
       invoice_items.quantity,
       (invoice_items.price * invoice_items.quantity) AS total_price
FROM persons INNER JOIN invoices                
    ON persons.id = invoices.person_id
    INNER JOIN invoice_items
    ON invoices.id = invoice_items.invoice_id
    INNER JOIN products
    ON products.id = invoice_items.product_id;


--LEFT JOIN

--Mostrar todos nuestros usuarios así no hayan comprado.

SELECT first_name, last_name, invoice_date
FROM persons LEFT JOIN invoices
    ON persons.id = invoices.person_id;

    

--RIGHT JOIN


SELECT first_name, last_name, invoice_date
FROM invoices RIGHT JOIN persons
ON persons.id = invoices.person_id;

--FULL JOINS
INSERT INTO gama VALUES (5, 'fives'), (6, 'six');

SELECT * from alpha;
SELECT * from gama;

SELECT * 
FROM alpha FULL JOIN gama
ON alpha.id = gama.id;

