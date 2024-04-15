CREATE OR REPLACE FUNCTION plane_in_trip_insert_trigger_fnc()
  RETURNS trigger AS
$$
DECLARE
time_of_flight interval;
BEGIN

time_of_flight = (select time_to_dttm - time_from_dttm
                    from project.trips
                    where trip_no = NEW.trip_no);

update project.planes
set time_on_the_wing_hour = time_on_the_wing_hour + EXTRACT(hour from time_of_flight)
where plane_id = NEW.plane_id;

update project.pilots
set time_in_the_air_hour = time_in_the_air_hour + EXTRACT(hour from time_of_flight),
number_of_flights_cnt = number_of_flights_cnt + 1
where pilot_id = (select pilot_in_command_id
                    from project.air_staff
                    where staff_id = NEW.air_staff_id)

or pilot_id = (select relief_pilot_id
                    from project.air_staff
                    where staff_id = NEW.air_staff_id);

RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE TRIGGER plane_in_trip_insert_trigger
  AFTER INSERT
  ON project.plane_in_trip
  FOR EACH ROW
  EXECUTE PROCEDURE plane_in_trip_insert_trigger_fnc();



CREATE OR REPLACE FUNCTION log_pilot()
RETURNS trigger AS
$$
BEGIN

insert into project.pilots_history(pilot_id, time_in_the_air_hour, count_flights_of_pilot, history_dttm) VALUES
(OLD.pilot_id, OLD.time_in_the_air_hour, OLD.count_flights_of_pilot, current_timestamp);

RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';


CREATE OR REPLACE TRIGGER plane_in_trip_insert_trigger
  BEFORE UPDATE
  ON project.pilots
  FOR EACH ROW
  EXECUTE PROCEDURE log_pilot();



