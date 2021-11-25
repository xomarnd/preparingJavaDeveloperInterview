--список фильмов, для каждого — с указанием общего числа посетителей за все время, среднего числа зрителей за сеанс и общей суммы сборов по каждому фильму (отсортировать по убыванию прибыли). Внизу таблицы должна быть строчка «итого», содержащая данные по всем фильмам сразу;
(
    select films.name         "name",
           sum(r2.ticket_sum) "client_count",
           avg(r3.ticket_count)::text "client_average", sum(r2.amount_money) "total_money"
    from films
             inner join (select schedule.film_id,
                                avg(ticket_count)                                        ticket_sum,
                                sum(ticket_count * schedule.price) / count(ticket_count) amount_money
                         from schedule
                                  inner join (select tickets.schedule_id, count(*) ticket_count
                                              from tickets
                                              group by tickets.schedule_id) r1 on schedule.id = r1.schedule_id
                         group by schedule.film_id) r2 ON r2.film_id = films.id
             inner join schedule s on films.id = s.film_id
             inner join (select tickets.schedule_id, count(*) ticket_count from tickets group by tickets.schedule_id) r3
                        on s.id = r3.schedule_id
    group by films.name
)
union
(
    select 'Итого', count(t.*), '', sum(s.price)
    from schedule s
             inner join tickets t on s.id = t.schedule_id
)