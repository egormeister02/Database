INSERT INTO project.pilots (pilot_id, pilot_nm, birthday_dt, time_in_the_air_hour, number_of_flights_cnt, email, password) VALUES
(0, 'Ryan Gosling', '1980-11-12', 2454, 482, 'vasy@email.com', '123abc456'),
(1, 'Vasy Zelepukin', '1978-07-16', 1454, 335, 'vasy@email.com', '123abc456'),
(2, 'Arnold Schwarzenegger', '1947-07-30', 9999, 1200, 'vasy@email.com', '123abc456'),
(3, 'Artem Onuchin', '2002-01-01', 0, 0, 'vasy@email.com', '123abc456'),
(4, 'Ahmed Dogan', '1976-05-08', 563, 148, 'vasy@email.com', '123abc456'),
(5, 'Sasha Grey', '1988-03-14', 265, 87, 'vasy@email.com', '123abc456'),
(6, 'Dominic Toretto', '1973-01-14', 384, 296, 'vasy@email.com', '123abc456'),
(7, 'Maksim Galkin', '1976-06-18', 284, 84, 'vasy@email.com', '123abc456'),
(8, 'Aleksey Panin', '1977-09-10', 357, 184, 'vasy@email.com', '123abc456');

INSERT INTO project.air_staff (staff_id, pilot_in_command_id, relief_pilot_id) VALUES
(0, 2, 0),
(1, 4, 1),
(2, 5, 3),
(3, 6, 7),
(4, 8, 3),
(5, 6, 4),
(6, 0, 7),
(7, 2, 5);

INSERT INTO project.airports (airport_id, airport_nm, city) VALUES
(0, 'Sheremetyevo', 'Moscow'),
(1, 'Domodedovo', 'Moscow'),
(2, 'Pulkovo', 'Leningrad'),
(3, 'Gazipasa', 'Alanya'),
(4, 'Zhulyany', 'Kiev'),
(5, 'Ben-Gurion', 'Tel-Aviv'),
(6, 'Helsinki Airport', 'Helsinki'),
(7, 'Rodos Airport', 'Rodos'),
(8, 'Larnaca Airport', 'Larnaca'),
(9, 'Lappeenranta Airport', 'Lappeenranta');

INSERT INTO project.models (model_id, model_nm, transit_range_mile, maintenance_cost) VALUES
(0, 'Airbus A320', 6000, 3200),
(1, 'Boeing 747-400', 9000, 5400),
(2, 'Ан-225', 9000, 4800),
(3, 'Ту-154Б-2', 8000, 4700),
(4, 'Boeing 747-800', 8500, 5200),
(5, 'Ил-14', 7200, 3600),
(6, 'Ан-124', 9000, 4900),
(7, 'Ту-134A', 8800, 8200),
(8, 'Airbus A350', 8500, 4500),
(9, 'Ил-62М', 8000, 5000);

INSERT INTO project.planes (plane_id, plane_series, age_year, time_on_the_wing_hour, model_id) VALUES
(0, 32453, 4, 2412, 0),
(1, 07863, 6, 3843, 1),
(2, 98335, 2, 1121, 7),
(3, 73954, 5, 3274, 3),
(4, 73049, 3, 1823, 4),
(5, 13434, 7, 4039, 2),
(6, 68493, 1, 593, 9),
(7, 83983, 4, 2343, 3),
(8, 68922, 5, 3184, 5),
(9, 73297, 4, 2273, 0),
(10, 34332, 6, 3974, 1),
(11, 54892, 2, 1289, 5);

