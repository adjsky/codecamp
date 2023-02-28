--
-- PostgreSQL database dump
--
-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
SET
  statement_timeout = 0;

SET
  lock_timeout = 0;

SET
  idle_in_transaction_session_timeout = 0;

SET
  client_encoding = 'UTF8';

SET
  standard_conforming_strings = ON;

SELECT
  pg_catalog.set_config('search_path', '', false);

SET
  check_function_bodies = false;

SET
  xmloption = content;

SET
  client_min_messages = warning;

SET
  row_security = off;

DROP DATABASE universe;

--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--
CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

ALTER DATABASE universe OWNER TO freecodecamp;

\ connect universe
SET
  statement_timeout = 0;

SET
  lock_timeout = 0;

SET
  idle_in_transaction_session_timeout = 0;

SET
  client_encoding = 'UTF8';

SET
  standard_conforming_strings = ON;

SELECT
  pg_catalog.set_config('search_path', '', false);

SET
  check_function_bodies = false;

SET
  xmloption = content;

SET
  client_min_messages = warning;

SET
  row_security = off;

SET
  default_tablespace = '';

SET
  default_table_access_method = HEAP;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.galaxy (
  galaxy_id integer NOT NULL,
  name character varying(30) NOT NULL,
  age_in_millions_of_years integer,
  description text,
  galaxy_type_id integer
);

ALTER TABLE
  public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
  public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.galaxy_type (
  galaxy_type_id integer NOT NULL,
  name character varying(50) NOT NULL,
  description text
);

ALTER TABLE
  public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
  public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.moon (
  moon_id integer NOT NULL,
  name character varying(30) NOT NULL,
  description text,
  planet_id integer,
  distance_to_earth_in_km numeric(15, 2)
);

ALTER TABLE
  public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
  public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.planet (
  planet_id integer NOT NULL,
  name character varying(30) NOT NULL,
  age_in_millions_of_years integer,
  distance_to_closest_star_in_au numeric(15, 2),
  has_life boolean,
  description text,
  star_id integer
);

ALTER TABLE
  public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
  public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.star (
  star_id integer NOT NULL,
  name character varying(30) NOT NULL,
  is_dangerous boolean,
  galaxy_id integer,
  description text
);

ALTER TABLE
  public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
  public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy
ALTER COLUMN
  galaxy_id
SET
  DEFAULT nextval('public.galaxy_galaxy_id_seq' :: regclass);

--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy_type
ALTER COLUMN
  galaxy_type_id
SET
  DEFAULT nextval(
    'public.galaxy_types_galaxy_type_id_seq' :: regclass
  );

--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ALTER COLUMN
  moon_id
SET
  DEFAULT nextval('public.moon_moon_id_seq' :: regclass);

--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ALTER COLUMN
  planet_id
SET
  DEFAULT nextval('public.planet_planet_id_seq' :: regclass);

--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ALTER COLUMN
  star_id
SET
  DEFAULT nextval('public.star_star_id_seq' :: regclass);

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.galaxy
VALUES
  (5, 'andromeda', 10010, NULL, 1);

INSERT INTO
  public.galaxy
VALUES
  (6, 'NGC 4151', 13250, NULL, 1);

INSERT INTO
  public.galaxy
VALUES
  (7, 'milky way', 13610, NULL, 1);

INSERT INTO
  public.galaxy
VALUES
  (8, 'Messier 82', 13300, NULL, 1);

INSERT INTO
  public.galaxy
VALUES
  (10, 'IC 4710', NULL, NULL, 3);

INSERT INTO
  public.galaxy
VALUES
  (11, 'Messier 60', NULL, NULL, 2);

--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.galaxy_type
VALUES
  (1, 'spiral', NULL);

INSERT INTO
  public.galaxy_type
VALUES
  (2, 'elliptical', NULL);

INSERT INTO
  public.galaxy_type
VALUES
  (3, 'irregular', NULL);

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.moon
VALUES
  (1, 'Moon', NULL, 1, NULL);

INSERT INTO
  public.moon
VALUES
  (2, 'Phobos', NULL, 6, NULL);

INSERT INTO
  public.moon
VALUES
  (3, 'Deimos', NULL, 6, NULL);

INSERT INTO
  public.moon
VALUES
  (4, 'Io', NULL, 5, NULL);

INSERT INTO
  public.moon
