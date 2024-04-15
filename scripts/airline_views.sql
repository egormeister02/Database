create or replace view passengers_no_password(pass_id, pass_nm, birthday_dt, email, password) as 
(
    select pass_id, pass_nm, birthday_dt, email, '********'
    from project.passengers
);


create or replace view pilots_no_password(pilot_id, pilot_nm, birthday_dt, time_in_the_air_hour, number_of_flights_cnt, email, password) as 
(
    select pilot_id, pilot_nm, birthday_dt, time_in_the_air_hour, number_of_flights_cnt, email, '********'
    from project.pilots
);

create or replace view plane_info(plane_id, plane_series, age_year, time_on_the_wing_hour, model_id, model_nm, transit_range_mile, maintenance_cost) as
(
    select plane_id, plane_series, age_year, time_on_the_wing_hour, p.model_id, model_nm, transit_range_mile, maintenance_cost
    from project.planes p join project.models using(model_id)
);

create or replace view air_staff_flights(staff_id, count_of_flights) as
(
    select a.staff_id, count(*)
    from project.air_staff a join project.plane_in_trip on staff_id = air_staff_id
    group by staff_id
);

create or replace view air_staff_with_names(staff_id, pilot_in_command_nm, relief_pilot_nm) as
(
    select staff_id, p1.pilot_nm, p2.pilot_nm
    from project.air_staff 
    join project.pilots p1 on pilot_in_command_id = p1.pilot_id
    join project.pilots p2 on relief_pilot_id = p2.pilot_id
);

create or replace view trips_from_to_city(trip_no, city_from, city_to) as
(
    select trip_no, a1.city, a2.city
    from project.trips
    join project.airports a1 on airport_from_id = a1.airport_id
    join project.airports a2 on airport_to_id = a2.airport_id
);