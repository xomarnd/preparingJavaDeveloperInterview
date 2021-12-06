CREATE
DATABASE cinema WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';

CREATE TABLE public.films
(
    id           integer NOT NULL,
    name         text    NOT NULL,
    duration     integer NOT NULL,
    year_release integer
);


ALTER TABLE public.films OWNER TO postgres;

--
-- Name: COLUMN films.duration; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT
ON COLUMN public.films.duration IS 'Продолжительность фильма';


--
-- Name: COLUMN films.year_release; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT
ON COLUMN public.films.year_release IS 'Дата релиза';


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule
(
    id         integer NOT NULL,
    film_id    integer NOT NULL,
    start_time time without time zone NOT NULL,
    price      money   NOT NULL
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets
(
    id          integer NOT NULL,
    schedule_id integer NOT NULL,
    client_name text
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.films (id, name, duration, year_release)
VALUES (1, 'Энканто', 99, 2021);
INSERT INTO public.films (id, name, duration, year_release)
VALUES (2, 'Прошлой ночью в Сохо', 116, 2021);
INSERT INTO public.films (id, name, duration, year_release)
VALUES (3, 'Обитель зла: Раккун-Сити', 107, 2021);
INSERT INTO public.films (id, name, duration, year_release)
VALUES (4, 'Французский вестник. Приложение к газете «Либерти. Канзас ивнинг сан»', 107, 2021);
INSERT INTO public.films (id, name, duration, year_release)
VALUES (5, 'Последняя дуэль', 152, 2021);
INSERT INTO public.films (id, name, duration, year_release)
VALUES (6, 'Lion King', 94, 2021);


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schedule (id, film_id, start_time, price)
VALUES (1, 1, '08:00:00', '$100.10');
INSERT INTO public.schedule (id, film_id, start_time, price)
VALUES (2, 1, '10:20:00', '$150.50');
INSERT INTO public.schedule (id, film_id, start_time, price)
VALUES (3, 2, '12:00:00', '$245.00');
INSERT INTO public.schedule (id, film_id, start_time, price)
VALUES (4, 3, '14:00:00', '$300.00');
INSERT INTO public.schedule (id, film_id, start_time, price)
VALUES (5, 4, '16:20:00', '$300.00');
INSERT INTO public.schedule (id, film_id, start_time, price)
VALUES (6, 5, '18:00:00', '$250.00');
INSERT INTO public.schedule (id, film_id, start_time, price)
VALUES (7, 1, '20:10:00', '$400.00');
INSERT INTO public.schedule (id, film_id, start_time, price)
VALUES (8, 6, '22:00:00', '$225.75');


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (1, 2, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (2, 2, 'Vasya');
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (3, 2, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (4, 5, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (5, 4, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (6, 4, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (7, 3, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (8, 1, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (9, 6, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (10, 7, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (11, 7, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (12, 7, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (13, 7, NULL);
INSERT INTO public.tickets (id, schedule_id, client_name)
VALUES (14, 8, NULL);


--
-- Name: schedule film_start; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT film_start UNIQUE (film_id, start_time);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: film_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX film_name ON public.films USING btree (name);


--
-- Name: year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX year ON public.films USING btree (year_release);


--
-- Name: schedule film_reference; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT film_reference FOREIGN KEY (film_id) REFERENCES public.films(id);


--
-- Name: tickets schedule_reference; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT schedule_reference FOREIGN KEY (schedule_id) REFERENCES public.schedule(id);


--
-- PostgreSQL database dump complete
--