SELECT 'Hola mundo';
SELECT 8;


SELECT 2*2+2/2;


--Cast
SELECT 8::numeric/23::numeric;


--Cast no Valido
SELECT 'Hola'::int;

SELECT '2023-01-02'::date


--Funciones
SELECT now();
SELECT upper ('Hola mundo');

SELECT* from students;
SELECT id, first_name, is_active
from students;


select id, upper(first_name), (2+4):: numeric/3:: numeric AS expresion,
'Estudiante' as tipo_persona
FROM students;

select * from persons Where 
Select * from persons where upper(first_name) = 'Alexys';

Select * from persons where upper(first_name) > 'Alexys';
Select * from persons where upper(first_name) <> 'Alexys';

--And / or

SELECT* from persons WHERE(first_name) = 'Alexys' and last_name <> '';
SELECT* from persons WHERE(first_name) = 'Alexys' or first_name = 'Daniel';

--Like varios caracteres

SELECT * from persons where upper(first_name) like 'Alex_s';

SELECT * from persons where upper(first_name) like 'Alex%';

--ILIKE
SELECT * from persons where first_name ilike 'ale%';


--BETWEEN
SELECT * from persons where birthday between '1996-08-15' and '2023-01-03';

--In Valores

SELECT *
from jobs
where persons_id in (select id from persons);

SELECT * from persons
where id in (SELECT persons_id from jobs);

--IS NULL

SELECT* from persons WHERE updated_at is not null

SELECT* from persons
WHERE id not in (SELECT persons_id from jobs);

--Order by numero del campo

SELECT *
from persons
order by 2 DESC, 5 DESC; 


SELECT *
from persons
order by last_name DESC; 