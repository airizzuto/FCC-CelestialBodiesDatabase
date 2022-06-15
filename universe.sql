--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    cluster_type character varying(30)
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type character varying(30),
    magnitude numeric,
    also_known_as character varying(30)[]
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_in_km integer,
    radius numeric,
    planet_id integer,
    also_known_as character varying(30)[]
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
    name character varying(30) NOT NULL,
    description text,
    planet_type character varying(30),
    has_atmosphere boolean,
    has_rings boolean,
    radius_in_km integer,
    star_id integer,
    also_known_as character varying(30)[]
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
    name character varying(30) NOT NULL,
    description text,
    also_known_as character varying(30)[],
    star_type character varying(30),
    magnitude numeric,
    distance_in_ly numeric,
    galaxy_id integer
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
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'Argos Rho', 1, NULL);
INSERT INTO public.cluster VALUES (2, 'Exodus', 1, NULL);
INSERT INTO public.cluster VALUES (3, 'Horse Head Nebula', 1, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is a barred spiral galaxy with an estimated visible diameter of 100,000-200,000 light-years, but only about 1000 light years thick at the spiral arms (more at the bulge).', 'Barred Spiral Galaxy', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', NULL, 'Barred Spiral Galaxy', 0.90, '{LMC,"Nubecula Major",PGC,17223,"ESO 56-115","Anon 0524-69","ESO-LV 56-1150",EGR,J0537-6946}');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'The Small Magellanic Cloud (SMC), or Nubecula Minor, is a dwarf galaxy near the Milky Way. Classified as a dwarf irregular galaxy, the SMC has a diameter of about 7,000 light-years, contains several hundred million stars, and has a total mass of approximately 7 billion solar masses...', 'Galaxy', 2.69, '{SMC,"Nubecula Minor","NGC 292",PGC,3085,"ESO 29-21","Anon 0051-73","XSS J00595-7303"}');
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'Originally the Andromeda Nebula, is a barred spiral galaxy with diameter of about 220,000 ly approximately 2.5 million light-years (770 kiloparsecs) from Earth ant the neares large galaxy to the Milky Way', 'Barred Spiral Galaxy', 3.44, '{"Messier 31",M31,"NGC 224","Andromeda Neebula"}');
INSERT INTO public.galaxy VALUES (5, 'NGC 4414', NULL, 'Unbarred Spiral Galaxy', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Hoang''s Object', NULL, 'Ring Galaxy', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The moon is Earth''s only natural satellite...', 384400, 1737.4, 1, '{Luna}');
INSERT INTO public.moon VALUES (2, 'Dione', NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Tethys', NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Mimas', NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (5, 'Enceladus', NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (6, 'Rhea', NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (8, 'Io', NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Europa', NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Callisto', NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Ganymede', NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Triton', NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES (13, 'Nereid', NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES (14, 'Proteus', NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES (15, 'Naiad', NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES (16, 'Thalassa', NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES (17, 'Despina', NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES (18, 'Miranda', NULL, NULL, NULL, 41, NULL);
INSERT INTO public.moon VALUES (19, 'Ariel', NULL, NULL, NULL, 41, NULL);
INSERT INTO public.moon VALUES (20, 'Umbriel', NULL, NULL, NULL, 41, NULL);
INSERT INTO public.moon VALUES (21, 'Titania', NULL, NULL, NULL, 41, NULL);
INSERT INTO public.moon VALUES (22, 'Oberan', NULL, NULL, NULL, 41, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Earth is the third planete from the Sun and the only astronomical object known to harbor life. While large volumes of water can be found throughout the Solar System, only Earth sustains liquid surface water...', 'Rocky', true, false, 149598023, 5, '{Gaia,Terra,Tellus}');
INSERT INTO public.planet VALUES (2, 'Mars', NULL, 'Rocky', true, false, 227939366, 5, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, 'Rocky', true, false, 108208000, 5, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', NULL, 'Gas Giant', true, true, NULL, 5, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, 'Gas Giant', true, false, NULL, 5, NULL);
INSERT INTO public.planet VALUES (40, 'Mercury', NULL, 'Rocky', true, false, 2440, 5, NULL);
INSERT INTO public.planet VALUES (7, 'Neptune', NULL, 'Ice Giant', true, true, NULL, 5, NULL);
INSERT INTO public.planet VALUES (41, 'Uranus', NULL, 'Ice Giant', true, true, 25362, 5, NULL);
INSERT INTO public.planet VALUES (42, 'Veles', NULL, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.planet VALUES (43, 'Noveria', NULL, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.planet VALUES (44, 'Antitarra', NULL, NULL, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (45, 'Xawin', NULL, NULL, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.planet VALUES (46, 'Yunthorl', NULL, NULL, NULL, NULL, NULL, 8, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centau AB', 'Alpha Centauri is a gravitationally bound system of the closest stars and exoplanets to our Solar System at 4.37 light-years (1.34 parseces) from the Sun.', '{"Alpha Centauri","Gliese 559","FK5 538","Rigil Kentaurus"}', 'Spectroscopic Binary', 0.14, 4.32, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Sirius is the brightest star in the night sky. Its name is derived from the Greek word...', '{"Alpha Canis Major","9 Canis",Majoris,"HD 48915"}', 'Double or Multiple Star', -1.09, 8.60, 1);
INSERT INTO public.star VALUES (3, 'Acrux', 'Acrux is the brightest star in the southern constellation of Crux. It has the Bayer designation a Crucis, which is Latinised to Alpha Crucis and abbreviated Alpha Cru or a Cru...', '{"Alpha Crucis","HIP 60718",SBC7462}', 'Spectroscopic Binary', 0.67, 321.97, 1);
INSERT INTO public.star VALUES (4, 'Regulus', NULL, '{"Alpha Leonis","32 Leonis","HD 87901","HR 3982"}', 'High proper-motion Star', 1.32, 79.30, 1);
INSERT INTO public.star VALUES (5, 'Sun', 'The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma, heated to incandescence by nuclear fusion reactions in its core, radiating the energy mainly as visible light, ultraviolet, and infrared radiation.', '{Sol,Helios}', 'G2V', -26.71, 0, 1);
INSERT INTO public.star VALUES (6, 'Procyon', 'Procyon is the brightest star in the constellation of Canis Minor and usually the eighth-brightest star in the night sky, with an apparent visual magnitude of 0.34. It has Bayer designation a Canis Minor, which is Latinized to Alpha...', '{"Alpha Canis Minor","10 Canis Minor","HD 61421","HR 2943"}', 'DQZ', 0.46, 11.46, 1);
INSERT INTO public.star VALUES (7, 'Pax', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (8, 'Strenuus', NULL, NULL, NULL, NULL, NULL, 1);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 46, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: cluster cluster_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_cluster_id_key UNIQUE (cluster_id);


--
-- Name: cluster cluster_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_id PRIMARY KEY (cluster_id);


--
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


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
-- Name: cluster cluster_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

