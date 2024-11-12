CREATE materialized view mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name
    FROM person_visits p
    JOIN pizzeria on p.pizzeria_id = pizzeria.id
    JOIN person on p.person_id = person.id
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    WHERE person.name = 'Dmitriy' and menu.price < 800 and visit_date = '2022-01-08';

SELECT * FROM mv_dmitriy_visits_and_eats
