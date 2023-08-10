--README
-- Insercion de un dato que ya existe, no pasa nada
INSERT INTO public.estacion(id, nombre, direccion)
VALUES (1, 'Nombre', 'Dire')
ON CONFLICT DO NOTHING;

-- Insercion de un dato que ya existe, te cambia los campos de nombre y direccion
INSERT INTO public.estacion(id, nombre, direccion)
VALUES (1, 'Nombre', 'Dire')
ON CONFLICT (id) DO UPDATE SET nombre = 'Nombre', direccion = 'Dire';

-- Insertara una tupla y mostrara la tupla
INSERT INTO public.estacion(nombre, direccion)
VALUES ('RETU', 'RETDIRE')
RETURNING *;

-- %: Uno o cualquier valor
-- _: Un valor
SELECT nombre FROM public.pasajero
WHERE nombre LIKE 'o%';
-- buscamos sin importar mayusculas o minusculas
SELECT nombre FROM public.pasajero
WHERE nombre ILIKE 'o%';

-- si una estacion o tren tiene un valor nulo
SELECT * FROM public.tren
WHERE modelo IS NULL;


SELECT id, nombre, direccion_residencia, fecha_nacimiento,
CASE 
WHEN fecha_nacimiento > '2015-01-01'THEN
'Niño'
ELSE 
'Mayor'
END
	FROM public.pasajero;


--Extensiones

CREATE EXTENSION fuzzystrmatch;
SELECT levenshtein('oswaldo', 'osvaldo');

SELECT difference ('beard', 'bird');