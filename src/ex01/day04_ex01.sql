    SELECT DISTINCT person.name
    FROM person
    JOIN v_persons_female v ON v.gender = person.gender
UNION
    SELECT DISTINCT person.name
    FROM person
    JOIN v_persons_male v1 ON v1.gender = person.gender
ORDER BY name;
