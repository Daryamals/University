CREATE OR REPLACE VIEW discount AS
(
SELECT m1.price * 0.9 AS discount_price, m1.id, m1.pizza_name
FROM menu m1
    );
CREATE OR REPLACE VIEW v_price_with_discount AS
(
SELECT person.name, d.pizza_name, price, d.discount_price
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN discount d on d.id = person_order.menu_id
JOIN menu m on m.id = person_order.menu_id
ORDER BY person.name, d.pizza_name
);

--
-- SELECT * FROM v_price_with_discount;


