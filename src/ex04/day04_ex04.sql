-- CREATE OR REPLACE VIEW v_symmetric_union AS (
-- (
--     SELECT person_id FROM person_visits
--     WHERE visit_date = '2022-01-02'
--     EXCEPT
--     SELECT person_id FROM person_visits
--     WHERE visit_date = '2022-01-06'
-- ORDER BY person_id
-- )
--
--     UNION
-- (
--     SELECT person_id FROM person_visits
--     WHERE visit_date = '2022-01-06'
--     EXCEPT
--     SELECT person_id FROM person_visits
--     WHERE visit_date = '2022-01-02'
-- ORDER BY person_id
-- )
--     );


CREATE OR REPLACE VIEW R_1 AS (
    SELECT person_id FROM person_visits
    WHERE visit_date = '2022-01-02'
    EXCEPT
    SELECT person_id FROM person_visits
    WHERE visit_date = '2022-01-06'
-- ORDER BY person_id
);

CREATE OR REPLACE VIEW S_1 AS (
                              SELECT person_id FROM person_visits
                              WHERE visit_date = '2022-01-06'
                              EXCEPT
                              SELECT person_id FROM person_visits
                              WHERE visit_date = '2022-01-02'
--                               ORDER BY person_id
                                  );

CREATE OR REPLACE VIEW v_symmetric_union AS (
                                            SELECT res.person_id
                                            FROM (
                                                     (SELECT * FROM R_1 EXCEPT SELECT * FROM S_1)
                                                     UNION
                                                     ( SELECT * FROM S_1 EXCEPT SELECT * FROM R_1)
                                                 ) AS res
     ORDER BY res.person_id
                                                );
