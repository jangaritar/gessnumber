--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: plays; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.plays (
    play_count integer,
    user_id integer,
    tries integer
);


ALTER TABLE public.plays OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    usernames character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: plays; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.plays VALUES (2, 9, NULL);
INSERT INTO public.plays VALUES (5, 8, NULL);
INSERT INTO public.plays VALUES (7, 1, 3);
INSERT INTO public.plays VALUES (1, 1, 3);
INSERT INTO public.plays VALUES (1, 1, 3);
INSERT INTO public.plays VALUES (1, 1, NULL);
INSERT INTO public.plays VALUES (1, 11, 633);
INSERT INTO public.plays VALUES (1, 11, 633);
INSERT INTO public.plays VALUES (1, 10, 776);
INSERT INTO public.plays VALUES (1, 10, 776);
INSERT INTO public.plays VALUES (1, 10, 776);
INSERT INTO public.plays VALUES (1, 10, 776);
INSERT INTO public.plays VALUES (1, 10, 776);
INSERT INTO public.plays VALUES (1, 1, NULL);
INSERT INTO public.plays VALUES (1, 1, 15);
INSERT INTO public.plays VALUES (1, 12, NULL);
INSERT INTO public.plays VALUES (1, 12, 164);
INSERT INTO public.plays VALUES (1, 12, NULL);
INSERT INTO public.plays VALUES (1, 12, 957);
INSERT INTO public.plays VALUES (1, 13, NULL);
INSERT INTO public.plays VALUES (1, 13, 958);
INSERT INTO public.plays VALUES (1, 13, NULL);
INSERT INTO public.plays VALUES (1, 13, 318);
INSERT INTO public.plays VALUES (1, 12, NULL);
INSERT INTO public.plays VALUES (1, 12, 212);
INSERT INTO public.plays VALUES (1, 12, NULL);
INSERT INTO public.plays VALUES (1, 12, 331);
INSERT INTO public.plays VALUES (1, 12, NULL);
INSERT INTO public.plays VALUES (1, 12, 313);
INSERT INTO public.plays VALUES (1, 14, NULL);
INSERT INTO public.plays VALUES (1, 14, 595);
INSERT INTO public.plays VALUES (1, 14, NULL);
INSERT INTO public.plays VALUES (1, 14, 881);
INSERT INTO public.plays VALUES (1, 15, NULL);
INSERT INTO public.plays VALUES (1, 15, 555);
INSERT INTO public.plays VALUES (1, 15, NULL);
INSERT INTO public.plays VALUES (1, 15, 186);
INSERT INTO public.plays VALUES (1, 14, NULL);
INSERT INTO public.plays VALUES (1, 14, 921);
INSERT INTO public.plays VALUES (1, 14, NULL);
INSERT INTO public.plays VALUES (1, 14, 851);
INSERT INTO public.plays VALUES (1, 14, NULL);
INSERT INTO public.plays VALUES (1, 14, 308);
INSERT INTO public.plays VALUES (1, 16, NULL);
INSERT INTO public.plays VALUES (1, 16, 22);
INSERT INTO public.plays VALUES (1, 16, NULL);
INSERT INTO public.plays VALUES (1, 16, 232);
INSERT INTO public.plays VALUES (1, 17, NULL);
INSERT INTO public.plays VALUES (1, 17, 491);
INSERT INTO public.plays VALUES (1, 17, NULL);
INSERT INTO public.plays VALUES (1, 17, 452);
INSERT INTO public.plays VALUES (1, 16, NULL);
INSERT INTO public.plays VALUES (1, 16, 513);
INSERT INTO public.plays VALUES (1, 16, NULL);
INSERT INTO public.plays VALUES (1, 16, 859);
INSERT INTO public.plays VALUES (1, 16, NULL);
INSERT INTO public.plays VALUES (1, 16, 385);
INSERT INTO public.plays VALUES (NULL, 18, 798);
INSERT INTO public.plays VALUES (NULL, 18, 621);
INSERT INTO public.plays VALUES (NULL, 19, 508);
INSERT INTO public.plays VALUES (NULL, 19, 61);
INSERT INTO public.plays VALUES (NULL, 18, 981);
INSERT INTO public.plays VALUES (NULL, 18, 103);
INSERT INTO public.plays VALUES (NULL, 18, 606);
INSERT INTO public.plays VALUES (NULL, 20, 877);
INSERT INTO public.plays VALUES (NULL, 20, 50);
INSERT INTO public.plays VALUES (NULL, 21, 378);
INSERT INTO public.plays VALUES (NULL, 21, 387);
INSERT INTO public.plays VALUES (NULL, 20, 120);
INSERT INTO public.plays VALUES (NULL, 20, 985);
INSERT INTO public.plays VALUES (NULL, 20, 325);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Jose');
INSERT INTO public.users VALUES (2, 's');
INSERT INTO public.users VALUES (3, 'user_1724722361551');
INSERT INTO public.users VALUES (4, 'user_1724722361550');
INSERT INTO public.users VALUES (5, 'David');
INSERT INTO public.users VALUES (6, 'Davida¿');
INSERT INTO public.users VALUES (7, 'Fed');
INSERT INTO public.users VALUES (8, 'user_1724724617753');
INSERT INTO public.users VALUES (9, 'user_1724724617752');
INSERT INTO public.users VALUES (10, 'user_1724726450908');
INSERT INTO public.users VALUES (11, 'user_1724726450907');
INSERT INTO public.users VALUES (12, 'user_1724726679751');
INSERT INTO public.users VALUES (13, 'user_1724726679750');
INSERT INTO public.users VALUES (14, 'user_1724726855020');
INSERT INTO public.users VALUES (15, 'user_1724726855019');
INSERT INTO public.users VALUES (16, 'user_1724727036562');
INSERT INTO public.users VALUES (17, 'user_1724727036561');
INSERT INTO public.users VALUES (18, 'user_1724727289516');
INSERT INTO public.users VALUES (19, 'user_1724727289515');
INSERT INTO public.users VALUES (20, 'user_1724727360758');
INSERT INTO public.users VALUES (21, 'user_1724727360757');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: users users_user_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_id_key UNIQUE (user_id);


--
-- Name: plays fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.plays
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

