--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type_id integer,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth numeric(12,2),
    has_life boolean DEFAULT false NOT NULL,
    star_count integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

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
    description text,
    is_common boolean DEFAULT true NOT NULL,
    discovered_year integer
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    age_in_millions_of_years numeric(10,2),
    diameter_km integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50),
    has_life boolean DEFAULT false NOT NULL,
    distance_from_earth numeric(12,2),
    moon_count integer,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric(10,2),
    mass_in_solar_masses numeric(10,3),
    is_spherical boolean DEFAULT true NOT NULL,
    planet_count integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 13600.00, 0.03, true, 8);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 10000.00, 2537000.00, false, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1, 9000.00, 2730000.00, false, 1);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 3, 4200.00, 163000.00, false, 1);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 2, 12000.00, 53500000.00, false, 0);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 4, 13000.00, 13000000.00, false, 0);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'A galaxy with a rotating disk and spiral arms.', true, 1845);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'A smooth, egg-shaped collection of stars.', true, 1936);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'A galaxy with no defined shape.', false, 1925);
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'A galaxy between spiral and elliptical types.', false, 1936);
INSERT INTO public.galaxy_type VALUES (5, 'Peculiar', 'A galaxy with an unusual structure or origin.', false, 1966);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 4530.00, 3474, 'Earth''s only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 4500.00, 22, 'The larger and closer of Mars'' two moons.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 4500.00, 12, 'The smaller and more distant moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Venus Moon A', 2, true, 100.00, 500, 'A hypothetical captured moon of Venus.');
INSERT INTO public.moon VALUES (5, 'Kepler-186f Moon A', 5, true, 400.00, 1800, 'A rocky moon orbiting Kepler-186f.');
INSERT INTO public.moon VALUES (6, 'Kepler-186f Moon B', 5, true, 420.00, 1200, 'A smaller icy moon orbiting Kepler-186f.');
INSERT INTO public.moon VALUES (7, 'Kepler-22b Moon A', 6, true, 300.00, 2200, 'A large moon orbiting Kepler-22b.');
INSERT INTO public.moon VALUES (8, 'Kepler-22b Moon B', 6, true, 310.00, 1600, 'A moon with a thin atmosphere.');
INSERT INTO public.moon VALUES (9, 'Proxima b Moon A', 7, true, 200.00, 1400, 'The only known moon of Proxima b.');
INSERT INTO public.moon VALUES (10, 'Alpha Centauri Bb I', 8, true, 600.00, 1700, 'A tidally locked moon.');
INSERT INTO public.moon VALUES (11, 'Alpha Centauri Bb II', 8, false, 610.00, 900, 'An irregularly shaped captured moon.');
INSERT INTO public.moon VALUES (12, 'Toliman I', 9, true, 800.00, 2600, 'A large moon with a rocky surface.');
INSERT INTO public.moon VALUES (13, 'Toliman II', 9, false, 810.00, 700, 'A small, irregular moon.');
INSERT INTO public.moon VALUES (14, 'Betelgeuse I Moon A', 10, true, 5.00, 3000, 'A young moon formed from stellar debris.');
INSERT INTO public.moon VALUES (15, 'Betelgeuse I Moon B', 10, true, 5.20, 2500, 'A companion moon with icy rings.');
INSERT INTO public.moon VALUES (16, 'Betelgeuse II Moon A', 11, true, 5.50, 2100, 'A moon with a faint ring system.');
INSERT INTO public.moon VALUES (17, 'Betelgeuse II Moon B', 11, false, 5.60, 950, 'An irregular moon captured by gravity.');
INSERT INTO public.moon VALUES (18, 'Rigel Prime Moon A', 12, true, 6.00, 3200, 'The largest moon of Rigel Prime.');
INSERT INTO public.moon VALUES (19, 'Rigel Prime Moon B', 12, true, 6.10, 1900, 'A moon with active geysers.');
INSERT INTO public.moon VALUES (20, 'Rigel Minor Moon A', 13, true, 6.30, 1100, 'A small moon with a thin dusty surface.');
INSERT INTO public.moon VALUES (21, 'Vega Prime Moon A', 14, true, 300.00, 2400, 'A moon with a subsurface ocean.');
INSERT INTO public.moon VALUES (22, 'Vega Prime Moon B', 14, false, 305.00, 850, 'A tiny irregular moon.');
INSERT INTO public.moon VALUES (23, 'Mercury Companion', 1, false, 50.00, 150, 'A hypothetical small captured moon of Mercury.');
INSERT INTO public.moon VALUES (24, 'Earth Trojan', 3, false, 20.00, 40, 'A small quasi-satellite of Earth.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, 0.39, 0, 'Smallest and closest planet to the Sun.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, 0.72, 1, 'Hottest planet with a thick toxic atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, 0.00, 1, 'The only known planet to support life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, 1.52, 2, 'The red planet, home to the largest volcano.');
INSERT INTO public.planet VALUES (5, 'Kepler-186f', 2, 'Terrestrial', false, 500000.00, 2, 'An Earth-sized exoplanet in a habitable zone.');
INSERT INTO public.planet VALUES (6, 'Kepler-22b', 2, 'Super-Earth', false, 600000.00, 2, 'A large exoplanet with possible ocean coverage.');
INSERT INTO public.planet VALUES (7, 'Proxima b', 7, 'Terrestrial', false, 4.24, 1, 'The closest known exoplanet to our solar system.');
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 3, 'Terrestrial', false, 4.37, 2, 'A rocky planet orbiting Alpha Centauri B.');
INSERT INTO public.planet VALUES (9, 'Toliman', 3, 'Gas Giant', false, 4.40, 2, 'A massive gas giant with strong storms.');
INSERT INTO public.planet VALUES (10, 'Betelgeuse I', 4, 'Gas Giant', false, 700000.00, 2, 'A gas giant orbiting a red supergiant.');
INSERT INTO public.planet VALUES (11, 'Betelgeuse II', 4, 'Ice Giant', false, 700500.00, 2, 'A distant ice giant with faint rings.');
INSERT INTO public.planet VALUES (12, 'Rigel Prime', 5, 'Gas Giant', false, 860000.00, 2, 'A large gas giant with an extreme magnetic field.');
INSERT INTO public.planet VALUES (13, 'Rigel Minor', 5, 'Terrestrial', false, 860200.00, 1, 'A small rocky planet with a thin atmosphere.');
INSERT INTO public.planet VALUES (14, 'Vega Prime', 6, 'Super-Earth', false, 25.00, 2, 'A super-Earth located within the Vega system.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600.00, 1.000, true, 4);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242.00, 2.020, true, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 5300.00, 1.100, true, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 8.00, 16.500, true, 2);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 8.00, 21.000, true, 2);
INSERT INTO public.star VALUES (6, 'Vega', 3, 455.00, 2.135, true, 1);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 1, 4850.00, 0.122, true, 1);
INSERT INTO public.star VALUES (8, 'Antares', 4, 12.00, 11.800, true, 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy_type galaxy_type_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_type_name_key UNIQUE (name);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

