DROP DATABASE universe;

CREATE DATA~BASE universe;

\c universe;

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    hase_life boolean,
    description text,
    galaxy_id integer
);


CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    hase_life boolean,
    description text
);


CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    hase_life boolean,
    description text,
    planet_id integer
);


CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    hase_life boolean,
    description text,
    star_id integer
);


CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    hase_life boolean,
    description text,
    galaxy_id integer
);


INSERT INTO public.comet VALUES (1, 'a', 1, 1, 1, true, true, 'a', 1);
INSERT INTO public.comet VALUES (2, 'b', 1, 2, 1, true, true, 'b', 2);
INSERT INTO public.comet VALUES (3, 'c', 1, 3, 1, true, true, 'c', 3);
INSERT INTO public.comet VALUES (4, 'd', 1, 4, 1, true, true, 'd', 4);
INSERT INTO public.comet VALUES (5, 'e', 1, 5, 1, true, true, 'e', 5);
INSERT INTO public.comet VALUES (6, 'f', 1, 6, 1, true, true, 'f', 6);
INSERT INTO public.comet VALUES (7, 'g', 1, 7, 1, true, true, 'g', 1);
INSERT INTO public.comet VALUES (8, 'h', 1, 8, 1, true, true, 'h', 2);
INSERT INTO public.comet VALUES (9, 'i', 1, 9, 1, true, true, 'i', 3);
INSERT INTO public.comet VALUES (10, 'j', 1, 10, 1, true, true, 'j', 4);
INSERT INTO public.comet VALUES (11, 'k', 1, 11, 1, true, true, 'k', 5);
INSERT INTO public.comet VALUES (12, 'l', 1, 12, 1, true, true, 'l', 6);
INSERT INTO public.comet VALUES (13, 'm', 1, 13, 1, true, true, 'm', 1);
INSERT INTO public.comet VALUES (14, 'n', 1, 14, 1, true, true, 'n', 2);
INSERT INTO public.comet VALUES (15, 'o', 1, 15, 1, true, true, 'o', 3);
INSERT INTO public.comet VALUES (16, 'p', 1, 16, 1, true, true, 'p', 4);
INSERT INTO public.comet VALUES (17, 'q', 1, 17, 1, true, true, 'q', 5);
INSERT INTO public.comet VALUES (18, 'r', 1, 18, 1, true, true, 'r', 6);
INSERT INTO public.comet VALUES (19, 's', 1, 19, 1, true, true, 's', 1);
INSERT INTO public.comet VALUES (20, 't', 1, 20, 1, true, true, 't', 2);

INSERT INTO public.galaxy VALUES (1, 'a', 1, 1, 1, true, true, 'a');
INSERT INTO public.galaxy VALUES (2, 'b', 1, 2, 1, true, true, 'b');
INSERT INTO public.galaxy VALUES (3, 'c', 1, 3, 1, true, true, 'c');
INSERT INTO public.galaxy VALUES (4, 'd', 1, 4, 1, true, true, 'd');
INSERT INTO public.galaxy VALUES (5, 'e', 1, 5, 1, true, true, 'e');
INSERT INTO public.galaxy VALUES (6, 'b', 1, 6, 1, true, true, 'b');
INSERT INTO public.galaxy VALUES (7, 'c', 1, 7, 1, true, true, 'c');
INSERT INTO public.galaxy VALUES (8, 'd', 1, 8, 1, true, true, 'd');
INSERT INTO public.galaxy VALUES (9, 'e', 1, 9, 1, true, true, 'e');

