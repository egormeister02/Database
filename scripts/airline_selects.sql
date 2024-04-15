select plane_series, age_year, model_nm model_name, maintenance_cost maintenance_plane,
sum(maintenance_cost) over (partition by model_id rows between unbounded preceding and unbounded following) maintenance_model,
sum(maintenance_cost) over (rows between unbounded preceding and unbounded following) maintenance_total,
from project.planes join project.models using(model_id)
order by maintenance_cost desc;

select pilot_nm name, time_in_the_air_hour time_in_the_air, dense_rank() over (order by time_in_the_air_hour desc) rank
from project.pilots
order by rank;

select a1.city city_from,  a2.city city_to, avg(t.time_to_dttm - t.time_from_dttm) avg_duration
from project.trips t 
join project.airports a1 on t.airport_from_id = a1.airport_id
join project.airports a2 on t.airport_to_id = a2.airport_id
group by city_from, city_to
having sum(t.time_to_dttm - t.time_from_dttm)/count(*) > '03:00:00'::interval
order by avg_duration desc;

select plane_series, age_year age, first_value(plane_series) over w oldest_plane_series, last_value(plane_series) over w youngest_plane_series
from project.planes
window w as(
    order by age_year desc rows between unbounded preceding and unbounded following
)
order by age_year desc;

select pilot_nm name, time_in_the_air_hour time_in_the_air, first_value(pilot_nm) over w most_experienced, last_value(pilot_nm) over w new_bie
from project.pilots
window w as(
    order by time_in_the_air_hour desc rows between unbounded preceding and unbounded following
)
order by time_in_the_air_hour desc;

select pilot_nm name, age(birthday_dt) age, first_value(pilot_nm) over w oldest, last_value(pilot_nm) over w youngest
from project.pilots
window w as(
    order by age(birthday_dt) desc rows between unbounded preceding and unbounded following
)
order by age(birthday_dt) desc;

