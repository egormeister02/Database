# Физическая модель

---

Таблица `passengers`:

| Название        | Описание                | Тип данных     | Ограничение   |
|-----------------|-------------------------|----------------|---------------|
| `pass_id`       | Идентификатор пассажира | `INTEGER`      | `PRIMARY KEY` |
| `pass_nm`       | Имя пассажира           | `VARCHAR(200)` | `NOT NULL`    |
| `birthday_dt`   | день рождения пассажира | `DATE`         | `NOT NULL`    |
| `email`         | Электронная почта       | `VARCHAR`      | `NOT NULL`    |
| `password`      | Пароль                  | `VARCHAR`      | `NOT NULL`    |

Таблица `pass_in_trip`:

| Название             | Описание                  | Тип данных     | Ограничение                                  |
|----------------------|---------------------------|----------------|----------------------------------------------|
| `pass_id`            | Идентификатор пассажира   | `INTEGER`      | `FOREIGN KEY`                                |
| `trip_no`            | Номер рейса               | `INTEGER`      | `FOREIGN KEY`                                |
| `class_code`         | код класса                | `VARCHAR(10)`  | `CHECK (class_code IN ('business', 'coach'))`|
| `place_code`         | код места                 | `VARCHAR(10)`  | `NOT NULL`                                   |

Таблица `trips`:

| Название          | Описание                        | Тип данных                  | Ограничение   |
|-------------------|---------------------------------|-----------------------------|---------------|
| `trip_no`         | Номер рейса                     | `INTEGER`                   | `PRIMARY KEY` |
| `time_from_dttm`  | Дата и время вылета             | `timestamp with time zone`  | `NOT NULL`    |
| `time_to_dttm`    | Дата и время посадки            | `timestamp with time zone`  | `NOT NULL`    |
| `airport_from_id` | Идентификатор аэропорта вылета  | `INTEGER`                   | `FOREIGN KEY` |
| `airport_to_id`   | Идентификатор аэропорта посадки | `INTEGER`                   | `FOREIGN KEY` |

Таблица `airports`:

| Название          | Описание                   | Тип данных     | Ограничение   |
|-------------------|----------------------------|----------------|---------------|
| `airport_id`      | Идентификатор аэропорта    | `INTEGER`      | `PRIMARY KEY` |
| `airport_nm`      | Название аэропорта         | `VARCHAR`      | `NOT NULL`    |
| `city`            | Город аэропорта            | `VARCHAR`      | `NOT NULL`    |

Таблица `plane_in_trip`:

| Название          | Описание                        | Тип данных    | Ограничение   |
|-------------------|---------------------------------|---------------|---------------|
| `trip_no`         | Номер рейса                     | `INTEGER`     | `FOREIGN KEY` |
| `plane_id`        | Идентификатор самолета          | `INTEGER`     | `FOREIGN KEY` |
| `air_staff_id`    | Идентификатор летного состава   | `INTEGER`     | `FOREIGN KEY` |

Таблица `planes`:

| Название                | Описание                        | Тип данных  | Ограничение       |
|-------------------------|---------------------------------|-------------|-------------------|
| `plane_id`              | Идентификатор самолета          | `INTEGER`   | `PRIMARY KEY`     |
| `plane_series`          | серийный номер самолета         | `INTEGER`   | `NOT NULL UNIQUE` |
| `age_year`              | Возраст самолета                | `INTEGER`   | `NOT NULL`        |
| `time_on_the_wing_hour` | количество часов в воздухе      | `INTEGER`   | `NOT NULL`        |
| `model_id`              | Идентифифкатор модели           | `INTEGER`   | `FOREIGN KEY`     |

Таблица `models`:

| Название                | Описание                        | Тип данных  | Ограничение       |
|-------------------------|---------------------------------|-------------|-------------------|
| `model_id`              | Идентифифкатор модели           | `INTEGER`   | `PRIMARY KEY`     |
| `model_nm`              | Название модели                 | `VARCHAR`   | `NOT NULL   `     |
| `transit_range_mile`    | Дальность полета                | `INTEGER`   | `NOT NULL`        |
| `maintenance_cost`      | Стоимость обслуживания в год    | `INTEGER`   | `NOT NULL`        |

Таблица `air_staff`:

| Название              | Описание                        | Тип данных    | Ограничение   |
|-----------------------|---------------------------------|---------------|---------------|
| `staff_id`            | Номер рейса                     | `INTEGER`     | `PRIMARY KEY` |
| `pilot_in_command_id` | Идентификатор пилота капитана   | `INTEGER`     | `FOREIGN KEY` |
| `relief_pilot_id`     | Идентификатор второго пилота    | `INTEGER`     | `FOREIGN KEY` |


Таблица `Pilots`:

| Название                | Описание                        | Тип данных    | Ограничение   |
|-------------------------|---------------------------------|---------------|---------------|
| `pilot_id`              | Идентификатор пилота            | `INTEGER`     | `PRIMARY KEY` |
| `pilot_nm`              | Имя пилота                      | `VARCHAR`     | `NOT NULL`    |
| `birthday_dt`           | день рождения пилота            | `DATE`        | `NOT NULL`    |
| `time_in_the_air_hour`  | Налет (часов)                   | `INTEGER`     | `NOT NULL`    |
| `number_of_flights_cnt` | Количество полетов              | `INTEGER`     | `NOT NULL`    |
| `email`                 | Электронная почта               | `VARCHAR`     | `NOT NULL`    |
| `password`              | Пароль                          | `VARCHAR`     | `NOT NULL`    |

Таблица `Pilots_history`:

| Название                | Описание                        | Тип данных    | Ограничение   |
|-------------------------|---------------------------------|---------------|---------------|
| `pilot_id`              | Идентификатор пилота            | `INTEGER`     | `FOREIGN KEY` |
| `time_in_the_air_hour`  | Налет (часов)                   | `INTEGER`     | `NOT NULL`    |
| `number_of_flights_cnt` | Количество полетов              | `INTEGER`     | `NOT NULL`    |
| `history_dttm`          | Дата обновления информации      | `TIMESTAMP`   | `NOT NULL`    |