INSERT INTO public.moon VALUES (1, 'a', 1, 1, 1, true, true, 'a', 1);
INSERT INTO public.moon VALUES (2, 'b', 1, 2, 1, true, true, 'b', 2);
INSERT INTO public.moon VALUES (3, 'c', 1, 3, 1, true, true, 'c', 3);
INSERT INTO public.moon VALUES (4, 'd', 1, 4, 1, true, true, 'd', 4);
INSERT INTO public.moon VALUES (5, 'e', 1, 5, 1, true, true, 'e', 5);
INSERT INTO public.moon VALUES (6, 'f', 1, 6, 1, true, true, 'f', 6);
INSERT INTO public.moon VALUES (7, 'g', 1, 7, 1, true, true, 'g', 1);
INSERT INTO public.moon VALUES (8, 'h', 1, 8, 1, true, true, 'h', 2);
INSERT INTO public.moon VALUES (9, 'i', 1, 9, 1, true, true, 'i', 3);
INSERT INTO public.moon VALUES (10, 'j', 1, 10, 1, true, true, 'j', 4);
INSERT INTO public.moon VALUES (11, 'k', 1, 11, 1, true, true, 'k', 5);
INSERT INTO public.moon VALUES (12, 'l', 1, 12, 1, true, true, 'l', 6);
INSERT INTO public.moon VALUES (13, 'm', 1, 13, 1, true, true, 'm', 1);
INSERT INTO public.moon VALUES (14, 'n', 1, 14, 1, true, true, 'n', 2);
INSERT INTO public.moon VALUES (15, 'o', 1, 15, 1, true, true, 'o', 3);
INSERT INTO public.moon VALUES (16, 'p', 1, 16, 1, true, true, 'p', 4);
INSERT INTO public.moon VALUES (17, 'q', 1, 17, 1, true, true, 'q', 5);
INSERT INTO public.moon VALUES (18, 'r', 1, 18, 1, true, true, 'r', 6);
INSERT INTO public.moon VALUES (19, 's', 1, 19, 1, true, true, 's', 1);
INSERT INTO public.moon VALUES (20, 't', 1, 20, 1, true, true, 't', 2);


INSERT INTO public.planet VALUES (1, 'a', 1, 1, 1, true, true, 'a', 1);
INSERT INTO public.planet VALUES (2, 'b', 1, 2, 1, true, true, 'b', 2);
INSERT INTO public.planet VALUES (3, 'c', 1, 3, 1, true, true, 'c', 3);
INSERT INTO public.planet VALUES (4, 'd', 1, 4, 1, true, true, 'd', 4);
INSERT INTO public.planet VALUES (5, 'e', 1, 5, 1, true, true, 'e', 5);
INSERT INTO public.planet VALUES (6, 'f', 1, 6, 1, true, true, 'f', 6);
INSERT INTO public.planet VALUES (7, 'g', 1, 7, 1, true, true, 'g', 1);
INSERT INTO public.planet VALUES (8, 'h', 1, 8, 1, true, true, 'h', 2);
INSERT INTO public.planet VALUES (9, 'i', 1, 9, 1, true, true, 'i', 3);
INSERT INTO public.planet VALUES (10, 'j', 1, 10, 1, true, true, 'j', 4);
INSERT INTO public.planet VALUES (11, 'k', 1, 11, 1, true, true, 'k', 5);
INSERT INTO public.planet VALUES (12, 'l', 1, 12, 1, true, true, 'l', 6);


INSERT INTO public.star VALUES (1, 'a', 1, 1, 1, true, true, 'a', 1);
INSERT INTO public.star VALUES (2, 'b', 1, 2, 1, true, true, 'b', 2);
INSERT INTO public.star VALUES (3, 'c', 1, 3, 1, true, true, 'c', 3);
INSERT INTO public.star VALUES (4, 'd', 1, 4, 1, true, true, 'd', 4);
INSERT INTO public.star VALUES (5, 'e', 1, 5, 1, true, true, 'e', 5);
INSERT INTO public.star VALUES (6, 'f', 1, 6, 1, true, true, 'f', 6);


ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_distance_from_earth_key UNIQUE (distance_from_earth);

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_distance_from_earth_key UNIQUE (distance_from_earth);

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_distance_from_earth_key UNIQUE (distance_from_earth);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_distance_from_earth_key UNIQUE (distance_from_earth);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_distance_from_earth_key UNIQUE (distance_from_earth);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);
