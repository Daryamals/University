CREATE OR REPLACE VIEW v_persons_male AS
SELECT * FROM person
WHERE person.gender = 'male';

CREATE OR REPLACE VIEW v_persons_female AS
SELECT * FROM person
WHERE person.gender = 'female';
