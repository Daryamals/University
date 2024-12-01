INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT DISTINCT pizzeria.id
         FROM pizzeria
                  INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
                  JOIN mv_dmitriy_visits_and_eats mv ON mv.name != pizzeria.name
         WHERE menu.price < 800 and pizzeria.name != 'Papa Johns'
         LIMIT 1),
        '2022-01-08');
--------------------------------------
-- DELETE FROM person_visits WHERE pizzeria_id = '3';

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
