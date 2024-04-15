CREATE SCHEMA project;

CREATE TABLE project.passengers (

    pass_id integer NOT NULL PRIMARY KEY,
    pass_nm varchar NOT NULL,
    birthday_dt date NOT NULL,
    email varchar NOT NULL,
    password varchar NOT NULL
);

CREATE TABLE project.airports (

    airport_id integer NOT NULL PRIMARY KEY,
    airport_nm varchar NOT NULL,
    city varchar NOT NULL
);

CREATE TABLE project.trips (

    trip_no integer NOT NULL PRIMARY KEY,
    time_from_dttm timestamp with time zone NOT NULL,
    time_to_dttm timestamp with time zone NOT NULL,
    airport_from_id integer,
    airport_to_id integer,

        FOREIGN KEY (airport_from_id) REFERENCES project.airports(airport_id),
        FOREIGN KEY (airport_to_id) REFERENCES project.airports(airport_id)
);

CREATE TABLE project.pass_in_trip (

    pass_id integer,
    trip_no integer,
    class_code varchar NOT NULL CHECK (class_code IN ('coach', 'business')),
    place_code varchar NOT NULL CHECK (place_code like '___' ),

        FOREIGN KEY (pass_id) REFERENCES project.passengers(pass_id),
        FOREIGN KEY (trip_no) REFERENCES project.trips(trip_no)
);

CREATE TABLE project.models (

    model_id integer PRIMARY KEY,
    model_nm varchar NOT NULL UNIQUE,
    transit_range_mile integer NOT NULL,
    maintenance_cost integer NOT NULL
);

CREATE TABLE project.planes (

    plane_id integer PRIMARY KEY,
    plane_series integer NOT NULL UNIQUE,
    age_year integer NOT NULL,
    time_on_the_wing_hour integer NOT NULL,
    model_id integer,

        FOREIGN KEY (model_id) REFERENCES project.models(model_id)
);

CREATE TABLE project.pilots (

    pilot_id integer PRIMARY KEY,
    pilot_nm varchar NOT NULL,
    birthday_dt date NOT NULL,
    time_in_the_air_hour integer NOT NULL,
    number_of_flights_cnt integer NOT NULL,
    email varchar NOT NULL,
    password varchar NOT NULL
);

CREATE TABLE project.air_staff (

    staff_id integer PRIMARY KEY,
    pilot_in_command_id integer,
    relief_pilot_id integer,

        FOREIGN KEY (pilot_in_command_id) REFERENCES project.pilots(pilot_id),
        FOREIGN KEY (relief_pilot_id) REFERENCES project.pilots(pilot_id)
);

CREATE TABLE project.pilots_history (

    pilot_id integer,
    time_in_the_air_hour integer NOT NULL,
    number_of_flights_cnt integer NOT NULL,
    history_dttm timestamp,

        FOREIGN KEY (pilot_id) REFERENCES project.pilots(pilot_id)
);

CREATE TABLE project.plane_in_trip (

    plane_id integer,
    trip_no integer UNIQUE,
    air_staff_id integer,

        FOREIGN KEY (plane_id) REFERENCES project.planes(plane_id),
        FOREIGN KEY (trip_no) REFERENCES project.trips(trip_no),
        FOREIGN KEY (air_staff_id) REFERENCES project.air_staff(staff_id)
);