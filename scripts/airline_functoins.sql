CREATE OR REPLACE FUNCTION count_planes_of_model(model_name TEXT)
    RETURNS integer

AS $$
BEGIN
    
	if  model_name not in (select model_nm from project.models) 
		then
		raise exception 'plane model with name % is absent in database!', model_name
		using errcode = '04000';

	end if;
	
    RETURN (select count(*)
                from project.planes
                where model_id = (select model_id
                                    from project.models
                                    where model_nm = model_name));
END;
$$ 

LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION count_flights_of_pilot(pilot_name TEXT)
    RETURNS integer

AS $$
DECLARE
    pil_id integer;
BEGIN
    
	if  pilot_name not in (select pilot_nm from project.pilots) 
		then
		raise exception 'pilot with name % is absent in database!', pilot_name
		using errcode = '05000';

	end if;
	
	pil_id = (select pilot_id 
                        from project.pilots
                        where pilot_nm = pilot_name);
	
    RETURN (select count(*)
                from project.plane_in_trip
                where air_staff_id in (select distinct staff_id
                                    from project.air_staff
                                    where pilot_in_command_id = pil_id
                                    or relief_pilot_id = pil_id));
END;
$$

LANGUAGE 'plpgsql';

