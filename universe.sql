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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    number integer NOT NULL,
    diameter_in_km character varying(20),
    mass_in_kg numeric,
    rotation_period_in_hrs numeric,
    orbital_period_in_years numeric,
    spectral_class character varying(5),
    semi_major_axis_in_au numeric,
    orbital_eccentricity numeric,
    orbital_inclination_in_deg numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    iau_abbreviation character(3),
    nasa_abbreviation character(4),
    genitive character varying(30),
    origin character varying(70),
    meaning character varying(50),
    brightest_star character varying(30),
    zodiac boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(45) NOT NULL,
    galaxy_type character varying(30),
    distance_from_earth_in_mpc numeric NOT NULL,
    absolute_magnitude numeric,
    group_membership character varying(30),
    notes text,
    diameter_in_ly integer
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
    distance_from_planet integer,
    equatorial_diameter numeric,
    mass numeric,
    semi_major_axis_in_km numeric,
    orbital_period_in_days numeric,
    inclination numeric,
    orbital_eccentricity numeric,
    axial_tilt numeric,
    atmosphere character varying(15),
    planet_id integer NOT NULL
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
    confirmed_moons integer,
    equatorial_diameter numeric,
    mass numeric,
    semi_major_axis_in_au numeric,
    orbital_period_in_years numeric,
    inclination numeric,
    orbital_eccentricity numeric,
    rotation_period_in_days numeric,
    axial_tilt numeric,
    atmosphere character varying(15),
    planet_type character varying(15),
    has_moons boolean,
    rings boolean,
    star_id integer NOT NULL
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
    start_info text,
    galaxy_id integer NOT NULL,
    constellation_id integer,
    designation character varying(25),
    comments text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 1, '965 x 961 x 891', 939300, 9.074, 4.60, 'C', 2.768, 0.0758, 10.59);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 1, 2, '582 x 556 x 500', 205000, 7.813, 4.61, 'U', 2.772, 0.2310, 34.84);
