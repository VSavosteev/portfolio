-- Практическая работа 8. Проектирование и разработка баз и хранилищ данных

-- 1. Код добавления колонки
alter table brand_model
add column "total_cars" int default 0;

-- 2. Код функции
create or replace function update_cars_count()
returns trigger as
$$
begin
	update brand_model
	   set total_cars = total_cars + 1
	   where id = new.id_brand_model;
    return new;
end;
$$ language plpgsql;

-- 3. Код триггера
create trigger tr_update_cars_count
after insert
on sports_car
for each row
execute procedure update_cars_count();

-- 4. Код функции
create or replace function recalc_cars_count()
returns void
language plpgsql
as $$
begin
	update brand_model
	set total_cars = coalesce((
	    select count (sports_car.id) from sports_car
	    where sports_car.id_brand_model = brand_model.id
	),0);
end;
$$;
SELECT recalc_cars_count();

-- 5. Код скрипта
with cte_brand_model as(
    insert into brand_model (brand,model,year_,country)
    values ('Lotus', 'Evija',2019,'Europe')
    returning id as id_brand_model
    ),
cte_characteristics_ as(
    insert into characteristics_ (weight,top_speed,acceleration_0_100)
    values (1887,239,3)
    returning id as id_characteristics_
    ),
cte_engine as(
    insert into engine (engine_size,horsepower,torque,id_fuel)
    values (7,2011,1704,29)
    returning id as id_engine
    )
insert into sports_car (id_brand_model,condition_,id_engine,id_characteristics_,drivetrain,transmission,price,
	mileage,popularity,safety_rating,number_of_owners,
	market_demand,insurance_cost,production_units,id)
select cte_brand_model.id,'new',cte_engine.id,cte_characteristics_.id, 'FWD', 'CVT','999999','20000','Low','4','1','Low','10000','130','5001'
from cte_brand_model,cte_engine,cte_characteristics_
returning *;
