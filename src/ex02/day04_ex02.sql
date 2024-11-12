CREATE OR REPLACE VIEW v_generated_dates AS
SELECT generate_series::DATE as generated_date
FROM  generate_series('2022-01-01'::date, '2022-01-31'::date, interval '1 day')
ORDER BY generated_date;