INSERT INTO public.asteroid VALUES (3, 'Juno', 1, 3, '234', 20000, 7.210, 4.36, 'S', 2.670, 0.2563, 12.99);
INSERT INTO public.asteroid VALUES (4, 'Vesta', 1, 4, '569 x 555 x 453', 259000, 5.342, 3.63, 'U', 2.362, 0.0889, 7.14);
INSERT INTO public.asteroid VALUES (5, 'Lutetia', 1, 21, '124 x 101 x 80', 1700, 8.168, 3.80, 'C', 2.435, 0.1646, 3.06);
INSERT INTO public.asteroid VALUES (6, 'Eugenia', 1, 45, '215', 6100, 5.699, 4.49, 'FC', 2.721, 0.0835, 6.60);
INSERT INTO public.asteroid VALUES (7, 'Siwa', 1, 140, '103', 1500, 18.5, 4.51, 'C', 2.732, 0.2161, 3.19);
INSERT INTO public.asteroid VALUES (8, 'Kleopatra', 1, 216, '217 x 94', NULL, 5.385, 4.67, 'M', 2.794, 0.2504, 13.11);
INSERT INTO public.asteroid VALUES (9, 'Ida', 1, 243, '58 x 23', 100, 4.633, 4.84, 'S', 2.861, 0.0412, 1.13);
INSERT INTO public.asteroid VALUES (10, 'Mathilde', 1, 253, '66 x 48 x 46', 103.3, 417.7, 4.31, 'C', 2.647, 0.2655, 6.74);
INSERT INTO public.asteroid VALUES (11, 'Eros', 1, 433, '33 x 13 x 13', 6.69, 5.270, 1.76, 'S', 1.458, 0.2227, 10.83);
INSERT INTO public.asteroid VALUES (12, 'Icarus', 1, 1566, '1.4', 0.001, 2.273, 1.12, 'U', 1.078, 0.8269, 22.83);
INSERT INTO public.asteroid VALUES (13, 'Geographos', 1, 1620, '2.0', 0.004, 5.222, 1.39, 'S', 1.245, 0.3354, 13.34);
INSERT INTO public.asteroid VALUES (14, 'Apollo', 1, 1862, '1.6', 0.002, 3.063, 1.81, 'S', 1.470, 0.5599, 6.35);
INSERT INTO public.asteroid VALUES (15, 'Chiron', 1, 2060, '180', 4000, 5.9, 50.7, 'B', 13.637, 0.3827, 6.94);
INSERT INTO public.asteroid VALUES (16, 'Shipka', 1, 2530, NULL, NULL, NULL, 5.25, NULL, 3.017, 0.1280, 10.11);
INSERT INTO public.asteroid VALUES (17, 'Rodari', 1, 2703, NULL, NULL, 5.5, 3.25, NULL, 2.194, 0.0566, 6.03);
INSERT INTO public.asteroid VALUES (18, 'Steins', 1, 2867, '6.8 x 5.7 x 4.4', NULL, 6.049, 3.64, 'E', 2.363, 0.1455, 9.93);
INSERT INTO public.asteroid VALUES (19, 'McAuliffe', 1, 3352, '2 - 5', NULL, NULL, 2.57, NULL, 1.879, 0.3690, 4.77);
INSERT INTO public.asteroid VALUES (20, 'Mimistrobell', 1, 3840, NULL, NULL, NULL, 3.38, NULL, 2.250, 0.0827, 3.92);
INSERT INTO public.asteroid VALUES (21, 'Toutatis', 1, 4179, '4.6 x 2.4 x 1.9', 0.05, 130, 3.98, 'S', 2.534, 0.6294, 0.45);
INSERT INTO public.asteroid VALUES (22, 'Castalia', 1, 4769, '1.8 x 0.8', 0.0005, 4.095, 1.10, NULL, 1.063, 0.4831, 8.89);
INSERT INTO public.asteroid VALUES (23, 'Otawara', 1, 4979, '5.5', 0.2, 2.707, 3.19, NULL, 2.168, 0.1441, 0.91);
INSERT INTO public.asteroid VALUES (24, 'AnneFrank', 1, 5535, '4.8', NULL, 15.12, 3.29, 'S', 2.213, 0.0635, 4.25);
INSERT INTO public.asteroid VALUES (25, 'Braille', 1, 9969, '2.2 x 1.0', NULL, 226.4, 3.58, 'B', 2.341, 0.4333, 29.00);
INSERT INTO public.asteroid VALUES (26, 'Itokawa', 1, 25143, '0.5 x 0.3 x 0.2', 0.000035, 12.13, 1.52, 'S', 1.324, 0.2801, 1.62);
INSERT INTO public.asteroid VALUES (27, 'Bennu', 1, 101955, '0.49', 0.000073, 4.276, 1.20, NULL, 1.126, 0.2037, 6.03);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'And', 'Andr', 'Andromedae', 'ancient (Ptolemy)', 'Andromeda (The chained maiden or princess)', 'Alpheratz', false);
INSERT INTO public.constellation VALUES (2, 'Antlia', 'Ant', 'Antl', 'Antliae', '1763, Lacaille', 'air pump', 'α Antliae', false);
INSERT INTO public.constellation VALUES (3, 'Apus', 'Aps', 'Apus', 'Apodis', '1603, Uranometria, created by Keyser and de Houtman', 'Bird-of-paradise/Exotic Bird/Extraordinary Bird', 'α Apodis', false);
INSERT INTO public.constellation VALUES (4, 'Aquarius', 'Aqr', 'Aqar', 'Aquarii', 'ancient (Ptolemy)', 'water-bearer', 'Sadalsuud', true);
INSERT INTO public.constellation VALUES (5, 'Aquila', 'Aql', 'Aqil', 'Aquilae', 'ancient (Ptolemy)', 'eagle', 'Altair', false);
INSERT INTO public.constellation VALUES (6, 'Ara', 'Ara', 'Arae', 'Arae', 'ancient (Ptolemy)', 'altar', 'β Arae', false);
INSERT INTO public.constellation VALUES (7, 'Aries', 'Ari', 'Arie', 'Arietis', 'ancient (Ptolemy)', 'ram', 'Hamal', true);
INSERT INTO public.constellation VALUES (8, 'Auriga', 'Aur', 'Auri', 'Aurigae', 'ancient (Ptolemy)', 'charioteer', 'Capella', false);
INSERT INTO public.constellation VALUES (9, 'Boötes', 'Boo', 'Boot', 'Boötis', 'ancient (Ptolemy)', 'herdsman', 'Arcturus', false);
INSERT INTO public.constellation VALUES (10, 'Caelum', 'Cae', 'Cael', 'Caeli', '1763, Lacaille', 'chisel or engraving tool', 'α Caeli', false);
INSERT INTO public.constellation VALUES (11, 'Camelopardalis', 'Cam', 'Caml', 'Camelopardalis', '1613, Plancius', 'giraffe', 'β Camelopardalis', false);
INSERT INTO public.constellation VALUES (12, 'Cancer', 'Cnc', 'Canc', 'Cancri', 'ancient (Ptolemy)', 'crab', 'Tarf', true);
INSERT INTO public.constellation VALUES (13, 'Canes Venatici', 'CVn', 'CVen', 'Canum Venaticorum', '1690, Firmamentum Sobiescianum, Hevelius', 'hunting dogs', 'Cor Caroli', false);
INSERT INTO public.constellation VALUES (14, 'Canis Major', 'CMa', 'CMaj', 'Canis Majoris', 'ancient (Ptolemy)', 'greater dog', 'Sirius', false);
INSERT INTO public.constellation VALUES (15, 'Canis Minor', 'CMi', 'CMin', 'Canis Minoris', 'ancient (Ptolemy)', 'lesser dog', 'Procyon', false);
INSERT INTO public.constellation VALUES (16, 'Capricornus', 'Cap', 'Capr', 'Capricorni', 'ancient (Ptolemy)', 'sea goat', 'Deneb Algedi', true);
INSERT INTO public.constellation VALUES (17, 'Carina', 'Car', 'Cari', 'Carinae', '1763, Lacaille, split from Argo Navis', 'keel', 'Canopus', false);
INSERT INTO public.constellation VALUES (18, 'Cassiopeia', 'Cas', 'Cass', 'Cassiopeiae', 'ancient (Ptolemy)', 'Cassiopeia (mythological character)', 'Schedar', false);
INSERT INTO public.constellation VALUES (19, 'Centaurus', 'Cen', 'Cent', 'Centauri', 'ancient (Ptolemy)', 'centaur', 'Rigil Kentaurus', false);
INSERT INTO public.constellation VALUES (20, 'Cepheus', 'Cep', 'Ceph', 'Cephei', 'ancient (Ptolemy)', 'Cepheus (mythological character)', 'Alderamin', false);
INSERT INTO public.constellation VALUES (21, 'Cetus', 'Cet', 'Ceti', 'Ceti', 'ancient (Ptolemy)', 'sea monster (later interpreted as a whale)', 'Diphda', false);
INSERT INTO public.constellation VALUES (22, 'Chamaeleon', 'Cha', 'Cham', 'Chamaeleontis', '1603, Uranometria, created by Keyser and de Houtman', 'chameleon', 'α Chamaeleontis', false);
INSERT INTO public.constellation VALUES (23, 'Circinus', 'Cir', 'Circ', 'Circini', '1763, Lacaille', 'compasses', 'α Circini', false);
INSERT INTO public.constellation VALUES (24, 'Columba', 'Col', 'Colm', 'Columbae', '1592, Plancius, split from Canis Major', 'dove', 'Phact', false);
INSERT INTO public.constellation VALUES (25, 'Coma Berenices', 'Com', 'Coma', 'Comae Berenices', '1536, Caspar Vopel, split from Leo', 'Berenice''s hair', 'β Comae Berenices', false);
INSERT INTO public.constellation VALUES (26, 'Corona Australis', 'CrA', 'CorA', 'Coronae Australis', 'ancient (Ptolemy)', 'southern crown', 'Meridiana', false);
INSERT INTO public.constellation VALUES (27, 'Corona Borealis', 'CrB', 'CorB', 'Coronae Borealis', 'ancient (Ptolemy)', 'northern crown', 'Alphecca', false);
INSERT INTO public.constellation VALUES (28, 'Corvus', 'Crv', 'Corv', 'Corvi', 'ancient (Ptolemy)', 'crow', 'Gienah', false);
INSERT INTO public.constellation VALUES (29, 'Crater', 'Crt', 'Crat', 'Crateris', 'ancient (Ptolemy)', 'cup', 'δ Crateris', false);
INSERT INTO public.constellation VALUES (30, 'Crux', 'Cru', 'Cruc', 'Crucis', '1603, Uranometria, split from Centaurus', 'southern cross', 'Acrux', false);
INSERT INTO public.constellation VALUES (31, 'Cygnus', 'Cyg', 'Cygn', 'Cygni', 'ancient (Ptolemy)', 'swan or Northern Cross', 'Deneb', false);
INSERT INTO public.constellation VALUES (32, 'Delphinus', 'Del', 'Dlph', 'Delphini', 'ancient (Ptolemy)', 'dolphin', 'Rotanev', false);
INSERT INTO public.constellation VALUES (33, 'Dorado', 'Dor', 'Dora', 'Doradus', '1603, Uranometria, created by Keyser and de Houtman', 'dolphinfish', 'α Doradus', false);
INSERT INTO public.constellation VALUES (34, 'Draco', 'Dra', 'Drac', 'Draconis', 'ancient (Ptolemy)', 'dragon', 'Eltanin', false);
INSERT INTO public.constellation VALUES (35, 'Equuleus', 'Equ', 'Equl', 'Equulei', 'ancient (Ptolemy)', 'pony', 'Kitalpha', false);
INSERT INTO public.constellation VALUES (36, 'Eridanus', 'Eri', 'Erid', 'Eridani', 'ancient (Ptolemy)', 'river Eridanus (mythology)', 'Achernar', false);
INSERT INTO public.constellation VALUES (37, 'Fornax', 'For', 'Forn', 'Fornacis', '1763, Lacaille', 'chemical furnace', 'Dalim', false);
INSERT INTO public.constellation VALUES (38, 'Gemini', 'Gem', 'Gemi', 'Geminorum', 'ancient (Ptolemy)', 'twins', 'Pollux', true);
INSERT INTO public.constellation VALUES (39, 'Grus', 'Gru', 'Grus', 'Gruis', '1603, Uranometria, created by Keyser and de Houtman', 'crane', 'Alnair', false);
INSERT INTO public.constellation VALUES (40, 'Hercules', 'Her', 'Herc', 'Herculis', 'ancient (Ptolemy)', 'Hercules (mythological character)', 'Kornephoros', false);
INSERT INTO public.constellation VALUES (41, 'Horologium', 'Hor', 'Horo', 'Horologii', '1763, Lacaille', 'pendulum clock', 'α Horologii', false);
INSERT INTO public.constellation VALUES (42, 'Hydra', 'Hya', 'Hyda', 'Hydrae', 'ancient (Ptolemy)', 'Hydra (mythological creature)', 'Alphard', false);
INSERT INTO public.constellation VALUES (43, 'Hydrus', 'Hyi', 'Hydi', 'Hydri', '1603, Uranometria, created by Keyser and de Houtman', 'lesser water snake', 'β Hydri', false);
INSERT INTO public.constellation VALUES (44, 'Indus', 'Ind', 'Indi', 'Indi', '1603, Uranometria, created by Keyser and de Houtman', 'Indian (of unspecified type)', 'α Indi', false);
INSERT INTO public.constellation VALUES (45, 'Lacerta', 'Lac', 'Lacr', 'Lacertae', '1690, Firmamentum Sobiescianum, Hevelius', 'lizard', 'α Lacertae', false);
INSERT INTO public.constellation VALUES (46, 'Leo', 'Leo', 'Leon', 'Leonis', 'ancient (Ptolemy)', 'lion', 'Regulus', true);
INSERT INTO public.constellation VALUES (47, 'Leo Minor', 'LMi', 'LMin', 'Leonis Minoris', '1690, Firmamentum Sobiescianum, Hevelius', 'lesser lion', 'Praecipua', false);
INSERT INTO public.constellation VALUES (48, 'Lepus', 'Lep', 'Leps', 'Leporis', 'ancient (Ptolemy)', 'hare', 'Arneb', false);
INSERT INTO public.constellation VALUES (49, 'Libra', 'Lib', 'Libr', 'Librae', 'ancient (Ptolemy)', 'balance', 'Zubeneschamali', true);
INSERT INTO public.constellation VALUES (50, 'Lupus', 'Lup', 'Lupi', 'Lupi', 'ancient (Ptolemy)', 'wolf', 'α Lupi', false);
INSERT INTO public.constellation VALUES (51, 'Lynx', 'Lyn', 'Lync', 'Lyncis', '1690, Firmamentum Sobiescianum, Hevelius', 'lynx', 'α Lyncis', false);
INSERT INTO public.constellation VALUES (52, 'Lyra', 'Lyr', 'Lyra', 'Lyrae', 'ancient (Ptolemy)', 'lyre / harp', 'Vega', false);
INSERT INTO public.constellation VALUES (53, 'Mensa', 'Men', 'Mens', 'Mensae', '1763, Lacaille, as Mons Mensæ', 'Table Mountain (South Africa)', 'α Mensae', false);
INSERT INTO public.constellation VALUES (54, 'Microscopium', 'Mic', 'Micr', 'Microscopii', '1763, Lacaille', 'microscope', 'γ Microscopii', false);
INSERT INTO public.constellation VALUES (55, 'Monoceros', 'Mon', 'Mono', 'Monocerotis', '1613, Plancius', 'unicorn', 'β Monocerotis', false);
INSERT INTO public.constellation VALUES (56, 'Musca', 'Mus', 'Musc', 'Muscae', '1603, Uranometria, created by Keyser and de Houtman', 'fly', 'α Muscae', false);
INSERT INTO public.constellation VALUES (57, 'Norma', 'Nor', 'Norm', 'Normae', '1763, Lacaille', 'carpenter''s level', 'γ2 Normae', false);
INSERT INTO public.constellation VALUES (58, 'Octans', 'Oct', 'Octn', 'Octantis', '1763, Lacaille', 'octant (instrument)', 'ν Octantis', false);
INSERT INTO public.constellation VALUES (59, 'Ophiuchus', 'Oph', 'Ophi', 'Ophiuchi', 'ancient (Ptolemy)', 'serpent-bearer', 'Rasalhague', false);
INSERT INTO public.constellation VALUES (60, 'Orion', 'Ori', 'Orio', 'Orionis', 'ancient (Ptolemy)', 'Orion (mythological character)', 'Rigel', false);
INSERT INTO public.constellation VALUES (61, 'Pavo', 'Pav', 'Pavo', 'Pavonis', '1603, Uranometria, created by Keyser and de Houtman', 'peacock', 'Peacock', false);
INSERT INTO public.constellation VALUES (62, 'Pegasus', 'Peg', 'Pegs', 'Pegasi', 'ancient (Ptolemy)', 'Pegasus (mythological winged horse)', 'Enif', false);
INSERT INTO public.constellation VALUES (63, 'Perseus', 'Per', 'Pers', 'Persei', 'ancient (Ptolemy)', 'Perseus (mythological character)', 'Mirfak', false);
INSERT INTO public.constellation VALUES (64, 'Phoenix', 'Phe', 'Phoe', 'Phoenicis', '1603, Uranometria, created by Keyser and de Houtman', 'phoenix', 'Ankaa', false);
INSERT INTO public.constellation VALUES (65, 'Pictor', 'Pic', 'Pict', 'Pictoris', '1763, Lacaille, as Equuleus Pictoris', 'easel', 'α Pictoris', false);
INSERT INTO public.constellation VALUES (66, 'Pisces', 'Psc', 'Pisc', 'Piscium', 'ancient (Ptolemy)', 'fishes', 'Alpherg', true);
INSERT INTO public.constellation VALUES (67, 'Piscis Austrinus', 'PsA', 'PscA', 'Piscis Austrini', 'ancient (Ptolemy)', 'southern fish', 'Fomalhaut', false);
INSERT INTO public.constellation VALUES (68, 'Puppis', 'Pup', 'Pupp', 'Puppis', '1763, Lacaille, split from Argo Navis', 'poop deck', 'Naos', false);
INSERT INTO public.constellation VALUES (69, 'Pyxis', 'Pyx', 'Pyxi', 'Pyxidis', '1763, Lacaille', 'mariner''s compass', 'α Pyxidis', false);
INSERT INTO public.constellation VALUES (70, 'Reticulum', 'Ret', 'Reti', 'Reticuli', '1763, Lacaille', 'eyepiece graticule', 'α Reticuli', false);
INSERT INTO public.constellation VALUES (71, 'Sagitta', 'Sge', 'Sgte', 'Sagittae', 'ancient (Ptolemy)', 'arrow', 'γ Sagittae', false);
INSERT INTO public.constellation VALUES (72, 'Sagittarius', 'Sgr', 'Sgtr', 'Sagittarii', 'ancient (Ptolemy)', 'archer', 'Kaus Australis', true);
INSERT INTO public.constellation VALUES (73, 'Scorpius', 'Sco', 'Scor', 'Scorpii', 'ancient (Ptolemy)', 'scorpion', 'Antares', true);
INSERT INTO public.constellation VALUES (74, 'Sculptor', 'Scl', 'Scul', 'Sculptoris', '1763, Lacaille', 'sculptor', 'α Sculptoris', false);
INSERT INTO public.constellation VALUES (75, 'Scutum', 'Sct', 'Scut', 'Scuti', '1690, Firmamentum Sobiescianum, Hevelius', 'shield (of Sobieski)', 'α Scuti', false);
INSERT INTO public.constellation VALUES (76, 'Serpens[12]', 'Ser', 'Serp', 'Serpentis', 'ancient (Ptolemy)', 'snake', 'Unukalhai', false);
INSERT INTO public.constellation VALUES (77, 'Sextans', 'Sex', 'Sext', 'Sextantis', '1690, Firmamentum Sobiescianum, Hevelius', 'sextant', 'α Sextantis', false);
INSERT INTO public.constellation VALUES (78, 'Taurus', 'Tau', 'Taur', 'Tauri', 'ancient (Ptolemy)', 'bull', 'Aldebaran', true);
INSERT INTO public.constellation VALUES (79, 'Telescopium', 'Tel', 'Tele', 'Telescopii', '1763, Lacaille', 'telescope', 'α Telescopii', false);
INSERT INTO public.constellation VALUES (80, 'Triangulum', 'Tri', 'Tria', 'Trianguli', 'ancient (Ptolemy)', 'triangle', 'β Trianguli', false);
INSERT INTO public.constellation VALUES (81, 'Triangulum Australe', 'TrA', 'TrAu', 'Trianguli Australis', '1603, Uranometria, created by Keyser and de Houtman', 'southern triangle', 'Atria', false);
INSERT INTO public.constellation VALUES (82, 'Tucana', 'Tuc', 'Tucn', 'Tucanae', '1603, Uranometria, created by Keyser and de Houtman', 'toucan', 'α Tucanae', false);
INSERT INTO public.constellation VALUES (83, 'Ursa Major', 'UMa', 'UMaj', 'Ursae Majoris', 'ancient (Ptolemy)', 'great bear', 'Alioth', false);
INSERT INTO public.constellation VALUES (84, 'Ursa Minor', 'UMi', 'UMin', 'Ursae Minoris', 'ancient (Ptolemy)', 'lesser bear', 'Polaris', false);
INSERT INTO public.constellation VALUES (85, 'Vela', 'Vel', 'Velr', 'Velorum', '1763, Lacaille, split from Argo Navis', 'sails', 'γ2 Velorum', false);
INSERT INTO public.constellation VALUES (86, 'Virgo', 'Vir', 'Virg', 'Virginis', 'ancient (Ptolemy)', 'virgin or maiden', 'Spica', true);
INSERT INTO public.constellation VALUES (87, 'Volans', 'Vol', 'Voln', 'Volantis', '1603, Uranometria, created by Keyser and de Houtman, as Piscis Volans', 'flying fish', 'β Volantis', false);
INSERT INTO public.constellation VALUES (88, 'Vulpecula', 'Vul', 'Vulp', 'Vulpeculae', '1690, Firmamentum Sobiescianum, Hevelius, as Vulpecula cum Ansere', 'fox', 'Anser', false);
INSERT INTO public.constellation VALUES (89, 'local', '   ', '    ', '', '', '', 'α Sun', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SBbc', 0.008, -20.8, 'Local Group', 'Home galaxy of Earth. Barred spiral galaxy.', 87400);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'Irr', 0.008, -14.5, 'Local Group', 'Satellite of Milky Way (accretion by Milky Way)', NULL);
INSERT INTO public.galaxy VALUES (3, 'Draco II', NULL, 0.0215, -0.8, 'Local Group', 'Satellite of Milky Way', 120);
INSERT INTO public.galaxy VALUES (4, 'Tucana III', NULL, 0.0229, -1.3, 'Local Group', 'Satellite of Milky Way that is being tidally disrupted', 220);
INSERT INTO public.galaxy VALUES (5, 'Segue 1', 'dSph or Glob Clus', 0.023, -3.0, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Sphr SagDEG', 'dSph/E7', 0.024, -12.67, 'Local Group', 'Satellite of Milky Way (partial accretion by Milky Way)', 10000);
INSERT INTO public.galaxy VALUES (7, 'Hydrus I', NULL, 0.0276, -4.71, 'Local Group', 'Satellite of Milky Way, possibly associated with the Magellanic Clouds', 348);
INSERT INTO public.galaxy VALUES (8, 'Carina III', NULL, 0.0278, -2.4, 'Local Group', 'Satellite of Milky Way', 200);
INSERT INTO public.galaxy VALUES (9, 'Ursa Major II Dwarf', 'dSph', 0.030, -4.2, 'Local Group', 'Satellite of Milky Way (accretion by Milky Way)', 1800);
INSERT INTO public.galaxy VALUES (10, 'Triangulum II', NULL, 0.030, -1.8, 'Local Group', 'Satellite of Milky Way(accretion by Milky Way)', NULL);
INSERT INTO public.galaxy VALUES (11, 'Reticulum II', NULL, 0.0314, -3.1, 'Local Group', 'Satellite of Milky Way', 378);
INSERT INTO public.galaxy VALUES (12, 'Segue 2', 'dSph', 0.035, -2.5, 'Local Group', 'Satellite of Milky Way, one of the smallest known galaxies', 220);
INSERT INTO public.galaxy VALUES (13, 'Carina II', NULL, 0.0374, -4.5, 'Local Group', 'Satellite of Milky Way', 590);
INSERT INTO public.galaxy VALUES (14, 'Willman 1', 'dSph or Star Clus', 0.038, -2.7, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (15, 'Boötes II', 'dSph', 0.042, -2.7, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (16, 'Coma Berenices Dwarf', 'dSph', 0.042, -3.6, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (17, 'Pictor II', NULL, 0.045, -3.2, 'Local Group', 'Satellite of Milky Way possibly associated with the Large Magellanic Cloud', 300);
INSERT INTO public.galaxy VALUES (18, 'Boötes III', 'dSph', 0.046, -5.8, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (19, 'Tucana IV', NULL, 0.048, -3.5, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (20, 'Large Magellanic Cloud (LMC)', 'SB(s)m', 0.050, -17.93, 'Local Group', 'Satellite of Milky Way', 32200);
INSERT INTO public.galaxy VALUES (21, 'Grus II', NULL, 0.055, -3.9, 'Local Group', 'Satellite of Milky Way', 607);
INSERT INTO public.galaxy VALUES (22, 'Tucana II', NULL, 0.057, -3.8, 'Local Group', 'Satellite of Milky Way', 1080);
INSERT INTO public.galaxy VALUES (23, 'Boötes I', 'dSph', 0.060, -5.8, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (24, 'Small Magellanic Cloud (SMC, NGC 292)', 'SB(s)m pec', 0.063, -16.35, 'Local Group', 'Satellite of Milky Way', 18900);
INSERT INTO public.galaxy VALUES (25, 'Ursa Minor Dwarf', 'dE4', 0.063, -7.13, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (26, 'Eridanus IV', NULL, 0.0767, -4.7, 'Local Group', 'Satellite of Milky Way', 489);
INSERT INTO public.galaxy VALUES (27, 'Horologium II', NULL, 0.078, -2.6, 'Local Group', 'Satellite of Milky Way', 287);
INSERT INTO public.galaxy VALUES (28, 'Draco Dwarf (DDO 208)', 'dE0 pec', 0.079, -8.74, 'Local Group', 'Satellite of Milky Way with a large amount of dark matter', 2700);
INSERT INTO public.galaxy VALUES (29, 'Horologium I', NULL, 0.079, -3.4, 'Local Group', 'Satellite of Milky Way', 196);
INSERT INTO public.galaxy VALUES (30, 'Pisces Overdensity', 'dIrr/dSph', 0.08, -10.35, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (31, 'Sextans Dwarf Sph', 'dSph', 0.086, -7.98, 'Local Group', 'Satellite of Milky Way', 8400);
INSERT INTO public.galaxy VALUES (32, 'Sculptor Dwarf (ESO 351-G30)', 'dE3', 0.088, -9.77, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (33, 'Pegasus IV', NULL, 0.090, -4.25, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (34, 'Virgo I', NULL, 0.091, -0.3, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (35, 'Reticulum III', NULL, 0.092, -3.3, 'Local Group', 'Satellite of Milky Way', 420);
INSERT INTO public.galaxy VALUES (36, 'Ursa Major I Dwarf (UMa I dSph)', 'dSph', 0.0968, -6.75, 'Local Group', 'Satellite of Milky Way', 2000);
INSERT INTO public.galaxy VALUES (37, 'Phoenix II', NULL, 0.100, -2.7, 'Local Group', 'Satellite of Milky Way', 290);
INSERT INTO public.galaxy VALUES (38, 'Carina Dwarf (ESO 206-G220)', 'dE3', 0.10, -8.97, 'Local Group', 'Satellite of Milky Way', 1600);
INSERT INTO public.galaxy VALUES (39, 'Aquarius II', NULL, 0.1079, -4.36, 'Local Group', 'Satellite of Milky Way', 1040);
INSERT INTO public.galaxy VALUES (40, 'Pictor I', NULL, 0.114, -3.1, 'Local Group', 'Satellite of Milky Way', 190);
INSERT INTO public.galaxy VALUES (41, 'Crater II', NULL, 0.1175, -8.2, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (42, 'Grus I', NULL, 0.120, -3.4, 'Local Group', 'Satellite of Milky Way', 404);
INSERT INTO public.galaxy VALUES (43, 'Antlia 2', NULL, 0.1318, -9.86, 'Local Group', 'Satellite of Milky Way, most diffuse galaxy ever found', NULL);
INSERT INTO public.galaxy VALUES (44, 'Hercules Dwarf', 'dSph', 0.133, -5.3, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (45, 'Fornax Dwarf (ESO 356-G04)', 'dSph/E2', 0.143, -11.5, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (46, 'Canes Venatici II Dwarf', 'dSph', 0.15, -4.8, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (47, 'Hydra II', 'dSph', 0.151, -5.1, 'Local Group', 'Satellite of Milky Way', 500);
INSERT INTO public.galaxy VALUES (48, 'Leo IV Dwarf', 'dSph', 0.154, -5.5, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (49, 'Leo V Dwarf', 'dSph', 0.175, -5.2, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (50, 'Pisces II', 'dG', 0.183, -4.28, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (51, 'Columba I', NULL, 0.183, -4.2, 'Local Group', 'Satellite of Milky Way', 760);
INSERT INTO public.galaxy VALUES (52, 'Boötes IV', NULL, 0.209, -4.53, 'Local Group', 'Satellite of Milky Way', 3000);
INSERT INTO public.galaxy VALUES (53, 'Leo II Dwarf (Leo B, DDO 93)', 'dE0 pec', 0.215, -9.23, 'Local Group', 'Satellite of Milky Way', 4100);
INSERT INTO public.galaxy VALUES (54, 'Pegasus III', NULL, 0.215, -4.17, 'Local Group', 'Satellite of Milky Way', 350);
INSERT INTO public.galaxy VALUES (55, 'Canes Venatici I Dwarf', 'dSph', 0.218, -7.9, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (56, 'Cetus III', NULL, 0.251, -2.45, 'Local Group', 'Satellite of Milky Way', 580);
INSERT INTO public.galaxy VALUES (57, 'Leo I Dwarf (DDO 74, UGC 5470)', 'dE3', 0.251, -10.97, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (58, 'Eridanus II', NULL, 0.366, -7.1, 'Local Group', 'Satellite of Milky Way', 1810);
INSERT INTO public.galaxy VALUES (59, 'Leo T Dwarf', 'dIrr/dSph', 0.413, NULL, 'Local Group', 'Satellite of Milky Way?', 2300);
INSERT INTO public.galaxy VALUES (60, 'Phoenix Dwarf Galaxy (P 6830)', 'IAm', 0.44, -10.22, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (61, 'Pisces V (Andromeda XVI)', 'dSph', 0.55, -7.6, 'Local Group', 'Satellite of Andromeda', 985);
INSERT INTO public.galaxy VALUES (62, 'Barnard''s Galaxy (NGC 6822)', 'IB(s)m IV-V', 0.570, -15.22, 'Local Group', 'It contains several large H II regions', 7000);
INSERT INTO public.galaxy VALUES (63, 'NGC 185', 'dE3 pec', 0.63, -14.76, 'Local Group', 'Satellite of Andromeda; possibly closest Seyfert galaxy to Earth', NULL);
INSERT INTO public.galaxy VALUES (64, 'Andromeda II', 'dE0', 0.68, -12.6, 'Local Group', 'Satellite of Andromeda', 6820);
INSERT INTO public.galaxy VALUES (65, 'Cassiopeia II (Andromeda XXX)', 'dSph', 0.681, -8.0, 'Local Group', 'Satellite of Andromeda', 1800);
INSERT INTO public.galaxy VALUES (66, 'IC 1613 (UGC 668)', 'IAB(s)m V', 0.686, -14.51, 'Local Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (67, 'Pegasus V (Andromeda XXXIV)', NULL, 0.692, -6.3, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (68, 'Leo A (Leo III, DDO 69)', 'IBm V', 0.717, -11.68, 'Local Group', 'Satellite of Milky Way', NULL);
INSERT INTO public.galaxy VALUES (69, 'Andromeda XVII', 'dSph', 0.727, -7.8, 'Local Group', 'Satellite of Andromeda', 1900);
INSERT INTO public.galaxy VALUES (70, 'Andromeda XXV', 'dSph', 0.736, -9.0, 'Local Group', 'Satellite of Andromeda', 3560);
INSERT INTO public.galaxy VALUES (71, 'Andromeda XI', 'dSph', 0.74, -7.3, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (72, 'Andromeda XX', 'dSph', 0.741, -6.4, 'Local Group', 'Satellite of Andromeda', 590);
INSERT INTO public.galaxy VALUES (73, 'Andromeda XXIII', 'dSph', 0.748, -9.8, 'Local Group', 'Satellite of Andromeda', 7770);
INSERT INTO public.galaxy VALUES (74, 'IC 10 (UGC 192)', 'dIrr IV/BCD', 0.750, -15.57, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (75, 'Andromeda III', 'dE2', 0.75, -10.1, 'Local Group', 'Satellite of Andromeda', 2750);
INSERT INTO public.galaxy VALUES (76, 'Cassiopeia Dwarf (Cas dSph, Andromeda VII)', 'dSph', 0.75, -11.67, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (77, 'Andromeda XXVI', 'dSph', 0.754, -5.8, 'Local Group', 'Satellite of Andromeda', 980);
INSERT INTO public.galaxy VALUES (78, 'Cetus Dwarf', 'dSph/E4', 0.754, -10.18, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (79, 'Pisces III (Andromeda XIII)', 'dSph', 0.760, -6.5, 'Local Group', 'Satellite of Andromeda', 850);
INSERT INTO public.galaxy VALUES (80, 'Andromeda XV', 'dSph', 0.76, -8.4, 'Local Group', 'Satellite of Andromeda', 1840);
INSERT INTO public.galaxy VALUES (81, 'M32 (NGC 221)', 'E2', 0.763, -15.96, 'Local Group', 'Close Satellite of Andromeda', 6500);
INSERT INTO public.galaxy VALUES (82, 'Andromeda IX', 'dE', 0.767, -7.5, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (83, 'Pisces Dwarf (LGS 3)', 'dIrr/dSph', 0.770, -7.96, 'Local Group', 'Satellite of Triangulum', NULL);
INSERT INTO public.galaxy VALUES (84, 'Cassiopeia III (Andromeda XXXII)', NULL, 0.772, -12.3, 'Local Group', 'Satellite of Andromeda', 9500);
INSERT INTO public.galaxy VALUES (85, 'Andromeda V', 'dSph', 0.773, -8.41, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (86, 'Lacerta I (Andromeda XXXI)', 'dSph', 0.773, -11.4, 'Local Group', 'Satellite of Andromeda', 4750);
INSERT INTO public.galaxy VALUES (87, 'NGC 147 (DDO 3)', 'dE5 pec', 0.776, -14.9, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (88, 'Andromeda Galaxy (M31)', 'SA(s)b', 0.778, -21.58, 'Local Group', 'Largest Galaxy in the Local Group (The Milky Way is the second largest), with at least 19 satellite galaxies. Barred spiral galaxy.', 152000);
INSERT INTO public.galaxy VALUES (89, 'Pegasus Dwarf Spheroidal (Andromeda VI)', 'dSph', 0.78, -10.80, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (90, 'Perseus I (Andromeda XXXIII)', NULL, 0.785, -10.3, 'Local Group', 'Satellite of Andromeda', 2600);
INSERT INTO public.galaxy VALUES (91, 'Andromeda XIV (Pisces IV)', NULL, 0.793, -8.5, 'Local Group', 'Satellite of Andromeda', 1700);
INSERT INTO public.galaxy VALUES (92, 'Andromeda I', 'dE3 pec', 0.80, -12.0, 'Local Group', 'Satellite of Andromeda', 5840);
INSERT INTO public.galaxy VALUES (93, 'Andromeda XXVIII', 'dSph', 0.811, -8.7, 'Local Group', 'Satellite of Andromeda', 1800);
INSERT INTO public.galaxy VALUES (94, 'M110 (NGC 205)', 'E6p', 0.82, -16.15, 'Local Group', 'Close Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (95, 'Andromeda VIII', 'dSph', 0.828, -15.6, 'Local Group', 'Tidally distorted dwarf close to Andromeda discovered 2003', NULL);
INSERT INTO public.galaxy VALUES (96, 'Andromeda XXIX', NULL, 0.829, -8.5, 'Local Group', 'Satellite of Andromeda', 2050);
INSERT INTO public.galaxy VALUES (97, 'Triangulum Galaxy (M33)', 'SA(s)cd', 0.84, -18.87, 'Local Group', 'Most distant (difficult) naked eye object. Closest unbarred spiral galaxy to us and third largest galaxy in the Local Group.', 61100);
INSERT INTO public.galaxy VALUES (98, 'Andromeda XXI[63]', 'dSph', 0.859, -9.9, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (99, 'Tucana Dwarf', 'dE5', 0.88, -9.16, 'Local Group[7]', 'Isolated group member — a ''primordial'' galaxy', NULL);
INSERT INTO public.galaxy VALUES (100, 'Andromeda X', 'dSph', 0.889, -8.1, 'Local Group', 'Satellite of Andromeda discovered 2006', NULL);
INSERT INTO public.galaxy VALUES (101, 'Andromeda XXIV', 'dSph', 0.898, -8.4, 'Local Group', 'Satellite of Andromeda', 4440);
INSERT INTO public.galaxy VALUES (102, 'Pegasus Dwarf Irregular (DDO 216)', 'dIrr/dSph', 0.898, -11.47, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (103, 'Andromeda XII', 'dSph', 0.928, -7.0, 'Local Group', 'Satellite of Andromeda', 2740);
INSERT INTO public.galaxy VALUES (104, 'Wolf-Lundmark-Melotte (WLM, DDO 221)', 'IB(s)m', 0.933, -14.06, 'Local Group', 'Isolated member at the edge of the local group', 11500);
INSERT INTO public.galaxy VALUES (105, 'Andromeda XIX[66]', 'dSph', 0.933, -9.3, 'Local Group', 'Satellite of Andromeda, spread over 1.7 kpc', 2200);
INSERT INTO public.galaxy VALUES (106, 'Andromeda XXII[63]', 'dSph', 0.987, NULL, 'Local Group', 'Satellite of Andromeda', NULL);
INSERT INTO public.galaxy VALUES (107, 'Aquarius Dwarf Galaxy (DDO 210)', 'Im V', 0.988, -11.09, 'Local Group', 'Isolated group member', NULL);
INSERT INTO public.galaxy VALUES (108, 'Pisces VII (Triangulum III)', NULL, 1.0, -6.8, 'Local Group', 'Possible satellite of Triangulum', NULL);
INSERT INTO public.galaxy VALUES (109, 'Sagittarius Dwarf Irregular Galaxy (SagDIG)', 'IB(s)m V', 1.198, -11.49, 'Local Group[1]', 'Isolated, star forming group member', 3000);
INSERT INTO public.galaxy VALUES (110, 'UGC 4879 (VV124)[68]', 'IAm', 1.213, -11.5, 'Local Group', 'Isolated, star forming group member', 3000);
INSERT INTO public.galaxy VALUES (111, 'Andromeda XVIII[66]', 'dSph', 1.214, -9.2, 'Local Group', NULL, 1200);
INSERT INTO public.galaxy VALUES (112, 'Antlia Dwarf', 'dE3.5', 1.31, -9.63, 'Local Group[NB 3]', 'May have interacted with NGC 3109', 3000);
INSERT INTO public.galaxy VALUES (113, 'Sextans A (UGCA 205, DDO 75)', 'IBm', 1.32, -13.95, 'Local Group[NB 3]', 'Contains cluster of young hot blue stars', 5000);
INSERT INTO public.galaxy VALUES (114, 'NGC 3109', 'SB(s)m', 1.35, -15.68, 'Local Group[NB 3]', 'Possibly spiral galaxy', 25000);
INSERT INTO public.galaxy VALUES (115, 'Antlia B', 'dSph/Irr', 1.35, -9.7, 'Local Group', 'Satellite of NGC 3109', 1780);
INSERT INTO public.galaxy VALUES (116, 'Sextans B (UGC 5373)', 'IM IV-V', 1.37, -14.08, 'Local Group[NB 3]', 'One of the smallest galaxies with planetary nebulae', 6000);
INSERT INTO public.galaxy VALUES (117, 'Tucana B', 'dSph', 1.4, -6.9, 'Local Group', '489 ly', NULL);
INSERT INTO public.galaxy VALUES (118, 'Cassiopeia 1', 'Irr', 1.59, -14.2, 'Isolated', 'Isolated galaxy', NULL);
INSERT INTO public.galaxy VALUES (119, 'Leo P', 'Irr', 1.62, -9.27, 'Local Group[NB 3]', 'Extremely low metallicity', 3690);
INSERT INTO public.galaxy VALUES (120, 'IC 5152', 'IA(s)m', 1.74, -15.56, 'Local Group ?', 'Possible outlying member of Local Group', 4000);
INSERT INTO public.galaxy VALUES (121, 'NGC 300', 'SA(s)d', 1.86, -17.92, 'between LG and Sculptor Group', 'Closest spiral galaxy to Local Group forms pair with NGC 55', 94000);
INSERT INTO public.galaxy VALUES (122, 'KKR 25', 'Irr', 1.90, -9.94, 'between LG and M81', NULL, NULL);
INSERT INTO public.galaxy VALUES (123, 'ESO 410-G005', 'E3', 1.905, -11.60, 'NGC 55 & 300', NULL, 2500);
INSERT INTO public.galaxy VALUES (124, 'ESO 294-010', 'dS0/Im', 1.96, -10.95, 'NGC 55 & 300', NULL, NULL);
INSERT INTO public.galaxy VALUES (125, 'NGC 55', 'SB(s)m', 2.00, -18.47, 'between LG and Sculptor Group', 'Forms pair with NGC 300', 70000);
INSERT INTO public.galaxy VALUES (126, 'KKs 3', 'dSph', 2.12, -12.3, NULL, NULL, 4900);
INSERT INTO public.galaxy VALUES (127, 'KKR 3 (KK 230)', 'dIrr', 2.14, -9.8, 'Inner edge of M94 Group', NULL, 980);
INSERT INTO public.galaxy VALUES (128, 'UGCA 438 (ESO 407-018)', 'IB(s)m pec:', 2.22, -12.92, 'NGC 55 & 300', NULL, NULL);
INSERT INTO public.galaxy VALUES (129, 'KK 258 (ESO 468-20)', 'dTr', 2.23, -10.3, 'NGC 55 & 300', NULL, NULL);
INSERT INTO public.galaxy VALUES (130, 'UGC 9128 (DDO 187)', 'ImIV-V', 2.24, -12.47, 'Inner edge of M94 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (131, 'IC 3104', 'IB(s)m', 2.27, -14.85, NULL, 'On the way to Circinus galaxy', NULL);
INSERT INTO public.galaxy VALUES (132, 'GR 8 (DDO 155)', 'ImV', 2.4, -12.14, 'Inner edge of M94 Group', 'footprint galaxy', NULL);
INSERT INTO public.galaxy VALUES (133, 'IC 4662 (ESO 102-14)', 'IBm', 2.44, -15.56, NULL, 'On the way to Circinus galaxy', 7000);
INSERT INTO public.galaxy VALUES (134, 'KKH 98', 'Irr', 2.45, -10.78, 'IC 342/Maffei Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (135, 'UGC 8508 (I Zw 060)', 'IAm', 2.69, -13.09, 'M94 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (136, 'KKH 86', 'Irr', 2.60, -10.30, NULL, 'Isolated (M94/Cent A)', NULL);
INSERT INTO public.galaxy VALUES (137, 'DDO 99 (UGC 6817)', 'Im', 2.64, -13.52, 'M94 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (138, 'ESO 6-1', 'Ir', 2.70, -12.41, NULL, 'Blue compact dwarf galaxy', NULL);
INSERT INTO public.galaxy VALUES (139, 'UGC 7577 (DDO 125)', 'Im', 2.74, -14.32, 'M94 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (140, 'Dwingeloo 1', 'SB(s)cd', 2.8, -18.78, 'IC 342/Maffei Group', NULL, 35000);
INSERT INTO public.galaxy VALUES (141, 'UGC 9240 (DDO 190)', 'IAm', 2.80, -14.19, 'M94 Group', NULL, 15000);
INSERT INTO public.galaxy VALUES (142, 'NGC 4190', 'Irr (BCD)', 2.82, NULL, NULL, 'Satellite of NGC 4214', NULL);
INSERT INTO public.galaxy VALUES (143, 'KKs 53 (Cen 7)', 'dSph', 2.93, -10.86, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (144, 'NGC 4214 (UGC 7278)', 'IAB(s)m', 2.94, NULL, 'M94 Group', 'Starburst galaxy', NULL);
INSERT INTO public.galaxy VALUES (145, 'UGCA 276 (DDO 113)', 'Im', 2.95, NULL, 'M94 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (146, 'UGCA 133 (DDO 44)', 'Im', 2.96, -12.9, 'M81 Group', 'Likely satellite of NGC 2403', NULL);
INSERT INTO public.galaxy VALUES (147, 'NGC 4163 (NGC 4167)', 'dIrr', 2.96, NULL, 'M94 Group', NULL, 4000);
INSERT INTO public.galaxy VALUES (148, 'UGCA 86', 'SAB(s)m', 2.98, NULL, 'IC 342/Maffei Group[85]', 'Satellite of IC 342', 20000);
INSERT INTO public.galaxy VALUES (149, 'NGC 1560', 'SA(s)d HII', 2.99, -16.87, 'IC 342/Maffei Group', 'Satellite of IC 342', NULL);
INSERT INTO public.galaxy VALUES (150, 'MADCASH-2 (MADCASH J121007+352635-dw)', 'dSph', 3.00, -9.15, 'M94 Group', 'Likely satellite of NGC 4214', NULL);
INSERT INTO public.galaxy VALUES (151, 'Dwingeloo 2', 'Im?', 3.0, -14.55, 'IC 342/Maffei Group', NULL, 20000);
INSERT INTO public.galaxy VALUES (152, 'KKH 11 (ZOAG G135.74-04.53)', 'dE/N', 3.0, -13.35, 'IC 342/Maffei Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (153, 'KKH 12', 'Irr', 3.0, -13.03, 'IC 342/Maffei Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (154, 'MB 3', 'dSph', 3.0, -13.65, 'IC 342/Maffei Group', NULL, 10000);
INSERT INTO public.galaxy VALUES (155, 'MB 1 (KK 21)', 'SAB(s)d?', 3.0, -14.81, 'IC 342/Maffei Group', NULL, 5000);
INSERT INTO public.galaxy VALUES (156, 'Maffei 1', 'S0- pec', 3.0, -18.97, 'IC 342/Maffei Group', NULL, 55000);
INSERT INTO public.galaxy VALUES (157, 'Maffei 2', 'SAB(rs)bc', 3.005, -20.15, 'IC 342/Maffei Group', NULL, 60000);
INSERT INTO public.galaxy VALUES (158, 'UGC 8651 (DDO 181)', 'Im', 3.01, NULL, 'M94 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (159, 'Donatiello I', 'dSph', 3.04, NULL, NULL, 'Possible satellite of NGC 404', NULL);
INSERT INTO public.galaxy VALUES (160, 'NGC 2403', 'SAB(s)cd HII', 3.04, -19.29, 'Inner edge of M81 Group', NULL, 50000);
INSERT INTO public.galaxy VALUES (161, 'NGC 404', 'SA(s)0-:', 3.08, -16.61, NULL, '''Mirach''s Ghost''', NULL);
INSERT INTO public.galaxy VALUES (162, 'ESO 274-01[88]', 'SAd:', 3.09, NULL, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (163, 'GALFA-Dw4[89]', 'dIrr', 3.10, -11.8, NULL, 'Isolated', NULL);
INSERT INTO public.galaxy VALUES (164, 'KKH 22', 'dSph', 3.12, -12.19, 'IC 342/Maffei Group', 'Satellite of IC 342', NULL);
INSERT INTO public.galaxy VALUES (165, 'NGC 3741', 'ImIII/BCD', 3.13, NULL, 'M94 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (166, 'KK 35', 'Irr', 3.16, -14.30, 'IC 342/Maffei Group', 'Satellite of IC 342', NULL);
INSERT INTO public.galaxy VALUES (167, 'HIPASS J1247-77', 'Im', 3.16, NULL, NULL, 'Aligned with IC 3104', NULL);
INSERT INTO public.galaxy VALUES (168, 'NGC 2366', 'IB(s)m', 3.19, NULL, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (169, 'NGC 1569 (UGC 3056)', 'IBm;Sbrst', 3.19, -18.17, 'IC 342/Maffei Group[85]', 'Satellite of IC 342', 6000);
INSERT INTO public.galaxy VALUES (170, 'ESO 321-014[88]', 'IBm', 3.19, NULL, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (171, 'UGC 8833', 'Im', 3.19, NULL, 'M94 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (172, 'Sculptor dIG (ESO 349-31)', 'dIrr', 3.2, -11.87, 'Sculptor Group', 'Satellite of NGC 7793', NULL);
INSERT INTO public.galaxy VALUES (173, 'UGC 4483', 'dIrr', 3.21, NULL, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (174, 'dw0910p7326 ("Blobby")', 'dSph', 3.21, 11.57, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (175, 'UGCA 92', 'Im?', 3.22, NULL, 'IC 342/Maffei Group[85]', 'Satellite of IC 342', NULL);
INSERT INTO public.galaxy VALUES (176, 'IC 342', 'SAB(rs)cd', 3.28, -20.69, 'IC 342/Maffei Group', 'the hidden galaxy', 75000);
INSERT INTO public.galaxy VALUES (177, 'UGCA 15 (DDO 6)', 'IB(s)m', 3.34, -12.50, 'Sculptor group', NULL, NULL);
INSERT INTO public.galaxy VALUES (178, 'KKs 58', 'dSph', 3.36, -11.93, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (179, 'KKH 37 (Mai 16)', 'S/Irr', 3.39, NULL, 'IC 342/Maffei Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (180, 'UGCA 105', 'Im?', 3.39, -16.81, 'IC 342/Maffei Group', 'Satellite of IC 342', NULL);
INSERT INTO public.galaxy VALUES (181, 'Holmberg II (DDO 50, UGC 4305)', 'Im', 3.39, NULL, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (182, 'NGC 5102', 'SA0- HII', 3.40, -18.08, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (183, 'NGC 5237', 'I0?', 3.40, NULL, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (184, 'ESO 325-11', NULL, 3.40, NULL, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (185, 'ESO 540-030 (KDG 2)', 'IABm', 3.40, -11.39, 'Sculptor group', NULL, NULL);
INSERT INTO public.galaxy VALUES (186, 'NGC 247', 'SAB(s)d', 3.4, -20.00, 'Sculptor group', NULL, NULL);
INSERT INTO public.galaxy VALUES (187, 'MADCASH-1 (MADCASH J074238+652501-dw)', 'dSph', 3.41, -7.81, 'M81 Group', 'Likely satellite of NGC 2403', NULL);
INSERT INTO public.galaxy VALUES (188, 'F6D1 (FM 1, PGC 3097828)', 'dSph', 3.42, NULL, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (189, 'ESO 540-032', 'IAB(s)m pec:', 3.42, -11.32, 'Sculptor group', NULL, NULL);
INSERT INTO public.galaxy VALUES (190, 'ESO 383-087 (ISG 39)', 'SB(s)dm', 3.45, -15.16, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (191, 'NGC 5206', 'SB0', 3.47, NULL, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (192, 'KK 179 (ESO 269-37)', 'IABm:', 3.48, NULL, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (193, 'Sculptor Galaxy (NGC 253)', 'SAB(s)c', 3.49, NULL, 'Sculptor group', NULL, 90000);
INSERT INTO public.galaxy VALUES (194, 'DDO 71 (UGC 5428)', 'Im', 3.50, NULL, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (195, 'Camelopardalis B', 'Irr', 3.50, -11.85, 'IC 342/Maffei Group', 'Satellite of IC 342', NULL);
INSERT INTO public.galaxy VALUES (196, 'Messier 82', 'I0;Sbrst HII', 3.53, -19.63, 'M81 Group', NULL, 37000);
INSERT INTO public.galaxy VALUES (197, 'NGC 5253', 'Im pec', 3.53, NULL, 'Centaurus A/M83 Group', 'Nearest Wolf-Rayet galaxy to us.', NULL);
INSERT INTO public.galaxy VALUES (198, 'M81 Dwarf A (KDG 52)', 'I?', 3.55, -11.49, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (199, 'KK 77 (F12D1)', 'dSph', 3.55, NULL, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (200, 'NGC 2976', 'SAc pec HII', 3.56, -17.1, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (201, 'Camelopardalis A', NULL, 3.56, NULL, 'IC 342/Maffei Group', 'Satellite of IC 342', NULL);
INSERT INTO public.galaxy VALUES (202, 'KK 211 (AM 1339-445)', 'dSph', 3.58, -11.93, 'Centaurus A/M83 Group', 'Satellite of NGC 5128', NULL);
INSERT INTO public.galaxy VALUES (203, 'PGC 51659 (UKS 1424-460)', 'IBm', 3.58, -11.83, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (204, 'KDG 61', 'dE/dSph', 3.58, -12.84, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (205, 'NGC 4945', 'SB(s)cd:sp', 3.59, -20.51, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (206, 'NGC 6789', 'Im', 3.6, -14.32, NULL, 'In the Local Void', NULL);
INSERT INTO public.galaxy VALUES (207, 'Messier 81', 'SA(s)ab, LINER', 3.6, NULL, 'M81 Group', 'Brightest galaxy in M81 Group', 90000);
INSERT INTO public.galaxy VALUES (208, 'Holmberg IX (UGC 5336, DDO 66)', 'Irr', 3.61, NULL, 'M81 Group', 'Contains ultraluminous X-ray source (ULX) Holmberg IX X-1', NULL);
INSERT INTO public.galaxy VALUES (209, 'UGCA 292 (CVn I dwA)', 'ImIV-V', 3.61, NULL, 'M94 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (210, 'BK 5N', 'dSph', 3.63, NULL, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (211, 'DDO 78 (KK 89)', 'dSph', 3.66, NULL, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (212, 'F8D1', 'dSph', 3.66, -12.20, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (213, 'UGC 4459 (DDO 53)', 'Im', 3.68, -13.37, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (214, 'Centaurus A (NGC 5128)', 'S0 pec', 3.68, NULL, 'Centaurus A/M83 Group', 'Brightest galaxy in Centaurus A Group and brightest and nearest radio galaxy', 60000);
INSERT INTO public.galaxy VALUES (215, 'KDG 64 (UGC 5442)', 'dE/dSph', 3.70, -12.55, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (216, 'IKN', 'dE', 3.75, -14.29, 'M81 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (217, 'KKs 54', 'dSph', 3.75, -10.41, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (218, 'NGC 5011C (ESO 269-68)', 'dE/Im', 3.77, -14.74, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (219, 'Centaurus N', NULL, 3.77, -11.15, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (220, 'KK 213', 'dSph', 3.77, NULL, 'Centaurus A/M83 Group', NULL, NULL);
INSERT INTO public.galaxy VALUES (221, 'KK 203', 'dSph', 3.77, -11.7, 'Centaurus A/M83 Group', 'In Centaurus A Group; contains a ring of Hα emission', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 0.272, 0.0123, 384399, 27.322, 18.29, 0.0549, 6.68, 'minimal', 3);
INSERT INTO public.moon VALUES (2, 'Io', NULL, 0.285, 0.0150, 421600, 1.769, 0.04, 0.0041, 0, 'minimal', 5);
INSERT INTO public.moon VALUES (3, 'Europa', NULL, 0.246, 0.00804, 670900, 3.551, 0.47, 0.009, 0.1, 'minimal', 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, 0.413, 0.0248, 1070400, 7.155, 1.85, 0.0013, 0.2, 'minimal', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, 0.378, 0.0180, 1882700, 16.689, 0.2, 0.0074, 1, 'minimal', 5);
INSERT INTO public.moon VALUES (6, 'Mimas', NULL, 0.031, 0.00000628, 185520, 0.942, 1.51, 0.0202, 0, NULL, 6);
INSERT INTO public.moon VALUES (7, 'Enceladus', NULL, 0.04, 0.0000181, 237948, 1.370, 0.02, 0.0047, 0, 'minimal', 6);
INSERT INTO public.moon VALUES (8, 'Tethys', NULL, 0.084, 0.000103, 294619, 1.888, 1.51, 0.02, 0, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Dione', NULL, 0.088, 0.000183, 377396, 2.737, 0.019, 0.002, 0, 'minimal', 6);
INSERT INTO public.moon VALUES (10, 'Rhea', NULL, 0.12, 0.000386, 527108, 4.518, 0.345, 0.001, 0, 'minimal', 6);
INSERT INTO public.moon VALUES (11, 'Titan', NULL, 0.404, 0.0225, 1221870, 15.945, 0.33, 0.0288, 0.3, 'N2, CH4', 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', NULL, 0.115, 0.000302, 3560820, 79.322, 14.72, 0.0286, 0, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Miranda', NULL, 0.037, 0.0000110, 129390, 1.414, 4.22, 0.0013, 0, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', NULL, 0.091, 0.000226, 190900, 2.520, 0.31, 0.0012, 0, NULL, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', NULL, 0.092, 0.00020, 266000, 4.144, 0.36, 0.005, 0, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Titania', NULL, 0.124, 0.00059, 436300, 8.706, 0.14, 0.0011, 0, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', NULL, 0.119, 0.000505, 583519, 13.46, 0.10, 0.0014, 0, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Triton', NULL, 0.212, 0.00358, 354759, 5.877, 157, 0.00002, 0.7, 'N2, CH4', 8);
INSERT INTO public.moon VALUES (19, 'Charon', NULL, 0.095, 0.000255, 17536, 6.387, 0.001, 0.0022, 0, NULL, 11);
INSERT INTO public.moon VALUES (20, 'Dysnomia', NULL, 0.057, 0.00006, 37300, 15.786, 0, 0.0062, 0, NULL, 16);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 0.383, 0.06, 0.39, 0.24, 7.00, 0.206, 58.65, 0.04, 'minimal', 'terrestrial', false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 0.949, 0.81, 0.72, 0.62, 3.39, 0.007, 243.02, 177.30, 'CO2, N2', 'terrestrial', false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.000, 1.00, 1.00, 1.00, 0.0, 0.017, 1.00, 23.44, 'N2, O2, Ar', 'terrestrial', true, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 0.532, 0.11, 1.52, 1.88, 1.85, 0.093, 1.03, 25.19, 'CO2, N2, Ar', 'terrestrial', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, 11.209, 317.83, 5.20, 11.86, 1.30, 0.048, 0.41, 3.13, 'H2, He', 'giant', true, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, 9.449, 95.16, 9.54, 29.45, 2.49, 0.054, 0.44, 26.73, 'H2, He', 'giant', true, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 4.007, 14.54, 19.19, 84.02, 0.773, 0.047, 0.72, 97.77, 'H2, He, CH4', 'giant', true, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 3.883, 17.15, 30.07, 164.79, 1.77, 0.009, 0.67, 28.32, 'H2, He, CH4', 'giant', true, true, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 0, 0.0742, 0.00016, 2.77, 4.60, 10.59, 0.080, 0.38, 4, 'minimal', 'Dwarf', false, false, 1);
INSERT INTO public.planet VALUES (10, 'Orcus', 1, 0.072, 0.0001, 39.42, 247.5, 20.59, 0.226, NULL, NULL, NULL, 'Dwarf', true, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Pluto', 5, 0.186, 0.0022, 39.48, 247.9, 17.14, 0.249, 6.39, 119.6, 'N2, CH4, CO', 'Dwarf', true, false, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 2, 0.13, 0.0007, 43.34, 283.8, 28.21, 0.195, 0.16, 126, NULL, 'Dwarf', true, true, 1);
INSERT INTO public.planet VALUES (13, 'Quaoar', 1, 0.085, 0.0002, 43.69, 288.0, 7.99, 0.038, 0.74, 14, NULL, 'Dwarf', true, true, 1);
INSERT INTO public.planet VALUES (14, 'Makemake', 1, 0.11, 0.0005, 45.79, 306.2, 28.98, 0.161, 0.95, NULL, 'minimal', 'Dwarf', true, NULL, 1);
INSERT INTO public.planet VALUES (15, 'Gonggong', 1, 0.10, 0.0003, 67.33, 552.5, 30.74, 0.506, 0.93, NULL, NULL, 'Dwarf', true, NULL, 1);
INSERT INTO public.planet VALUES (16, 'Eris', 1, 0.18, 0.0028, 67.67, 559, 44.04, 0.436, 15.79, 78, NULL, 'Dwarf', true, NULL, 1);
INSERT INTO public.planet VALUES (17, 'Sedna', 0, 0.078, NULL, 525.86, 12059, 11.93, 0.855, 0.43, NULL, NULL, 'Dwarf', false, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, NULL, 'α Sun', NULL);
INSERT INTO public.star VALUES (2, 'Acamar', NULL, 1, 36, 'θ1 Eridani A', NULL);
INSERT INTO public.star VALUES (3, 'Achernar', NULL, 1, 36, 'α Eridani A', 'The name was originally Arabic: آخر النهر ʾāẖir an-nahr (''river''s end'').');
INSERT INTO public.star VALUES (4, 'Achird', NULL, 1, 18, 'η Cassiopeiae A', 'Apparently first applied to η Cassiopeiae in the Skalnate Pleso Atlas of the Heavens published in 1950, but is not known prior to that.');
INSERT INTO public.star VALUES (5, 'Acrab', NULL, 1, 73, 'β1 Scorpii Aa', 'The traditional name of the β Scorpii system has been rendered Akrab and Elakrab, derived (like Acrab) from Arabic: العقرب al-ʿaqrab (''the scorpion'').');
INSERT INTO public.star VALUES (6, 'Acrux', NULL, 1, 30, 'α Crucis Aa', 'Acrux is a modern contraction of the Bayer designation, coined in the 19th century, but which entered into common use only by the mid-20th century.');
INSERT INTO public.star VALUES (7, 'Acubens', NULL, 1, 12, 'α Cancri Aa', 'The name was originally Arabic: الزبانى az-zubāná (''the claws'').');
INSERT INTO public.star VALUES (8, 'Adhafera', NULL, 1, 46, 'ζ Leonis Aa', 'Also called Aldhafera. The name is originally from Arabic: الضفيرة aḍ-ḍafīra (''the braid (or curl, or strand)'').');
INSERT INTO public.star VALUES (9, 'Adhara', NULL, 1, 14, 'ε Canis Majoris A', 'The name is originally from Arabic: عذارى ʿaḏārá (''virgins''). In the Calendarium of Al Achsasi Al Mouakket, it is designated أول العذاري ʾawwil al-ʿaḏāriyy, translated into Latin as Prima Virginum (''first virgin'').');
INSERT INTO public.star VALUES (10, 'Adhil', NULL, 1, 1, 'ξ Andromedae', 'The name was originally Arabic: الذيل aḏ-ḏayl (the train, lit. ''the tail'').');
INSERT INTO public.star VALUES (11, 'Ain', NULL, 1, 78, 'ε Tauri Aa1', 'The name is originally from Arabic: عين ʿayn (''eye'') and was reviewed and adopted by the Working Group on Star Names.');
INSERT INTO public.star VALUES (12, 'Ainalrami', NULL, 1, 72, 'ν1 Sagittarii A', 'From Arabic: عين الرامي ʿayn ar-rāmī (''eye of the archer'').');
INSERT INTO public.star VALUES (13, 'Aladfar', NULL, 1, 52, 'η Lyrae Aa', 'The name is originally from Arabic: الأظفر al-ʾuẓfur (''the talons''), shared with μ Lyrae (Alathfar).');
INSERT INTO public.star VALUES (14, 'Alathfar†', NULL, 1, 52, 'μ Lyrae', 'The name is originally from Arabic: الأظفر al-ʾuẓfur (''the talons''), shared with η Lyrae (Aladfar).');
INSERT INTO public.star VALUES (15, 'Albaldah', NULL, 1, 72, 'π Sagittarii A', 'The name is originally from Arabic: البلدة al-balda (''town''). In the Calendarium of Al Achsasi Al Mouakket, it is designated نير البلدة nayyir al-baldah, translated into Latin as Lucida Oppidi (''brightest of the town'').');
INSERT INTO public.star VALUES (16, 'Albali', NULL, 1, 4, 'ε Aquarii', 'The name is originally from Arabic: البالع al-bāliʿ (''the swallower'').');
INSERT INTO public.star VALUES (17, 'Albireo', NULL, 1, 31, 'β1 Cygni Aa', 'The source of the name Albireo is not entirely clear.');
INSERT INTO public.star VALUES (18, 'Alchiba', NULL, 1, 28, 'α Corvi', 'From Arabic: الخباء al-ẖibāʾ (''tent''). In the Calendarium of Al Achsasi Al Mouakket, it is designated المنخر الغراب al-manẖar al-ġurāb, translated into Latin as Rostrum Corvi (''beak of the crow'').');
INSERT INTO public.star VALUES (19, 'Alcor', NULL, 1, 83, '80 Ursae Majoris Ca', 'From Arabic: الخوار al‑ẖawwār (''the faint one'').');
INSERT INTO public.star VALUES (20, 'Alcyone', NULL, 1, 78, 'η Tauri A', 'Member of the Pleiades open star cluster (M45). Alcyone (Ancient Greek: Ἀλκυόνη Alkuonē) was one of the Pleiades sisters in Greek mythology.');
INSERT INTO public.star VALUES (21, 'Aldebaran', NULL, 1, 78, 'α Tauri', 'The name was originally Arabic: الدبران ad-dabarān (''the follower'').');
INSERT INTO public.star VALUES (22, 'Alderamin', NULL, 1, 20, 'α Cephei', 'From Arabic: الذراع اليمين aḏ-ḏirāʿ al-yamīn (''the right arm'').');
INSERT INTO public.star VALUES (23, 'Aldhanab', NULL, 1, 39, 'γ Gruis', 'The name was originally الذنب aḏ-ḏanab (''the tail'').');
INSERT INTO public.star VALUES (24, 'Aldhibah', NULL, 1, 34, 'ζ Draconis A', 'From Arabic: الضباع aḍ-ḍibāʿ (''the hyenas'').');
INSERT INTO public.star VALUES (25, 'Aldulfin', NULL, 1, 32, 'ε Delphini', 'Shortening of Arabic: ذنب الدلفين ḏanab ad-dulfīn (''tail of the dolphin'').');
INSERT INTO public.star VALUES (26, 'Alfirk', NULL, 1, 20, 'β Cephei Aa', 'From Arabic: الفرق al-firq (''the flock''). Name given by Ulugh Beg to the asterism consisting of α, β and η Cephei.');
INSERT INTO public.star VALUES (27, 'Algedi', NULL, 1, 16, 'α2 Capricorni', 'From Arabic: الجدي al-jady (''the (male) kid''). Alternative traditional names are Al Giedi, Secunda Giedi and Algiedi Secunda.');
INSERT INTO public.star VALUES (28, 'Algenib', NULL, 1, 62, 'γ Pegasi', 'From Arabic: الجانب al-jānib (''the flank''). Algenib is also another name for α Persei (Mirfak).');
INSERT INTO public.star VALUES (29, 'Algieba', NULL, 1, 46, 'γ1 Leonis', 'From Arabic: الجبهة al-jabha (''the forehead'').');
INSERT INTO public.star VALUES (30, 'Algol', NULL, 1, 63, 'β Persei Aa1', 'From Arabic: رأس الغول raʾs al-ġūl (''head of the ogre''). In Egyptian, Horus.');
INSERT INTO public.star VALUES (31, 'Algorab', NULL, 1, 28, 'δ Corvi A', 'The traditional name Algorab is derived from Arabic: الغراب al-ġurāb (''the crow''). The WGSN re-designated the star as Algorab in July 2016.');
INSERT INTO public.star VALUES (32, 'Alhena', NULL, 1, 38, 'γ Geminorum Aa', 'Derived from Arabic: الهنعة al-hanʿa (''the brand'').');
INSERT INTO public.star VALUES (33, 'Alioth', NULL, 1, 83, 'ε Ursae Majoris A', 'Member of the Big Dipper or the Plough (UK).');
INSERT INTO public.star VALUES (34, 'Aljanah', NULL, 1, 31, 'ε Cygni Aa', NULL);
INSERT INTO public.star VALUES (35, 'Alkaid', NULL, 1, 83, 'η Ursae Majoris', 'Member of the Big Dipper or the Plough (UK).');
INSERT INTO public.star VALUES (36, 'Alkalurops', NULL, 1, 9, 'μ1 Boötis Aa', NULL);
INSERT INTO public.star VALUES (37, 'Alkaphrah', NULL, 1, 83, 'κ Ursae Majoris A', NULL);
INSERT INTO public.star VALUES (38, 'Alkarab', NULL, 1, 62, 'υ Pegasi', NULL);
INSERT INTO public.star VALUES (39, 'Alkes', NULL, 1, 29, 'α Crateris', NULL);
INSERT INTO public.star VALUES (40, 'Almaaz', NULL, 1, 8, 'ε Aurigae', NULL);
INSERT INTO public.star VALUES (41, 'Almach', NULL, 1, 1, 'γ Andromedae A', NULL);
INSERT INTO public.star VALUES (42, 'Al Minliar al Asad†', NULL, 1, 46, 'κ Leonis', 'From Arabic: أل مينلير أل أسد ''al mynilir ''al ''asad (''lion''s nose'')');
INSERT INTO public.star VALUES (43, 'Alnair', NULL, 1, 39, 'α Gruis', NULL);
INSERT INTO public.star VALUES (44, 'Alnasl', NULL, 1, 72, 'γ2 Sagittarii', 'From Arabic: النصل an-naṣl (''the point'').');
INSERT INTO public.star VALUES (45, 'Alnilam', NULL, 1, 60, 'ε Orionis', 'The middle star in Orion''s belt.');
INSERT INTO public.star VALUES (46, 'Alnitak', NULL, 1, 60, 'ζ Orionis Aa', 'The traditional name, alternately spelled Al Nitak or Alnitah, is from Arabic: النطاق an-niṭāq (''the girdle'').');
INSERT INTO public.star VALUES (47, 'Alniyat', NULL, 1, 73, 'σ Scorpii Aa1', NULL);
INSERT INTO public.star VALUES (48, 'Alphard', NULL, 1, 42, 'α Hydrae', NULL);
INSERT INTO public.star VALUES (49, 'Alphecca', NULL, 1, 27, 'α Coronae Borealis', 'The name نير الفكة nayyir al-fakka (''bright (star) of the broken'') is found in the Al Achsasi al Mouakket catalogue (c. 1650).');
INSERT INTO public.star VALUES (50, 'Alpheratz', NULL, 1, 1, 'α Andromedae Aa', NULL);
INSERT INTO public.star VALUES (51, 'Alpherg', NULL, 1, 66, 'η Piscium A', NULL);
INSERT INTO public.star VALUES (52, 'Alrakis', NULL, 1, 34, 'μ Draconis A', 'From Arabic: الراقص ar-rāqiṣ (''the dancer''); also spelled Arrakis and Elrakis.');
INSERT INTO public.star VALUES (53, 'Alrescha', NULL, 1, 66, 'α Piscium A', NULL);
INSERT INTO public.star VALUES (54, 'Alruba', NULL, 1, 34, 'HD 161693', NULL);
INSERT INTO public.star VALUES (55, 'Alsafi', NULL, 1, 34, 'σ Draconis', NULL);
INSERT INTO public.star VALUES (56, 'Alsciaukat', NULL, 1, 51, '31 Lyncis', NULL);
INSERT INTO public.star VALUES (57, 'Alsephina', NULL, 1, 85, 'δ Velorum Aa', NULL);
INSERT INTO public.star VALUES (58, 'Alshain', NULL, 1, 5, 'β Aquilae A', NULL);
INSERT INTO public.star VALUES (59, 'Alshat', NULL, 1, 16, 'ν Capricorni A', NULL);
INSERT INTO public.star VALUES (60, 'Altair', NULL, 1, 5, 'α Aquilae', 'From Arabic: (النسر) الطائر (an-nasr) aṭ-ṭāʾir (''the flying''). Altair is one of the vertices of the Summer Triangle asterism.');
INSERT INTO public.star VALUES (61, 'Altais', NULL, 1, 34, 'δ Draconis', NULL);
INSERT INTO public.star VALUES (62, 'Alterf', NULL, 1, 46, 'λ Leonis', NULL);
INSERT INTO public.star VALUES (63, 'Aludra', NULL, 1, 14, 'η Canis Majoris', NULL);
INSERT INTO public.star VALUES (64, 'Alula Australis', NULL, 1, 83, 'ξ Ursae Majoris Aa', NULL);
INSERT INTO public.star VALUES (65, 'Alula Borealis', NULL, 1, 83, 'ν Ursae Majoris', NULL);
INSERT INTO public.star VALUES (66, 'Alya', NULL, 1, NULL, 'θ1 Serpentis A', NULL);
INSERT INTO public.star VALUES (67, 'Alzirr', NULL, 1, 38, 'ξ Geminorum', 'Alternately spelled Alzir.');
INSERT INTO public.star VALUES (68, 'Ancha', NULL, 1, 4, 'θ Aquarii', NULL);
INSERT INTO public.star VALUES (69, 'Angetenar', NULL, 1, 36, 'τ2 Eridani', 'The name is originally from Arabic: عرجة النهر ʿarjat an-nahr (''the bend of the river'').');
INSERT INTO public.star VALUES (70, 'Ankaa', NULL, 1, 64, 'α Phoenicis', NULL);
INSERT INTO public.star VALUES (71, 'Anser', NULL, 1, 88, 'α Vulpeculae', 'Alternative traditional name is Lucida Anseris.');
INSERT INTO public.star VALUES (72, 'Antares', NULL, 1, 73, 'α Scorpii A', 'From Ancient Greek: Ἀντάρης Antarēs (''rival of Ares'') (Mars).');
INSERT INTO public.star VALUES (73, 'Arcturus', NULL, 1, 9, 'α Boötis', 'From ancient Greek Ἀρκτοῦρος (Arktouros), "Guardian of the Bear".');
INSERT INTO public.star VALUES (74, 'Arkab Posterior', NULL, 1, 72, 'β2 Sagittarii', NULL);
INSERT INTO public.star VALUES (75, 'Arkab Prior', NULL, 1, 72, 'β1 Sagittarii', NULL);
INSERT INTO public.star VALUES (76, 'Arneb', NULL, 1, 48, 'α Leporis A', 'The traditional name Arneb is from Arabic: أرنب ʾarnab (''hare'').');
INSERT INTO public.star VALUES (77, 'Ascella', NULL, 1, 72, 'ζ Sagittarii A', 'Part of the Teapot asterism.');
INSERT INTO public.star VALUES (78, 'Asellus Australis', NULL, 1, 12, 'δ Cancri Aa', NULL);
INSERT INTO public.star VALUES (79, 'Asellus Borealis', NULL, 1, 12, 'γ Cancri Aa', NULL);
INSERT INTO public.star VALUES (80, 'Ashlesha', NULL, 1, 42, 'ε Hydrae A', NULL);
INSERT INTO public.star VALUES (81, 'Asellus Primus†', NULL, 1, 9, 'θ Boötis', 'Latin for ''first donkey colt''.');
INSERT INTO public.star VALUES (82, 'Asellus Secundus†', NULL, 1, 9, 'ι Boötis', 'Latin for ''second donkey colt''.');
INSERT INTO public.star VALUES (83, 'Asellus Tertius†', NULL, 1, 9, 'κ Boötis', 'Latin for ''third donkey colt''.');
INSERT INTO public.star VALUES (84, 'Aspidiske', NULL, 1, 17, 'ι Carinae', NULL);
INSERT INTO public.star VALUES (85, 'Asterope', NULL, 1, 78, '21 Tauri A', 'Member of the Pleiades open star cluster (M45). Asterope was one of the Pleiades sisters in Greek mythology.');
INSERT INTO public.star VALUES (86, 'Athebyne', NULL, 1, 34, 'η Draconis A', NULL);
INSERT INTO public.star VALUES (87, 'Atik', NULL, 1, 63, 'ο Persei A', NULL);
INSERT INTO public.star VALUES (88, 'Atlas', NULL, 1, 78, '27 Tauri Aa1', 'Member of the Pleiades open star cluster (M45). Atlas was the Titan of endurance and astronomy and the father of the Pleiades sisters in Greek mythology.');
INSERT INTO public.star VALUES (89, 'Atria', NULL, 1, 81, 'α Trianguli Australis', NULL);
INSERT INTO public.star VALUES (90, 'Avior', NULL, 1, 17, 'ε Carinae A', 'Designated "Avior" by His Majesty''s Nautical Almanac Office for the Royal Air Force in the 1930s.');
INSERT INTO public.star VALUES (91, 'Azelfafage', NULL, 1, 31, 'π1 Cygni', 'Variously reported as from Arabic: السلحفاة as-sulaḥfāh (''turtle''), الطلف الفرس aṭ-ṭilf al-faras (''horse track''), or عزل الدجاجة ʿazal ad-dajāja (''tail of the hen'').');
INSERT INTO public.star VALUES (92, 'Azha', NULL, 1, 36, 'η Eridani', 'Originally from Arabic: أدحي (النعام) ʾudḥiyy (an-naʿām) (''nest''); later miscopied as أزحى ʾazḥá in medieval manuscripts.');
INSERT INTO public.star VALUES (93, 'Azmidi', NULL, 1, 68, 'ξ Puppis', 'Alternatively rendered Asmidiske.');
INSERT INTO public.star VALUES (94, 'Barnard''s Star', NULL, 1, 59, 'V2500 Ophiuchi', 'Named after the American astronomer Edward Emerson Barnard, the first to measure its high proper motion.');
INSERT INTO public.star VALUES (95, 'Baten Kaitos', NULL, 1, 21, 'ζ Ceti Aa', NULL);
INSERT INTO public.star VALUES (96, 'Beemim', NULL, 1, 36, 'υ3 Eridani', NULL);
INSERT INTO public.star VALUES (97, 'Beid', NULL, 1, 36, 'ο1 Eridani', 'The name is originally from Arabic: البيض al-bayḍ (''the eggs'').');
INSERT INTO public.star VALUES (98, 'Bellatrix', NULL, 1, 60, 'γ Orionis', 'Latin for ''female warrior''; applied to this star in the 15th century.');
INSERT INTO public.star VALUES (99, 'Betelgeuse', NULL, 1, 60, 'α Orionis Aa', 'Derived from Arabic: يد الجوزاء yad al-jawzāʾ (''the hand of'') (an old asterism).');
INSERT INTO public.star VALUES (100, 'Bharani', NULL, 1, 7, '41 Arietis Aa', NULL);
INSERT INTO public.star VALUES (101, 'Biham', NULL, 1, 62, 'θ Pegasi', NULL);
INSERT INTO public.star VALUES (102, 'Botein', NULL, 1, 7, 'δ Arietis', NULL);
INSERT INTO public.star VALUES (103, 'Brachium', NULL, 1, 49, 'σ Librae A', NULL);
INSERT INTO public.star VALUES (104, 'Bunda', NULL, 1, 4, 'ξ Aquarii A', NULL);
INSERT INTO public.star VALUES (105, 'Canopus', NULL, 1, 17, 'α Carinae A', 'Ptolemy''s Κάνωβος, after Canopus (Kanōpos, Kanōbos), a pilot from Greek mythology, whose name is itself of uncertain etymology.');
INSERT INTO public.star VALUES (106, 'Capella', NULL, 1, 8, 'α Aurigae Aa', 'The traditional name Capella (''small female goat'') is from Latin, and is a diminutive of capra (''female goat'').');
INSERT INTO public.star VALUES (107, 'Caph', NULL, 1, 18, 'β Cassiopeiae A', 'The name is originally Arabic: كف kaff (''palm''), a residue of an old name of Cassiopeia, الكف الخصيب al-kaff al-ẖaḍīb (''the stained hand''); also known as السنام الناقة as-sanām al-nāqa (''the camel''s hump'').');
INSERT INTO public.star VALUES (108, 'Castor', NULL, 1, 38, 'α Geminorum Aa', NULL);
INSERT INTO public.star VALUES (109, 'Castula', NULL, 1, 18, 'υ2 Cassiopeiae', NULL);
INSERT INTO public.star VALUES (110, 'Cebalrai', NULL, 1, 59, 'β Ophiuchi', NULL);
INSERT INTO public.star VALUES (111, 'Celaeno', NULL, 1, 78, '16 Tauri', 'Member of the Pleiades open star cluster (M45). Celaeno was one of the Pleiades sisters in Greek mythology.');
INSERT INTO public.star VALUES (112, 'Chamukuy', NULL, 1, 78, 'θ2 Tauri Aa', NULL);
INSERT INTO public.star VALUES (113, 'Chara', NULL, 1, 13, 'β Canum Venaticorum Aa', NULL);
INSERT INTO public.star VALUES (114, 'Chertan', NULL, 1, 46, 'θ Leonis', 'Alternative traditional name Chort.');
INSERT INTO public.star VALUES (115, 'Cor Caroli', NULL, 1, 13, 'α2 Canum Venaticorum Aa', 'Named after Charles I of England by Sir Charles Scarborough.');
INSERT INTO public.star VALUES (116, 'Cujam', NULL, 1, 40, 'ω Herculis A', 'Traditional name, variously spelled Kajam.');
INSERT INTO public.star VALUES (117, 'Cursa', NULL, 1, 36, 'β Eridani', 'The name is originally from Arabic: الكرسي al-kursiyy (''the chair, footstool'').');
INSERT INTO public.star VALUES (118, 'Dabih', NULL, 1, 16, 'β1 Capricorni Aa', NULL);
INSERT INTO public.star VALUES (119, 'Dalim', NULL, 1, 37, 'α Fornacis A', NULL);
INSERT INTO public.star VALUES (120, 'Deneb', NULL, 1, 31, 'α Cygni', 'The name is originally from Arabic: ذنب الدجاجة ḏanab ad-dajāja. In Chinese, Deneb is part of the 鵲橋 (''Magpie bridge'') in the Qi Xi love story. Deneb is one of the vertices of the Summer Triangle asterism.');
INSERT INTO public.star VALUES (121, 'Deneb Algedi', NULL, 1, 16, 'δ Capricorni Aa', NULL);
INSERT INTO public.star VALUES (122, 'Denebola', NULL, 1, 46, 'β Leonis', NULL);
INSERT INTO public.star VALUES (123, 'Diadem', NULL, 1, 25, 'α Comae Berenices A', NULL);
INSERT INTO public.star VALUES (124, 'Diphda', NULL, 1, 21, 'β Ceti', 'Arabic for ''frog'', from the phrase ضفدع الثاني aḍ-ḍifdaʿ aṯ-ṯānī ''the second frog'' (the ''first frog'' is Fomalhaut)');
INSERT INTO public.star VALUES (125, 'Dschubba', NULL, 1, 73, 'δ Scorpii A', NULL);
INSERT INTO public.star VALUES (126, 'Dubhe', NULL, 1, 83, 'α Ursae Majoris A', 'Member of the Big Dipper or the Plough (UK).');
INSERT INTO public.star VALUES (127, 'Dziban', NULL, 1, 34, 'ψ1 Draconis A', 'From the traditional name of Dziban or Dsiban, derived from Arabic: الذئبانِ aḏ-ḏiʾbān (''the two wolves'' or ''the two jackals'').');
INSERT INTO public.star VALUES (128, 'Edasich', NULL, 1, 34, 'ι Draconis', 'Common name reviewed and adopted by the Working Group on Star Names.');
INSERT INTO public.star VALUES (129, 'Electra', NULL, 1, 78, '17 Tauri', 'Member of the Pleiades open star cluster (M45). Electra was one of the Pleiades sisters in Greek mythology.');
INSERT INTO public.star VALUES (130, 'Elgafar', NULL, 1, 86, 'φ Virginis A', NULL);
INSERT INTO public.star VALUES (131, 'Elkurud', NULL, 1, 24, 'θ Columbae', NULL);
INSERT INTO public.star VALUES (132, 'Elnath', NULL, 1, 78, 'β Tauri Aa', 'Variously El Nath or Alnath, from Arabic: النطح an-naṭḥ (''the butting'') (i.e. "the bull''s horns").');
INSERT INTO public.star VALUES (133, 'Eltanin', NULL, 1, 34, 'γ Draconis', 'Alternative traditional name of Etamin; both originally from the Arabic constellation name التنين at-tinnīn (''the great serpent''). γ Dra was also one of the "Five Camels" (Latin: Quinque Dromedarii), in Arabic العوائد al‑ʿawāʾid.');
INSERT INTO public.star VALUES (134, 'Enif', NULL, 1, 62, 'ε Pegasi', NULL);
INSERT INTO public.star VALUES (135, 'Fang', NULL, 1, 73, 'π Scorpii Aa', 'From the Chinese name 房 Fáng (''the room'').');
INSERT INTO public.star VALUES (136, 'Fawaris', NULL, 1, 31, 'δ Cygni A', NULL);
INSERT INTO public.star VALUES (137, 'Felis', NULL, 1, 42, 'HD 85951', NULL);
INSERT INTO public.star VALUES (138, 'Fulu', NULL, 1, 18, 'ζ Cassiopeiae', 'From the Chinese name 附路 Fùlù (''the auxiliary road'').');
INSERT INTO public.star VALUES (139, 'Fumalsamakah', NULL, 1, 66, 'β Piscium', NULL);
INSERT INTO public.star VALUES (140, 'Furud', NULL, 1, 14, 'ζ Canis Majoris Aa', NULL);
INSERT INTO public.star VALUES (141, 'Fuyue', NULL, 1, 73, 'G Scorpii', 'From the Chinese name Fu Yue.');
INSERT INTO public.star VALUES (142, 'Gacrux', NULL, 1, 30, 'γ Crucis', 'The name "Gacrux" is a contraction of the Bayer designation, coined by astronomer Elijah Hinsdale Burritt (1794–1838).');
INSERT INTO public.star VALUES (143, 'Garnet Star†', NULL, 1, 20, 'μ Cephei', 'Its colour was described as "garnet" by William Herschel. Following Herschel, it was called garnet sidus by Giuseppe Piazzi.');
INSERT INTO public.star VALUES (144, 'Geminga', NULL, 1, 38, 'PSR B0633+17', 'both a contraction of Gemini gamma-ray source, and a transcription of the words ghè minga (pronounced ');
INSERT INTO public.star VALUES (145, 'Giausar', NULL, 1, 34, 'λ Draconis', 'Traditional name, variously spelled Gianfar.');
INSERT INTO public.star VALUES (146, 'Gienah', NULL, 1, 28, 'γ Corvi A', 'Also known as Gienah Gurab; the star ε Cygni is also traditionally known as Gienah.');
INSERT INTO public.star VALUES (147, 'Ginan', NULL, 1, 30, 'ε Crucis', 'Traditional name in the culture of the Wardaman people of the Northern Territory of Australia.');
INSERT INTO public.star VALUES (148, 'Gomeisa', NULL, 1, 15, 'β Canis Minoris A', NULL);
INSERT INTO public.star VALUES (149, 'Graffias†', NULL, 1, 73, 'ξ Scorpii', 'Italian for ''claws''; also once applied to β Scorpii.');
INSERT INTO public.star VALUES (150, 'Grumium', NULL, 1, 34, 'ξ Draconis A', NULL);
INSERT INTO public.star VALUES (151, 'Gudja', NULL, 1, NULL, 'κ Serpentis', NULL);
INSERT INTO public.star VALUES (152, 'Guniibuu', NULL, 1, 59, '36 Ophiuchi A', NULL);
INSERT INTO public.star VALUES (153, 'Hadar', NULL, 1, 19, 'β Centauri Aa', NULL);
INSERT INTO public.star VALUES (154, 'Haedus', NULL, 1, 8, 'η Aurigae', NULL);
INSERT INTO public.star VALUES (155, 'Hamal', NULL, 1, 7, 'α Arietis', 'Traditional name (also written Hemal, Hamul, or Ras Hammel) derived from Arabic: رأس الحمل raʾs al-ḥamal (''head of the ram''), in turn from the name for the constellation as a whole, al-ḥamal (''the ram'').');
INSERT INTO public.star VALUES (156, 'Hassaleh', NULL, 1, 8, 'ι Aurigae', NULL);
INSERT INTO public.star VALUES (157, 'Hatysa', NULL, 1, 60, 'ι Orionis Aa', NULL);
INSERT INTO public.star VALUES (158, 'Heze', NULL, 1, 86, 'ζ Virginis A', NULL);
INSERT INTO public.star VALUES (159, 'Homam', NULL, 1, 62, 'ζ Pegasi A', NULL);
INSERT INTO public.star VALUES (160, 'Iklil', NULL, 1, 73, 'ρ Scorpii Aa', NULL);
INSERT INTO public.star VALUES (161, 'Imai', NULL, 1, 30, 'δ Crucis', NULL);
INSERT INTO public.star VALUES (162, 'Izar', NULL, 1, 9, 'ε Boötis A', 'Originally from Arabic: إزار ʾizār (''veil'') In the Calendarium of Al Achsasi Al Mouakket, it is designated منطقة ألعوع minṭaqat al‑ʿawwaʿ, translated into Latin as Cingulum Latratoris (''belt of barker''). Named Pulcherrima (''most beautiful'') by Otto Struve.');
INSERT INTO public.star VALUES (163, 'Jabbah', NULL, 1, 73, 'ν Scorpii Aa', NULL);
INSERT INTO public.star VALUES (164, 'Jishui', NULL, 1, 38, 'ο Geminorum', NULL);
INSERT INTO public.star VALUES (165, 'Kaffaljidhma', NULL, 1, 21, 'γ Ceti A', NULL);
INSERT INTO public.star VALUES (166, 'Kang', NULL, 1, 86, 'κ Virginis', 'From the Chinese name 亢 Kàng (''the neck'').');
INSERT INTO public.star VALUES (167, 'Kaus Australis', NULL, 1, 72, 'ε Sagittarii A', 'Part of the Teapot asterism.');
INSERT INTO public.star VALUES (168, 'Kaus Borealis', NULL, 1, 72, 'λ Sagittarii', 'The top of the Teapot asterism.');
INSERT INTO public.star VALUES (169, 'Kaus Media', NULL, 1, 72, 'δ Sagittarii', 'Part of the Teapot asterism.');
INSERT INTO public.star VALUES (170, 'Keid', NULL, 1, 36, 'ο2 Eridani A', NULL);
INSERT INTO public.star VALUES (171, 'Khambalia', NULL, 1, 86, 'λ Virginis A', NULL);
INSERT INTO public.star VALUES (172, 'Kitalpha', NULL, 1, 35, 'α Equulei A', NULL);
INSERT INTO public.star VALUES (173, 'Kochab', NULL, 1, 84, 'β Ursae Minoris', NULL);
INSERT INTO public.star VALUES (174, 'Kornephoros', NULL, 1, 40, 'β Herculis Aa', NULL);
INSERT INTO public.star VALUES (175, 'Kraz', NULL, 1, 28, 'β Corvi', NULL);
INSERT INTO public.star VALUES (176, 'Kuma†', NULL, 1, 34, 'ν Draconis', NULL);
INSERT INTO public.star VALUES (177, 'Kurhah', NULL, 1, 20, 'ξ Cephei Aa', NULL);
INSERT INTO public.star VALUES (178, 'La Superba', NULL, 1, 13, 'Y Canum Venaticorum', 'A modern (19th century) name, due to Angelo Secchi.');
INSERT INTO public.star VALUES (179, 'Larawag', NULL, 1, 73, 'ε Scorpii', 'Traditional name in the culture of the Wardaman people of the Northern Territory of Australia.');
INSERT INTO public.star VALUES (180, 'Lesath', NULL, 1, 73, 'υ Scorpii', NULL);
INSERT INTO public.star VALUES (181, 'Lilii Borea', NULL, 1, 7, '39 Arietis', NULL);
INSERT INTO public.star VALUES (182, 'Maasym', NULL, 1, 40, 'λ Herculis', NULL);
INSERT INTO public.star VALUES (183, 'Mahasim', NULL, 1, 8, 'θ Aurigae A', NULL);
INSERT INTO public.star VALUES (184, 'Maia', NULL, 1, 78, '20 Tauri', 'Member of the Pleiades open star cluster (M45). Maia was one of the Pleiades sisters in Greek mythology.');
INSERT INTO public.star VALUES (185, 'Marfik', NULL, 1, 59, 'λ Ophiuchi A', NULL);
INSERT INTO public.star VALUES (186, 'Markab', NULL, 1, 62, 'α Pegasi', NULL);
INSERT INTO public.star VALUES (187, 'Markeb', NULL, 1, 85, 'κ Velorum', NULL);
INSERT INTO public.star VALUES (188, 'Marsic', NULL, 1, 40, 'κ Herculis A', NULL);
INSERT INTO public.star VALUES (189, 'Matar', NULL, 1, 62, 'η Pegasi Aa', NULL);
INSERT INTO public.star VALUES (190, 'Mebsuta', NULL, 1, 38, 'ε Geminorum', NULL);
INSERT INTO public.star VALUES (191, 'Megrez', NULL, 1, 83, 'δ Ursae Majoris', 'Member of the Big Dipper or the Plough (UK).');
INSERT INTO public.star VALUES (192, 'Meissa', NULL, 1, 60, 'λ Orionis A', 'Traditional name deriving from Arabic: الميسان al-maysān (''the shining one'').');
INSERT INTO public.star VALUES (193, 'Mekbuda', NULL, 1, 38, 'ζ Geminorum Aa', NULL);
INSERT INTO public.star VALUES (194, 'Meleph', NULL, 1, 12, 'ε Cancri Aa', NULL);
INSERT INTO public.star VALUES (195, 'Menkalinan', NULL, 1, 8, 'β Aurigae Aa', NULL);
INSERT INTO public.star VALUES (196, 'Menkar', NULL, 1, 21, 'α Ceti', 'Derived from Arabic: منخر manẖar (''nostril''), or al‑minẖar (''nose'').');
INSERT INTO public.star VALUES (197, 'Menkent', NULL, 1, 19, 'θ Centauri', NULL);
INSERT INTO public.star VALUES (198, 'Menkib', NULL, 1, 63, 'ξ Persei', NULL);
INSERT INTO public.star VALUES (199, 'Merak', NULL, 1, 83, 'β Ursae Majoris', 'Member of the Big Dipper or the Plough (UK).');
INSERT INTO public.star VALUES (200, 'Merga', NULL, 1, 9, '38 Boötis', NULL);
INSERT INTO public.star VALUES (201, 'Meridiana', NULL, 1, 26, 'α Coronae Australis', NULL);
INSERT INTO public.star VALUES (202, 'Merope', NULL, 1, 78, '23 Tauri Aa', 'Member of the Pleiades open star cluster (M45). Merope was one of the Pleiades sisters in Greek mythology.');
INSERT INTO public.star VALUES (203, 'Mesarthim', NULL, 1, 7, 'γ1 Arietis A', NULL);
INSERT INTO public.star VALUES (204, 'Miaplacidus', NULL, 1, 17, 'β Carinae', NULL);
INSERT INTO public.star VALUES (205, 'Mimosa', NULL, 1, 30, 'β Crucis', 'Also bore the alternative historical name "Becrux", a modern contraction of the Bayer designation.');
INSERT INTO public.star VALUES (206, 'Minchir', NULL, 1, 42, 'σ Hydrae', NULL);
INSERT INTO public.star VALUES (207, 'Minelauva', NULL, 1, 86, 'δ Virginis', 'Alternately spelled Minelava.');
INSERT INTO public.star VALUES (208, 'Mintaka', NULL, 1, 60, 'δ Orionis Aa', 'The right-most star in Orion''s belt. The name Mintaka itself is derived from Arabic: منطقة manṭaqa (''belt'').');
INSERT INTO public.star VALUES (209, 'Mira', NULL, 1, 21, 'ο Ceti Aa', 'Latin for ''wonderful'' or ''astonishing''; named by Johannes Hevelius in his Historiola Mirae Stellae (1662).');
INSERT INTO public.star VALUES (210, 'Mirach', NULL, 1, 1, 'β Andromedae', NULL);
INSERT INTO public.star VALUES (211, 'Miram', NULL, 1, 63, 'η Persei A', NULL);
INSERT INTO public.star VALUES (212, 'Mirfak', NULL, 1, 63, 'α Persei', NULL);
INSERT INTO public.star VALUES (213, 'Mirzam', NULL, 1, 14, 'β Canis Majoris', NULL);
INSERT INTO public.star VALUES (214, 'Misam', NULL, 1, 63, 'κ Persei Aa', NULL);
INSERT INTO public.star VALUES (215, 'Mizar', NULL, 1, 83, 'ζ Ursae Majoris Aa', 'Member of the Big Dipper or the Plough (UK). The name is originally from Arabic: المئزر al-miʾzar (''apron, waistband, girdle''). Also called 禄 Lù (''Status''), one of the "Three Stars" in Chinese mythology. The Lù star is believed to be Zhang Xian, who lived during the Later Shu dynasty. The word lù specifically refers to the salary of a government official. As such, the Lù star is the star of prosperity, rank, and influence.');
INSERT INTO public.star VALUES (216, 'Mothallah', NULL, 1, 80, 'α Trianguli', NULL);
INSERT INTO public.star VALUES (217, 'Muliphein', NULL, 1, 14, 'γ Canis Majoris', NULL);
INSERT INTO public.star VALUES (218, 'Muphrid', NULL, 1, 9, 'η Boötis Aa', 'Alternative traditional spelling of Mufrid.');
INSERT INTO public.star VALUES (219, 'Muscida', NULL, 1, 83, 'ο Ursae Majoris A', NULL);
INSERT INTO public.star VALUES (220, 'Nahn', NULL, 1, 12, 'ξ Cancri A', NULL);
INSERT INTO public.star VALUES (221, 'Naos', NULL, 1, 68, 'ζ Puppis', NULL);
INSERT INTO public.star VALUES (222, 'Nashira', NULL, 1, 16, 'γ Capricorni A', NULL);
INSERT INTO public.star VALUES (223, 'Navi†', NULL, 1, 18, 'γ Cassiopeiae', 'Navi is a modern name, due to Gus Grissom (his middle name "Ivan" spelled backward).');
INSERT INTO public.star VALUES (224, 'Nekkar', NULL, 1, 9, 'β Boötis', NULL);
INSERT INTO public.star VALUES (225, 'Nembus', NULL, 1, 1, '51 Andromedae', NULL);
INSERT INTO public.star VALUES (226, 'Nihal', NULL, 1, 48, 'β Leporis A', NULL);
INSERT INTO public.star VALUES (227, 'Nunki', NULL, 1, 72, 'σ Sagittarii Aa', 'Along with τ Sagittarii, it makes up the handle of the Teapot asterism.');
INSERT INTO public.star VALUES (228, 'Nusakan', NULL, 1, 27, 'β Coronae Borealis A', NULL);
INSERT INTO public.star VALUES (229, 'Okab', NULL, 1, 5, 'ζ Aquilae A', NULL);
INSERT INTO public.star VALUES (230, 'Peacock', NULL, 1, 61, 'α Pavonis Aa', 'Designated "Peacock" (after the constellation) by His Majesty''s Nautical Almanac Office for the Royal Air Force in the 1930s.');
INSERT INTO public.star VALUES (231, 'Phact', NULL, 1, 24, 'α Columbae', NULL);
INSERT INTO public.star VALUES (232, 'Phecda', NULL, 1, 83, 'γ Ursae Majoris Aa', 'A member of the Big Dipper or the Plough (UK). Alternative traditional names are Phekda or Phad.');
INSERT INTO public.star VALUES (233, 'Pherkad', NULL, 1, 84, 'γ Ursae Minoris', NULL);
INSERT INTO public.star VALUES (234, 'Piautos', NULL, 1, 12, 'λ Cancri', NULL);
INSERT INTO public.star VALUES (235, 'Pipirima', NULL, 1, 73, 'μ2 Scorpii A', NULL);
INSERT INTO public.star VALUES (236, 'Pleione', NULL, 1, 78, '28 Tauri Aa', 'Member of the Pleiades open star cluster (M45). Pleione was the mother of the Pleiades sisters in Greek mythology.');
INSERT INTO public.star VALUES (237, 'Polaris', NULL, 1, 84, 'α Ursae Minoris', 'Became known as stella polaris (''polar star'') during the Renaissance.');
INSERT INTO public.star VALUES (238, 'Polaris Australis', NULL, 1, 58, 'σ Octantis', 'See South Star.');
INSERT INTO public.star VALUES (239, 'Polis', NULL, 1, 72, 'μ Sagittarii Aa', NULL);
INSERT INTO public.star VALUES (240, 'Pollux', NULL, 1, 38, 'β Geminorum', NULL);
INSERT INTO public.star VALUES (241, 'Porrima', NULL, 1, 86, 'γ Virginis A', NULL);
INSERT INTO public.star VALUES (242, 'Praecipua', NULL, 1, 47, '46 Leonis Minoris', NULL);
INSERT INTO public.star VALUES (243, 'Prima Hyadum', NULL, 1, 78, 'γ Tauri A', NULL);
INSERT INTO public.star VALUES (244, 'Procyon', NULL, 1, 15, 'α Canis Minoris A', 'Ancient Greek: προκύον prokuon (''preceding the Dog'') (viz. Sirius); Latinized as Antecanis.');
INSERT INTO public.star VALUES (245, 'Propus', NULL, 1, 38, 'η Geminorum A', NULL);
INSERT INTO public.star VALUES (246, 'Proxima Centauri', NULL, 1, 19, 'α Centauri C', 'The nearest star to the Sun.');
INSERT INTO public.star VALUES (247, 'Rana', NULL, 1, 36, 'δ Eridani', 'Rana is Latin for ''frog''.');
INSERT INTO public.star VALUES (248, 'Rasalas', NULL, 1, 46, 'μ Leonis', NULL);
INSERT INTO public.star VALUES (249, 'Rasalgethi', NULL, 1, 40, 'α1 Herculis Aa', 'Also spelled Ras Algethi.');
INSERT INTO public.star VALUES (250, 'Rasalhague', NULL, 1, 59, 'α Ophiuchi A', 'Also spelled Ras Alhague.');
INSERT INTO public.star VALUES (251, 'Rastaban', NULL, 1, 34, 'β Draconis A', NULL);
INSERT INTO public.star VALUES (252, 'Regor†', NULL, 1, 85, 'γ Velorum', 'Also known as Suhail and Suhail al Muhlif, which also apply to λ Velorum (Suhail).');
INSERT INTO public.star VALUES (253, 'Regulus', NULL, 1, 46, 'α Leonis A', 'Latin for ''prince'' or ''little king''. Regulus was known to Persian astrologers as "Venant, Watcher of the North", one of the royal stars.');
INSERT INTO public.star VALUES (254, 'Revati', NULL, 1, 66, 'ζ Piscium A', NULL);
INSERT INTO public.star VALUES (255, 'Rigel', NULL, 1, 60, 'β Orionis A', 'Traditional name first recorded in the Alfonsine Tables of 1252 and derived from the Arabic name الرجل الجوزاء اليسرى ar-rijl al-jawzāʾ al-yasrá (''the left leg (foot) of Jauzah''');
INSERT INTO public.star VALUES (256, 'Rigil Kentaurus', NULL, 1, 19, 'α Centauri A', 'The name is originally from Arabic: رجل قنطورس rijl qantūris (''foot of the centaur'').');
INSERT INTO public.star VALUES (257, 'Rotanev', NULL, 1, 32, 'β Delphini A', 'The name appeared in Piazzi''s Palermo Star Catalogue in 1814, added by Niccolò Cacciatore as a prank along with Sualocin (α Delphini); "Rotanev" is Venator, the Latin form of Italian: Cacciatore (''hunter''), spelt backwards.');
INSERT INTO public.star VALUES (258, 'Ruchbah', NULL, 1, 18, 'δ Cassiopeiae Aa', 'Derived from Arabic: ركبة rukba (''knee''). The alternative historical name Ksora appeared in a 1951 publication, Atlas Coeli (Skalnate Pleso Atlas of the Heavens) by Czech astronomer Antonín Bečvář; professor Paul Kunitzch has been unable to find any clues as to the origin of the name.');
INSERT INTO public.star VALUES (259, 'Rukbat', NULL, 1, 72, 'α Sagittarii', NULL);
INSERT INTO public.star VALUES (260, 'Sabik', NULL, 1, 59, 'η Ophiuchi A', NULL);
INSERT INTO public.star VALUES (261, 'Saclateni', NULL, 1, 8, 'ζ Aurigae A', NULL);
INSERT INTO public.star VALUES (262, 'Sadachbia', NULL, 1, 4, 'γ Aquarii Aa', NULL);
INSERT INTO public.star VALUES (263, 'Sadalbari', NULL, 1, 62, 'μ Pegasi', NULL);
INSERT INTO public.star VALUES (264, 'Sadalmelik', NULL, 1, 4, 'α Aquarii A', NULL);
INSERT INTO public.star VALUES (265, 'Sadalsuud', NULL, 1, 4, 'β Aquarii A', NULL);
INSERT INTO public.star VALUES (266, 'Sadr', NULL, 1, 31, 'γ Cygni A', NULL);
INSERT INTO public.star VALUES (267, 'Saiph', NULL, 1, 60, 'κ Orionis', 'Traditional name from Arabic: سیف الجبار sayf al-jabbār, literally ''saif (''sword'') of the giant''.');
INSERT INTO public.star VALUES (268, 'Salm', NULL, 1, 62, 'τ Pegasi', NULL);
INSERT INTO public.star VALUES (269, 'Sargas', NULL, 1, 73, 'θ Scorpii A', NULL);
INSERT INTO public.star VALUES (270, 'Sarin', NULL, 1, 40, 'δ Herculis Aa', NULL);
INSERT INTO public.star VALUES (271, 'Sceptrum', NULL, 1, 36, '53 Eridani A', 'Formerly "p Sceptri" in the constellation of Sceptrum Brandenburgicum.');
INSERT INTO public.star VALUES (272, 'Scheat', NULL, 1, 62, 'β Pegasi', NULL);
INSERT INTO public.star VALUES (273, 'Schedar', NULL, 1, 18, 'α Cassiopeiae', 'Also traditionally bore the name Schedir; both originally from Arabic: صدر ṣadr (''breast''); also called الضاة الكرسي aḍ-ḍāh al-kursiyy (''the lady in the chair'' by Ulugh Beg, whence');
INSERT INTO public.star VALUES (274, 'Secunda Hyadum', NULL, 1, 78, 'δ Tauri Aa', NULL);
INSERT INTO public.star VALUES (275, 'Segin', NULL, 1, 18, 'ε Cassiopeiae', 'From an erroneous transcription of Seginus, the traditional name for γ Boötis.');
INSERT INTO public.star VALUES (276, 'Seginus', NULL, 1, 9, 'γ Boötis Aa', 'A mistranscription of the Arabic form of Boötes.');
INSERT INTO public.star VALUES (277, 'Sham', NULL, 1, 71, 'α Sagittae', NULL);
INSERT INTO public.star VALUES (278, 'Shaula', NULL, 1, 73, 'λ Scorpii Aa', NULL);
INSERT INTO public.star VALUES (279, 'Sheliak', NULL, 1, 52, 'β Lyrae Aa1', NULL);
INSERT INTO public.star VALUES (280, 'Sheratan', NULL, 1, 7, 'β Arietis A', NULL);
INSERT INTO public.star VALUES (281, 'Sirius', NULL, 1, 14, 'α Canis Majoris A', 'Ancient Greek: Σείριος ''the scorcher''; in Egyptian Sopdet, rendered in Greek as Σῶθις Sōthis. As the brightest star in the sky, Sirius has proper names in numerous cultures, including Polynesian (Māori: Takurua; Hawaiian: Ka''ulua (''Queen of Heaven''), among others). Also known as the "Dog Star".');
INSERT INTO public.star VALUES (282, 'Situla', NULL, 1, 4, 'κ Aquarii A', NULL);
INSERT INTO public.star VALUES (283, 'Skat', NULL, 1, 4, 'δ Aquarii A', NULL);
INSERT INTO public.star VALUES (284, 'Spica', NULL, 1, 86, 'α Virginis Aa', 'Other traditional names are Azimech, from Arabic: السماك الأعزل as-simāk al-ʾaʿzal (''the undefended'') and Alarph, Arabic for ''the grape gatherer''. Known in Indian astronomy as Chitra (''the bright one'').');
INSERT INTO public.star VALUES (285, 'Sualocin', NULL, 1, 32, 'α Delphini Aa', 'The name appeared in Piazzi''s Palermo Star Catalogue in 1814, added by Niccolò Cacciatore as a prank along with Rotanev (β Delphini); "Sualocin" is Nicolaus, the Latin form of Italian: Niccolò (''Nicholas''), spelt backwards.');
INSERT INTO public.star VALUES (286, 'Subra', NULL, 1, 46, 'ο Leonis Aa', NULL);
INSERT INTO public.star VALUES (287, 'Suhail', NULL, 1, 85, 'λ Velorum', 'Traditionally, this name also applied to γ Velorum (Regor).');
INSERT INTO public.star VALUES (288, 'Sulafat', NULL, 1, 52, 'γ Lyrae', NULL);
INSERT INTO public.star VALUES (289, 'Syrma', NULL, 1, 86, 'ι Virginis', NULL);
INSERT INTO public.star VALUES (290, 'Tabit', NULL, 1, 60, 'π3 Orionis', NULL);
INSERT INTO public.star VALUES (291, 'Taiyangshou', NULL, 1, 83, 'χ Ursae Majoris', 'From the Chinese name 太陽守 Tàiyángshǒu (''guard of the Sun'').');
INSERT INTO public.star VALUES (292, 'Taiyi', NULL, 1, 34, '8 Draconis', 'From the Chinese name 太乙 Tàiyǐ or 太一 Tàiyī (''the great one''), both of which refer to Tao.');
INSERT INTO public.star VALUES (293, 'Talitha', NULL, 1, 83, 'ι Ursae Majoris Aa', 'Also called Talitha Borealis, as Talitha originally referred to κ Ursae Majoris (Alkaphrah) and ι Ursae Majoris together.');
INSERT INTO public.star VALUES (294, 'Tania Australis', NULL, 1, 83, 'μ Ursae Majoris A', NULL);
INSERT INTO public.star VALUES (295, 'Tania Borealis', NULL, 1, 83, 'λ Ursae Majoris A', NULL);
INSERT INTO public.star VALUES (296, 'Tarazed', NULL, 1, 5, 'γ Aquilae', 'Alternative traditional spelling of Tarazet.');
INSERT INTO public.star VALUES (297, 'Tarf', NULL, 1, 12, 'β Cancri A', NULL);
INSERT INTO public.star VALUES (298, 'Taygeta', NULL, 1, 78, '19 Tauri Aa', 'Member of the Pleiades open star cluster (M45). Taygete was one of the Pleiades sisters in Greek mythology.');
INSERT INTO public.star VALUES (299, 'Tegmine', NULL, 1, 12, 'ζ1 Cancri A', 'Alternative traditional name of Tegmen.');
INSERT INTO public.star VALUES (300, 'Tejat', NULL, 1, 38, 'μ Geminorum Aa', 'Traditional name, also called Tejat Posterior.');
INSERT INTO public.star VALUES (301, 'Terebellum', NULL, 1, 72, 'ω Sagittarii A', 'From Ptolemy''s τετράπλευρον tetrapleuron (''quadrilateral''), a group of four stars of which ω Sagittarii is the brightest.');
INSERT INTO public.star VALUES (302, 'Thabit†', NULL, 1, 60, 'υ Orionis', NULL);
INSERT INTO public.star VALUES (303, 'Theemin', NULL, 1, 36, 'υ2 Eridani', 'Also written as Theemim or Beemin.');
INSERT INTO public.star VALUES (304, 'Thuban', NULL, 1, 34, 'α Draconis A', NULL);
INSERT INTO public.star VALUES (305, 'Tiaki', NULL, 1, 39, 'β Gruis', NULL);
INSERT INTO public.star VALUES (306, 'Tianguan', NULL, 1, 78, 'ζ Tauri A', 'In Chinese, 天關 Tiānguān (''celestial gate''). Also reported as Akkadian: Shurnarkabti-sha-shūtū (''the star in the bull towards the south'' or ''the southern star towards the chariot'').');
INSERT INTO public.star VALUES (307, 'Tianyi', NULL, 1, 34, '7 Draconis', 'From the Chinese name 天乙 Tiānyǐ or 天一 Tiānyī (''the Celestial Great One''), a deity in Taoism.');
INSERT INTO public.star VALUES (308, 'Toliman', NULL, 1, 19, 'α Centauri B', 'The name is originally from Arabic: ظليمان ẓalīmān (''two (male) ostriches'').');
INSERT INTO public.star VALUES (309, 'Torcular', NULL, 1, 66, 'ο Piscium A', NULL);
INSERT INTO public.star VALUES (310, 'Tureis', NULL, 1, 68, 'ρ Puppis A', NULL);
INSERT INTO public.star VALUES (311, 'Ukdah', NULL, 1, 42, 'ι Hydrae', NULL);
INSERT INTO public.star VALUES (312, 'Unukalhai', NULL, 1, NULL, 'α Serpentis', 'From Arabic: عنق الحية ʿunuq al-ḥayya (''the serpent''s neck''), called Cor Serpentis (''Heart of the Serpent'') in Latin.');
INSERT INTO public.star VALUES (313, 'Unurgunite', NULL, 1, 14, 'σ Canis Majoris', NULL);
INSERT INTO public.star VALUES (314, 'Vega', NULL, 1, 52, 'α Lyrae', 'The name is originally from Arabic: النسر الواقع an-nasr al-wāqiʿ (''the alighting vulture'') also translated as vulture cadens (''falling vulture'') (see also Aetos Dios, Stymphalian birds). As the second brightest star in the northern sky, Vega has names in numerous cultures. In Chinese, it is known as 織女 (''weaving girl'') from the Qi Xi love story. Vega is one of the vertices of the Summer Triangle asterism.');
INSERT INTO public.star VALUES (315, 'Vindemiatrix', NULL, 1, 86, 'ε Virginis', 'Vindemiatrix is Latin for ''(female) grape gatherer''.');
INSERT INTO public.star VALUES (316, 'Wasat', NULL, 1, 38, 'δ Geminorum Aa', NULL);
INSERT INTO public.star VALUES (317, 'Wazn', NULL, 1, 24, 'β Columbae', NULL);
INSERT INTO public.star VALUES (318, 'Wezen', NULL, 1, 14, 'δ Canis Majoris Aa', NULL);
INSERT INTO public.star VALUES (319, 'Wurren', NULL, 1, 64, 'ζ Phoenicis Aa', 'A traditional name in the culture of the Wardaman people of the Northern Territory of Australia.');
INSERT INTO public.star VALUES (320, 'Xamidimura', NULL, 1, 73, 'μ1 Scorpii Aa', NULL);
INSERT INTO public.star VALUES (321, 'Xuange', NULL, 1, 9, 'λ Boötis', 'From the Chinese name 玄戈 Xuángē (''sombre lance'').');
INSERT INTO public.star VALUES (322, 'Yed Posterior', NULL, 1, 59, 'ε Ophiuchi', NULL);
INSERT INTO public.star VALUES (323, 'Yed Prior', NULL, 1, 59, 'δ Ophiuchi', NULL);
INSERT INTO public.star VALUES (324, 'Yildun', NULL, 1, 84, 'δ Ursae Minoris', 'From yildiz, Turkish for ''star''.');
INSERT INTO public.star VALUES (325, 'Zaniah', NULL, 1, 86, 'η Virginis Aa', NULL);
INSERT INTO public.star VALUES (326, 'Zaurak', NULL, 1, 36, 'γ Eridani', 'Traditional name, alternatively spelled Zaurac; originally from Arabic: زورق zawraq (''boat'').');
INSERT INTO public.star VALUES (327, 'Zavijava', NULL, 1, 86, 'β Virginis', NULL);
INSERT INTO public.star VALUES (328, 'Zhang', NULL, 1, 42, 'υ1 Hydrae A', 'From the Chinese name 張 Zhāng (''extended net'').');
INSERT INTO public.star VALUES (329, 'Zibal', NULL, 1, 36, 'ζ Eridani Aa', NULL);
INSERT INTO public.star VALUES (330, 'Zosma', NULL, 1, 46, 'δ Leonis', NULL);
INSERT INTO public.star VALUES (331, 'Zubenelgenubi', NULL, 1, 49, 'α2 Librae Aa', NULL);
INSERT INTO public.star VALUES (332, 'Zubenelhakrabi', NULL, 1, 49, 'γ Librae A', NULL);
INSERT INTO public.star VALUES (333, 'Zubeneschamali', NULL, 1, 49, 'β Librae', NULL);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 27, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 89, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 221, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 333, true);


--
-- Name: asteroid asteroid_names; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_names UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_names; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_names UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_names; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_names UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_names; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_names UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_names; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_names UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_names; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_names UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

