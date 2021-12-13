--перерывы 30 минут и более между фильмами — выводить по уменьшению длительности перерыва. Колонки «фильм 1», «время начала», «длительность», «время начала второго фильма», «длительность перерыва»;
select r1.film_name  "фильм 1",
       r1.start_time "время начала",
       r1.duration   "длительность",
       r2.film_name  "фильм 2",
       r2.start_time "время начала второго фильма",
       (r2.start_time - r1.start_time -
        make_time(r1.duration::int/60, r1.duration::int - r1.duration::int/60 * 60, 00.0)) ::text "длительность перерыва"
from (select schedule.id, films.name film_name, schedule.start_time start_time, films.duration duration
      from schedule
               inner join films ON schedule.film_id = films.id) r1,
     (select schedule.id, films.name film_name, schedule.start_time start_time, films.duration duration
      from schedule
               inner join films ON schedule.film_id = films.id) r2
where r1.id <> r2.id
  and r2.start_time > r1.start_time
  and (r2.start_time - r1.start_time -
       make_time(r1.duration::int/60, r1.duration::int - r1.duration::int/60 * 60, 00.0)) > make_time(0, 30, 0)
  and extract(hours from (r2.start_time - r1.start_time -
                          make_time(r1.duration::int/60, r1.duration::int - r1.duration::int/60 * 60, 00.0))) <
      (select max(duration) / 60. from films) -- проверка на то, что фильм следующий
order by r1.start_time