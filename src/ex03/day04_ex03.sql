SELECT DISTINCT generated_date as missing_date
    FROM person_visits
   RIGHT JOIN v_generated_dates v ON person_visits.visit_date = v.generated_date
    WHERE person_visits.visit_date IS NULL
ORDER BY missing_date;
