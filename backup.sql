--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: features; Type: TABLE; Schema: public; Owner: kylenissley
--

CREATE TABLE public.features (
    id integer NOT NULL,
    product_id integer NOT NULL,
    feature character varying(50) NOT NULL,
    value character varying(50) NOT NULL
);


ALTER TABLE public.features OWNER TO kylenissley;

--
-- Name: photos; Type: TABLE; Schema: public; Owner: kylenissley
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    style_id integer NOT NULL,
    url text NOT NULL,
    thumbnail_url text NOT NULL
);


ALTER TABLE public.photos OWNER TO kylenissley;

--
-- Name: products; Type: TABLE; Schema: public; Owner: kylenissley
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slogan character varying(300) NOT NULL,
    description character varying(500) NOT NULL,
    category character varying(300) NOT NULL,
    default_price character varying(50) NOT NULL
);


ALTER TABLE public.products OWNER TO kylenissley;

--
-- Name: related_products; Type: TABLE; Schema: public; Owner: kylenissley
--

CREATE TABLE public.related_products (
    id integer NOT NULL,
    curr_prod_id integer NOT NULL,
    related_prod_id integer NOT NULL
);


ALTER TABLE public.related_products OWNER TO kylenissley;

--
-- Name: styles; Type: TABLE; Schema: public; Owner: kylenissley
--

CREATE TABLE public.styles (
    id integer NOT NULL,
    product_id integer NOT NULL,
    name character varying(50) NOT NULL,
    sale_price character varying(50),
    original_price character varying(50) NOT NULL,
    default_style boolean NOT NULL
);


ALTER TABLE public.styles OWNER TO kylenissley;

--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: kylenissley
--

COPY public.features (id, product_id, feature, value) FROM stdin;
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: kylenissley
--

COPY public.photos (id, style_id, url, thumbnail_url) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: kylenissley
--

COPY public.products (id, name, slogan, description, category, default_price) FROM stdin;
\.


--
-- Data for Name: related_products; Type: TABLE DATA; Schema: public; Owner: kylenissley
--

COPY public.related_products (id, curr_prod_id, related_prod_id) FROM stdin;
\.


--
-- Data for Name: styles; Type: TABLE DATA; Schema: public; Owner: kylenissley
--

COPY public.styles (id, product_id, name, sale_price, original_price, default_style) FROM stdin;
\.


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: kylenissley
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: kylenissley
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: kylenissley
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: related_products related_products_pkey; Type: CONSTRAINT; Schema: public; Owner: kylenissley
--

ALTER TABLE ONLY public.related_products
    ADD CONSTRAINT related_products_pkey PRIMARY KEY (id);


--
-- Name: styles styles_pkey; Type: CONSTRAINT; Schema: public; Owner: kylenissley
--

ALTER TABLE ONLY public.styles
    ADD CONSTRAINT styles_pkey PRIMARY KEY (id);


--
-- Name: features features_id; Type: FK CONSTRAINT; Schema: public; Owner: kylenissley
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_id FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: photos photos_id; Type: FK CONSTRAINT; Schema: public; Owner: kylenissley
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_id FOREIGN KEY (style_id) REFERENCES public.styles(id);


--
-- Name: related_products related_product_id; Type: FK CONSTRAINT; Schema: public; Owner: kylenissley
--

ALTER TABLE ONLY public.related_products
    ADD CONSTRAINT related_product_id FOREIGN KEY (curr_prod_id) REFERENCES public.products(id);


--
-- Name: styles styles_id; Type: FK CONSTRAINT; Schema: public; Owner: kylenissley
--

ALTER TABLE ONLY public.styles
    ADD CONSTRAINT styles_id FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

