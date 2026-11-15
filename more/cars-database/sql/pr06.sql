-- Практическая работа 6. Проектирование и разработка баз и хранилищ данных

-- 1. Заполнение таблицы «brand_model»
INSERT INTO brand_model(brand, model, year_, country)
SELECT DISTINCT brand, model, year_, country
FROM sports_cars

-- 2. Заполнение таблицы «characteristics_»
INSERT INTO characteristics_(weight, top_speed, acceleration_0_100)
SELECT DISTINCT weight, top_speed, acceleration_0_100
FROM sports_cars

-- 3. Заполнение таблицы «fuel»
INSERT INTO fuel(fuel_type, fuel_efficiency, co2_emissions)
SELECT DISTINCT fuel_type, fuel_efficiency, co2_emissions
FROM sports_cars

-- 4. Заполнение таблицы «engine»
INSERT INTO engine(engine_size, horsepower, torque, fuel_type, fuel_efficiency, co2_emissions)
SELECT DISTINCT engine_size, horsepower, torque, fuel_type, fuel_efficiency, co2_emissions
FROM sports_cars

-- 5. Заполнение таблицы «engine»
update engine e set id_fuel=f.id
from fuel f
where f.fuel_type=e.fuel_type and f.fuel_efficiency=e.fuel_efficiency and f.co2_emissions=e.co2_emissions

-- 6. Заполнение таблицы «sports_car»
INSERT INTO sports_car (condition_, drivetrain, transmission, price, mileage, popularity, safety_rating, number_of_owners, market_demand, insurance_cost, production_units, modification)
SELECT DISTINCT condition_, drivetrain, transmission, price, mileage, popularity, safety_rating, number_of_owners, market_demand, insurance_cost, production_units, modification
FROM sports_cars

-- 7. Заполнение таблицы «sports_car»
update sports_car s set id_brand_model=b.id
from brand_model b
where b.brand=s.brand and b.model=s.model and b.year_=s.year_ and b.country=s.country

-- 8. Заполнение таблицы «sports_car»
update sports_car s set id_characteristics_=c.id
from characteristics_ c
where c.weight=s.weight and c.top_speed=s.top_speed and c.acceleration_0_100=s.acceleration_0_100

-- 9. Заполнение таблицы «sports_car»
update sports_car s set id_engine=e.id
from engine e
where e.engine_size=s.engine_size and e.horsepower=s.horsepower and e.torque=s.torque and e.fuel_type=s.fuel_type and e.fuel_efficiency=s.fuel_efficiency and e.co2_emissions=s.co2_emissions
