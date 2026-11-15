-- Практическая работа 7. Проектирование и разработка баз и хранилищ данных

-- 1. Код создания представления
CREATE VIEW "most_expensive_50_cars" AS
SELECT
	s.id,
	b.brand,
	b.model,
	s.modification,
	b.country,
	e.horsepower,
	c.top_speed,
	c.acceleration_0_100,
	f.fuel_type,
	c.weight,
	s.price
FROM sports_car s
JOIN engine e ON e.id=s.id_engine
JOIN fuel f ON f.id=e.id_fuel
JOIN brand_model b ON b.id=s.id_brand_model
JOIN characteristics_ c ON c.id=s.id_characteristics_
ORDER BY s.price DESC
LIMIT 50

-- 2. Код выборки данных из представления
SELECT * FROM "most_expensive_50_cars"

-- 3. Запрос с использованием CTE
WITH cte_filtered AS (
	SELECT b.brand as brand_name,
		   s.price
	FROM sports_car s
	JOIN brand_model b ON b.id=s.id_brand_model
	ORDER BY price desc)
SELECT brand_name, SUM(price) AS total_price,
	   COUNT(price) AS total_cars,
	   ROUND(AVG(price), 2) AS average_price,
	   PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price) AS median_price value
	   MAX(price) as max_price,
	   MIN(price) as min_price
FROM cte_filtered
GROUP BY brand_name
ORDER BY total_price DESC