VALUES
  (5, 'Euroopa', NULL, 5, NULL);

INSERT INTO
  public.moon
VALUES
  (6, 'Ganymede', NULL, 5, NULL);

INSERT INTO
  public.moon
VALUES
  (7, 'Callisto', NULL, 5, NULL);

INSERT INTO
  public.moon
VALUES
  (8, 'Aegaeon', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (9, 'Aegir', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (10, 'Albiorix', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (11, 'Alvaldi', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (12, 'Angrboda', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (13, 'Anthe', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (14, 'Atlas', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (15, 'Bebhionn', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (16, 'Beli', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (17, 'Bergelmir', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (18, 'Bestla', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (19, 'Calypso', NULL, 4, NULL);

INSERT INTO
  public.moon
VALUES
  (20, 'Daphnis', NULL, 4, NULL);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.planet
VALUES
  (1, 'Earth', NULL, NULL, NULL, NULL, 6);

INSERT INTO
  public.planet
VALUES
  (2, 'Neptune', NULL, NULL, NULL, NULL, 6);

INSERT INTO
  public.planet
VALUES
  (3, 'Uranus', NULL, NULL, NULL, NULL, 6);

INSERT INTO
  public.planet
VALUES
  (4, 'Saturn', NULL, NULL, NULL, NULL, 6);

INSERT INTO
  public.planet
VALUES
  (5, 'Jupiter', NULL, NULL, NULL, NULL, 6);

INSERT INTO
  public.planet
VALUES
  (6, 'Mars', NULL, NULL, NULL, NULL, 6);

INSERT INTO
  public.planet
VALUES
  (7, 'Venus', NULL, NULL, NULL, NULL, 6);

INSERT INTO
  public.planet
VALUES
  (8, 'Mercury', NULL, NULL, NULL, NULL, 6);

INSERT INTO
  public.planet
VALUES
  (9, 'Nyan', NULL, NULL, NULL, NULL, 3);

INSERT INTO
  public.planet
VALUES
  (10, 'PA-99-N2', NULL, NULL, NULL, NULL, NULL);

INSERT INTO
  public.planet
VALUES
  (11, 'TOI-1452b', NULL, NULL, NULL, NULL, NULL);

INSERT INTO
  public.planet
VALUES
  (12, 'WASP-39b', NULL, NULL, NULL, NULL, NULL);

INSERT INTO
  public.planet
VALUES
  (13, 'WASP-130b', NULL, NULL, NULL, NULL, NULL);

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.star
VALUES
  (1, 'Phi Andromedae', NULL, 5, NULL);

INSERT INTO
  public.star
VALUES
  (2, 'Alpha Andromedae', NULL, 5, NULL);

INSERT INTO
  public.star
VALUES
  (3, 'Sirius A', NULL, 7, NULL);

INSERT INTO
  public.star
VALUES
  (6, 'Sun', NULL, 7, NULL);

INSERT INTO
  public.star
VALUES
  (5, 'KY Cygni', NULL, 7, NULL);

INSERT INTO
  public.star
VALUES
  (4, 'RW Cephei', NULL, 7, NULL);

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, TRUE);

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval(
    'public.galaxy_types_galaxy_type_id_seq',
    3,
    TRUE
  );

--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.moon_moon_id_seq', 20, TRUE);

--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.planet_planet_id_seq', 13, TRUE);

--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.star_star_id_seq', 6, TRUE);

--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy
ADD
  CONSTRAINT galaxy_name_key UNIQUE (name);

--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy
ADD
  CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

--
-- Name: galaxy_type galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy_type
ADD
  CONSTRAINT galaxy_types_name_key UNIQUE (name);

--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy_type
ADD
  CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);

--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ADD
  CONSTRAINT moon_name_key UNIQUE (name);

--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ADD
  CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ADD
  CONSTRAINT planet_name_key UNIQUE (name);

--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ADD
  CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ADD
  CONSTRAINT star_name_key UNIQUE (name);

--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ADD
  CONSTRAINT star_pkey PRIMARY KEY (star_id);

--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ADD
  CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE
SET
  NULL;

--
-- Name: galaxy fk_galaxy_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy
ADD
  CONSTRAINT fk_galaxy_type FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id) ON DELETE
SET
  NULL;

--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ADD
  CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE
SET
  NULL;

--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ADD
  CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE
SET
  NULL;

--
-- PostgreSQL database dump complete
--