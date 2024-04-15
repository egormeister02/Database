INSERT INTO project.passengers (pass_id, pass_nm, birthday_dt) VALUES
(100, 'Dmitriy Kozlov', '1978-04-23'),
(101, 'Vasy Kozlov', '1979-05-23'),
(102, 'Igor Pupkin', '1979-08-07'),
(103, 'Vladimir Ovsov', '1958-04-13'),
(104, 'Prohor Mazitov', '2000-04-05');

UPDATE project.passengers SET pass_nm = 'UNKNOWN' where pass_id = 100;
UPDATE project.passengers SET pass_nm = 'UNKNOWN' where pass_id = 101;
UPDATE project.passengers SET pass_nm = 'UNKNOWN' where pass_id = 102;
UPDATE project.passengers SET pass_nm = 'UNKNOWN' where pass_id = 103;
UPDATE project.passengers SET pass_nm = 'UNKNOWN' where pass_id = 104;

DELETE FROM project.passengers where pass_id = 100;
DELETE FROM project.passengers where pass_id = 101;
DELETE FROM project.passengers where pass_id = 102;
DELETE FROM project.passengers where pass_id = 103;
DELETE FROM project.passengers where pass_id = 104;