INSERT INTO project.passengers (pass_id, pass_nm, birthday_dt, email, password) VALUES
(0, 'Dmitriy Kozlov', '1978-04-23', 'vasy@email.com', '123abc456'),
(1, 'Vasy Kozlov', '1979-05-23', 'vasy@email.com', '123abc456'),
(2, 'Igor Pupkin', '1979-08-07', 'vasy@email.com', '123abc456'),
(3, 'Vladimir Ovsov', '1958-04-13', 'vasy@email.com', '123abc456'),
(4, 'Prohor Mazitov', '2000-04-05', 'vasy@email.com', '123abc456'),
(5, 'Artem Kulikov', '1992-10-02', 'vasy@email.com', '123abc456'),
(6, 'Petr Ivanov', '1968-07-27', 'vasy@email.com', '123abc456'),
(7, 'Vlad Perekupov', '1995-11-19', 'vasy@email.com', '123abc456'),
(8, 'Arina Zlato', '1963-04-03', 'vasy@email.com', '123abc456'),
(9, 'Lubov Rasputina', '1999-08-17', 'vasy@email.com', '123abc456'),
(10, 'Klavdiya Veshukova', '1955-04-23', 'vasy@email.com', '123abc456'),
(11, 'Artur Karavaev', '1977-09-13', 'vasy@email.com', '123abc456'),
(12, 'Aleks Baranov', '1987-03-06', 'vasy@email.com', '123abc456'),
(13, 'Nikolay Petruhin', '1978-04-26', 'vasy@email.com', '123abc456'),
(14, 'Goga Nakataich', '1986-12-18', 'vasy@email.com', '123abc456');

INSERT INTO project.trips (trip_no, time_from_dttm, time_to_dttm, airport_from_id, airport_to_id) VALUES
(100, '2023-04-20 08:00:00 EETDST', '2023-04-20 11:00:00 EETDST', 0, 2),
(101, '2023-04-19 16:00:00 EETDST', '2023-04-19 19:00:00 EETDST', 2, 0),
(102, '2023-04-19 08:00:00 EETDST', '2023-04-19 11:00:00 EETDST', 1, 2),
(103, '2023-04-18 08:00:00 EETDST', '2023-04-18 11:00:00 EETDST', 0, 2),
(104, '2023-04-20 08:00:00 EETDST', '2023-04-20 12:00:00 CEST', 0, 4),
(105, '2023-04-20 08:00:00 CEST', '2023-04-20 12:00:00 EETDST', 4, 2),
(106, '2023-04-20 15:00:00 CEST', '2023-04-20 19:00:00 EETDST', 4, 0),
(107, '2023-04-19 08:00:00 EETDST', '2023-04-19 08:00:00 CEST', 2, 4),
(108, '2023-04-19 16:00:00 EETDST', '2023-04-19 20:00:00 CEST', 1, 4),
(109, '2023-04-18 15:00:00 EETDST', '2023-04-18 19:00:00 CEST', 0, 4);

INSERT INTO project.pass_in_trip (pass_id, trip_no, class_code, place_code) VALUES
(13, 100, 'coach', '12E'),
(14, 100, 'business', '01A'),
(0, 101, 'coach', '12E'),
(1, 101, 'business', '01A'),
(2, 102, 'coach', '12D'),
(3, 102, 'business', '01A'),
(4, 103, 'coach', '12A'),
(5, 103, 'business', '01A'),
(6, 104, 'coach', '12F'),
(7, 104, 'business', '01A'),
(8, 105, 'coach', '12B'),
(9, 105, 'business', '01A'),
(10, 106, 'coach', '12C'),
(11, 106, 'business', '01A'),
(12, 107, 'coach', '12E'),
(13, 107, 'business', '01A'),
(14, 108, 'coach', '12D'),
(0, 108, 'business', '01A'),
(1, 109, 'coach', '12A'),
(2, 109, 'business', '01A');

INSERT INTO project.plane_in_trip (trip_no, plane_id, air_staff_id) VALUES
(100, 0, 0),
(101, 1, 1),
(102, 2, 2),
(103, 3, 3),
(104, 4, 4),
(105, 5, 5),
(106, 6, 6),
(107, 7, 7),
(108, 8, 1),
(109, 9, 0);
