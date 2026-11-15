-- Практическая работа 4. Проектирование и разработка баз и хранилищ данных

-- 1. Код запроса
SELECT * FROM sports_cars limit 5;

-- 2. Код запроса
SELECT "brand","model","year_" FROM sports_cars offset 1 limit 5;

-- 3. Код запроса
SELECT * FROM sports_cars
ORDER BY "top_speed" ASC;

-- 4. Код запроса
SELECT * FROM sports_cars where "top_speed" is not null
ORDER BY "top_speed" desc limit 20;

-- 5. Код запроса
SELECT "brand", COUNT(*) AS brand_count
FROM sports_cars where "brand" is not null
GROUP BY "brand";

-- 6. Код запроса
SELECT DISTINCT "model"
FROM sports_cars;

-- 7. Код запроса
SELECT *
FROM sports_cars
WHERE "fuel_type" = 'Electric';

-- 8. Код запроса
update sports_cars set "modification" = '' where "modification" is null;

-- 9. Код запроса
SELECT "model" AS count_per_model
FROM sports_cars
WHERE "brand" = 'Ferrari'
GROUP BY "model";
