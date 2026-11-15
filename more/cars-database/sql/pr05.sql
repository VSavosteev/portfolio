-- Практическая работа 5. Проектирование и разработка баз и хранилищ данных

-- 1. Код запроса
SELECT
    "brand",
    "number_of_owners",
    COUNT(*) AS brand_count,
    AVG("price") AS average_price
FROM sports_cars
WHERE "number_of_owners" &lt;= 3
GROUP BY "brand", "number_of_owners";

-- 2. Код запроса
SELECT
    "safety_rating",
    AVG("price") AS average_price,
    VAR_SAMP("price") AS price_variance
FROM sports_cars
where "safety_rating" is not null
GROUP BY "safety_rating";

-- 3. Код запроса
SELECT
    "production_units",
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY "price")
AS median_price
FROM sports_cars
GROUP BY "production_units";

-- 4. Код запроса
SELECT
    "transmission",
    AVG("mileage") AS average_mileage,
    VAR_SAMP("mileage") AS screen_mileage
from sports_cars
WHERE "transmission" is not null
GROUP BY "transmission";

-- 5. Код запроса
SELECT
    "year_",
    COUNT(*) AS year_count,
    AVG("price") AS average_price
FROM sports_cars
GROUP BY "year_";

-- 6. Код запроса
SELECT
    "brand",
    MAX("horsepower") as max_horsepower,
    MIN("horsepower") as min_horsepower
FROM sports_cars
where "brand" is not NULL
GROUP BY "brand";
