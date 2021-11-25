--ошибки в расписании (фильмы накладываются друг на друга), отсортированные по возрастанию времени.
--Выводить надо колонки «фильм 1», «время начала», «длительность», «фильм 2», «время начала», «длительность»;
select r1.film_name  "фильм 1",
       r1.start_time "время начала",
       r1.duration   "длительность",
       r2.film_name  "фильм 2",
       r2.start_time "время начала",
       r2.duration   "длительность"

from (select schedule.id, films.name film_name, schedule.start_time start_time, films.duration duration
      from schedule
               inner join films ON schedule.film_id = films.id) r1,
     (select schedule.id, films.name film_name, schedule.start_time start_time, films.duration duration
      from schedule
               inner join films ON schedule.film_id = films.id) r2
where r1.id <> r2.id
  and (
        (
                    r2.start_time > r1.start_time and
                    ((r2.start_time - make_time(r1.duration::int/60, r1.duration::int - r1.duration::int/60 * 60, 00.0)) <
                     r1.start_time)
            )
        or
        (
                    r1.start_time > r2.start_time and
                    (r1.start_time - make_time(r2.duration::int/60, r2.duration::int - r2.duration::int/60 * 60, 00.0)) <
                    r2.start_time
            )
    )

order by r1.start_time