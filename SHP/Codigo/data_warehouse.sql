--
-- PostgreSQL database dump
--

\restrict JMrniCYLDbzhuT2H1hufDOaFfX4KAfu3Xddfe0yfM9dLHx3SeyRYke9iJ5FYcCV

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: dim_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_cliente (
    id_cliente integer NOT NULL,
    nombre character varying(100) NOT NULL,
    segmento character varying(50),
    ciudad character varying(50),
    pais character varying(50)
);


ALTER TABLE public.dim_cliente OWNER TO postgres;

--
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_cliente_id_cliente_seq OWNER TO postgres;

--
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_cliente_id_cliente_seq OWNED BY public.dim_cliente.id_cliente;


--
-- Name: dim_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_producto (
    id_producto integer NOT NULL,
    nombre_producto character varying(100) NOT NULL,
    categoria character varying(50),
    precio_unitario numeric(10,2)
);


ALTER TABLE public.dim_producto OWNER TO postgres;

--
-- Name: dim_producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_producto_id_producto_seq OWNER TO postgres;

--
-- Name: dim_producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_producto_id_producto_seq OWNED BY public.dim_producto.id_producto;


--
-- Name: dim_tiempo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_tiempo (
    id_tiempo integer NOT NULL,
    fecha date NOT NULL,
    anio integer,
    mes integer,
    dia integer,
    trimestre integer
);


ALTER TABLE public.dim_tiempo OWNER TO postgres;

--
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_tiempo_id_tiempo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_tiempo_id_tiempo_seq OWNER TO postgres;

--
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_tiempo_id_tiempo_seq OWNED BY public.dim_tiempo.id_tiempo;


--
-- Name: fact_ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_ventas (
    id_venta integer NOT NULL,
    id_cliente integer,
    id_producto integer,
    id_tiempo integer,
    cantidad integer NOT NULL,
    monto_total numeric(12,2) NOT NULL
);


ALTER TABLE public.fact_ventas OWNER TO postgres;

--
-- Name: fact_ventas_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_ventas_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fact_ventas_id_venta_seq OWNER TO postgres;

--
-- Name: fact_ventas_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_ventas_id_venta_seq OWNED BY public.fact_ventas.id_venta;


--
-- Name: dim_cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.dim_cliente_id_cliente_seq'::regclass);


--
-- Name: dim_producto id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_producto ALTER COLUMN id_producto SET DEFAULT nextval('public.dim_producto_id_producto_seq'::regclass);


--
-- Name: dim_tiempo id_tiempo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tiempo ALTER COLUMN id_tiempo SET DEFAULT nextval('public.dim_tiempo_id_tiempo_seq'::regclass);


--
-- Name: fact_ventas id_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.fact_ventas_id_venta_seq'::regclass);


--
-- Data for Name: dim_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_cliente (id_cliente, nombre, segmento, ciudad, pais) FROM stdin;
1	Alejandro	Estudiante	Córdoba	México
2	Perla	Profesional	Veracruz	México
3	Alex	Estudiante	Córdoba	México
\.


--
-- Data for Name: dim_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_producto (id_producto, nombre_producto, categoria, precio_unitario) FROM stdin;
1	SSD Kingston NV3	Componentes	1100.50
2	Samsung Galaxy S26	Telefonía	18500.00
3	Audífonos Bluetooth	Accesorios	450.00
\.


--
-- Data for Name: dim_tiempo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_tiempo (id_tiempo, fecha, anio, mes, dia, trimestre) FROM stdin;
1	2026-05-05	2026	5	5	2
2	2026-05-07	2026	5	7	2
3	2026-06-10	2026	6	10	2
\.


--
-- Data for Name: fact_ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_ventas (id_venta, id_cliente, id_producto, id_tiempo, cantidad, monto_total) FROM stdin;
1	1	1	1	2	2201.00
2	2	2	2	1	18500.00
3	3	3	3	3	1350.00
\.


--
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_cliente_id_cliente_seq', 1, false);


--
-- Name: dim_producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_producto_id_producto_seq', 1, false);


--
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_tiempo_id_tiempo_seq', 1, false);


--
-- Name: fact_ventas_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_ventas_id_venta_seq', 1, false);


--
-- Name: dim_cliente dim_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_cliente
    ADD CONSTRAINT dim_cliente_pkey PRIMARY KEY (id_cliente);


--
-- Name: dim_producto dim_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_producto
    ADD CONSTRAINT dim_producto_pkey PRIMARY KEY (id_producto);


--
-- Name: dim_tiempo dim_tiempo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tiempo
    ADD CONSTRAINT dim_tiempo_pkey PRIMARY KEY (id_tiempo);


--
-- Name: fact_ventas fact_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_pkey PRIMARY KEY (id_venta);


--
-- Name: fact_ventas fact_ventas_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.dim_cliente(id_cliente);


--
-- Name: fact_ventas fact_ventas_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.dim_producto(id_producto);


--
-- Name: fact_ventas fact_ventas_id_tiempo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_id_tiempo_fkey FOREIGN KEY (id_tiempo) REFERENCES public.dim_tiempo(id_tiempo);


--
-- PostgreSQL database dump complete
--

\unrestrict JMrniCYLDbzhuT2H1hufDOaFfX4KAfu3Xddfe0yfM9dLHx3SeyRYke9iJ5FYcCV

