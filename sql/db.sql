--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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

--
-- Name: notify_messenger_messages(); Type: FUNCTION; Schema: public; Owner: rj
--

CREATE FUNCTION public.notify_messenger_messages() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            BEGIN
                PERFORM pg_notify('messenger_messages', NEW.queue_name::text);
                RETURN NEW;
            END;
        $$;


ALTER FUNCTION public.notify_messenger_messages() OWNER TO rj;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: category; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE public.category OWNER TO rj;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO rj;

--
-- Name: conf; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.conf (
    id integer NOT NULL,
    language_id integer,
    sitename character varying(255) NOT NULL,
    keywords text,
    description character varying(255) DEFAULT NULL::character varying,
    address character varying(255) DEFAULT NULL::character varying,
    phone character varying(25) DEFAULT NULL::character varying,
    email character varying(55) DEFAULT NULL::character varying,
    logo character varying(255) DEFAULT NULL::character varying,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    note character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.conf OWNER TO rj;

--
-- Name: COLUMN conf.keywords; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public.conf.keywords IS '(DC2Type:simple_array)';


--
-- Name: COLUMN conf.updated_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public.conf.updated_at IS '(DC2Type:datetime_immutable)';


--
-- Name: conf_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.conf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_id_seq OWNER TO rj;

--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO rj;

--
-- Name: feedback; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.feedback (
    id integer NOT NULL,
    node_id integer,
    firstname character varying(15) DEFAULT NULL::character varying,
    lastname character varying(15) DEFAULT NULL::character varying,
    email character varying(35) DEFAULT NULL::character varying,
    phone character varying(20) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    body text NOT NULL,
    country character varying(30) DEFAULT NULL::character varying
);


ALTER TABLE public.feedback OWNER TO rj;

--
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedback_id_seq OWNER TO rj;

--
-- Name: image; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.image (
    id integer NOT NULL,
    node_id integer NOT NULL,
    image character varying(255) NOT NULL,
    title character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.image OWNER TO rj;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO rj;

--
-- Name: language; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.language (
    id integer NOT NULL,
    language character varying(30) NOT NULL,
    prefix character varying(15) NOT NULL,
    locale character varying(15) NOT NULL
);


ALTER TABLE public.language OWNER TO rj;

--
-- Name: language_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_id_seq OWNER TO rj;

--
-- Name: link; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.link (
    id integer NOT NULL,
    menu_id integer NOT NULL,
    title character varying(255) NOT NULL,
    link character varying(255) NOT NULL,
    weight smallint NOT NULL
);


ALTER TABLE public.link OWNER TO rj;

--
-- Name: link_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.link_id_seq OWNER TO rj;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.menu (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE public.menu OWNER TO rj;

--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO rj;

--
-- Name: messenger_messages; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.messenger_messages (
    id bigint NOT NULL,
    body text NOT NULL,
    headers text NOT NULL,
    queue_name character varying(190) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    available_at timestamp(0) without time zone NOT NULL,
    delivered_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.messenger_messages OWNER TO rj;

--
-- Name: COLUMN messenger_messages.created_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public.messenger_messages.created_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN messenger_messages.available_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public.messenger_messages.available_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN messenger_messages.delivered_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public.messenger_messages.delivered_at IS '(DC2Type:datetime_immutable)';


--
-- Name: messenger_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.messenger_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messenger_messages_id_seq OWNER TO rj;

--
-- Name: messenger_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rj
--

ALTER SEQUENCE public.messenger_messages_id_seq OWNED BY public.messenger_messages.id;


--
-- Name: node; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.node (
    id integer NOT NULL,
    language_id integer,
    category_id integer,
    parent_id integer,
    title character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    body text,
    image character varying(255) DEFAULT NULL::character varying,
    summary text,
    updated_at timestamp(0) without time zone NOT NULL,
    video character varying(255) DEFAULT NULL::character varying,
    audio character varying(255) DEFAULT NULL::character varying,
    qr character varying(255) DEFAULT NULL::character varying,
    phone character varying(255) DEFAULT NULL::character varying,
    latitude double precision,
    longitude double precision,
    address character varying(255) DEFAULT NULL::character varying,
    price integer
);


ALTER TABLE public.node OWNER TO rj;

--
-- Name: COLUMN node.created_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public.node.created_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN node.updated_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public.node.updated_at IS '(DC2Type:datetime_immutable)';


--
-- Name: node_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.node_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.node_id_seq OWNER TO rj;

--
-- Name: node_region; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.node_region (
    node_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.node_region OWNER TO rj;

--
-- Name: node_tag; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.node_tag (
    node_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.node_tag OWNER TO rj;

--
-- Name: order; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    node_id integer NOT NULL,
    consumer_id integer NOT NULL,
    quantity smallint NOT NULL,
    amount integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    paid_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    used_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status smallint NOT NULL,
    price integer NOT NULL,
    cancelled_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    refunded_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    sn character varying(255) NOT NULL,
    wx_trans_id character varying(255) DEFAULT NULL::character varying,
    bank_type character varying(255) DEFAULT NULL::character varying,
    wx_prepay_id character varying(255) DEFAULT NULL::character varying,
    deleted boolean NOT NULL
);


ALTER TABLE public."order" OWNER TO rj;

--
-- Name: COLUMN "order".created_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public."order".created_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN "order".paid_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public."order".paid_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN "order".used_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public."order".used_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN "order".cancelled_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public."order".cancelled_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN "order".refunded_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public."order".refunded_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN "order".deleted_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public."order".deleted_at IS '(DC2Type:datetime_immutable)';


--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO rj;

--
-- Name: page; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.page (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE public.page OWNER TO rj;

--
-- Name: page_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_id_seq OWNER TO rj;

--
-- Name: refund; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.refund (
    id integer NOT NULL,
    ord_id integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    reason smallint NOT NULL,
    note character varying(255) DEFAULT NULL::character varying,
    sn character varying(255) NOT NULL,
    wx_refund_id character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.refund OWNER TO rj;

--
-- Name: COLUMN refund.created_at; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public.refund.created_at IS '(DC2Type:datetime_immutable)';


--
-- Name: refund_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.refund_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refund_id_seq OWNER TO rj;

--
-- Name: region; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.region (
    id integer NOT NULL,
    page_id integer,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    count smallint NOT NULL,
    icon character varying(20) DEFAULT NULL::character varying,
    fields text,
    description character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.region OWNER TO rj;

--
-- Name: COLUMN region.fields; Type: COMMENT; Schema: public; Owner: rj
--

COMMENT ON COLUMN public.region.fields IS '(DC2Type:simple_array)';


--
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_id_seq OWNER TO rj;

--
-- Name: spec; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.spec (
    id integer NOT NULL,
    node_id integer NOT NULL,
    name character varying(25) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.spec OWNER TO rj;

--
-- Name: spec_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.spec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spec_id_seq OWNER TO rj;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE public.tag OWNER TO rj;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO rj;

--
-- Name: user; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL,
    plain_password character varying(255) DEFAULT NULL::character varying,
    openid character varying(255) DEFAULT NULL::character varying,
    name character varying(255) DEFAULT NULL::character varying,
    phone character varying(255) DEFAULT NULL::character varying,
    avatar character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public."user" OWNER TO rj;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: rj
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO rj;

--
-- Name: user_node; Type: TABLE; Schema: public; Owner: rj
--

CREATE TABLE public.user_node (
    user_id integer NOT NULL,
    node_id integer NOT NULL
);


ALTER TABLE public.user_node OWNER TO rj;

--
-- Name: messenger_messages id; Type: DEFAULT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.messenger_messages ALTER COLUMN id SET DEFAULT nextval('public.messenger_messages_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.category (id, name, label) FROM stdin;
\.


--
-- Data for Name: conf; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.conf (id, language_id, sitename, keywords, description, address, phone, email, logo, updated_at, note) FROM stdin;
4	\N	人杰特汽2	\N	\N	\N	\N	\N	\N	\N	\N
3	\N	人杰特汽	人杰特汽	人杰特汽	\N	\N	\N	logo-66f4e56a80593405568721.png	2024-09-26 04:39:06	\N
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20240925045608	2024-09-25 04:56:18	394
DoctrineMigrations\\Version20240925123107	2024-09-25 12:31:11	20
\.


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.feedback (id, node_id, firstname, lastname, email, phone, title, body, country) FROM stdin;
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.image (id, node_id, image, title) FROM stdin;
5	1	it-consulting-66f40406e3943016659280.jpg	\N
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.language (id, language, prefix, locale) FROM stdin;
\.


--
-- Data for Name: link; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.link (id, menu_id, title, link, weight) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.menu (id, name, label) FROM stdin;
\.


--
-- Data for Name: messenger_messages; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.messenger_messages (id, body, headers, queue_name, created_at, available_at, delivered_at) FROM stdin;
\.


--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.node (id, language_id, category_id, parent_id, title, created_at, body, image, summary, updated_at, video, audio, qr, phone, latitude, longitude, address, price) FROM stdin;
1	\N	\N	\N	n1	2024-09-25 12:32:50	\N	\N	\N	2024-09-25 12:32:50	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: node_region; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.node_region (node_id, region_id) FROM stdin;
1	1
\.


--
-- Data for Name: node_tag; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.node_tag (node_id, tag_id) FROM stdin;
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public."order" (id, node_id, consumer_id, quantity, amount, created_at, paid_at, used_at, status, price, cancelled_at, refunded_at, deleted_at, sn, wx_trans_id, bank_type, wx_prepay_id, deleted) FROM stdin;
\.


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.page (id, name, label) FROM stdin;
1	首页	home
2	页脚	footer
\.


--
-- Data for Name: refund; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.refund (id, ord_id, created_at, reason, note, sn, wx_refund_id) FROM stdin;
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.region (id, page_id, name, label, count, icon, fields, description) FROM stdin;
1	1	轮播图	slide	4	\N	body,image,summary,regions,tags,createdAt,images	\N
2	\N	页脚	footer	1	\N	\N	\N
\.


--
-- Data for Name: spec; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.spec (id, node_id, name, value) FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.tag (id, name, label) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public."user" (id, username, roles, password, plain_password, openid, name, phone, avatar) FROM stdin;
1	al	["ROLE_SUPER_ADMIN"]	$2y$13$ryGwjOzYPJM2hbLAOH.fYeeR2Z2IQrDDbxLbk.4w9C2v6z7newd82	\N	\N	al	\N	\N
\.


--
-- Data for Name: user_node; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.user_node (user_id, node_id) FROM stdin;
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- Name: conf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.conf_id_seq', 4, true);


--
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.feedback_id_seq', 1, false);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.image_id_seq', 5, true);


--
-- Name: language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.language_id_seq', 1, false);


--
-- Name: link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.link_id_seq', 1, false);


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.menu_id_seq', 1, false);


--
-- Name: messenger_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.messenger_messages_id_seq', 1, false);


--
-- Name: node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.node_id_seq', 1, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- Name: page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.page_id_seq', 2, true);


--
-- Name: refund_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.refund_id_seq', 1, false);


--
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.region_id_seq', 2, true);


--
-- Name: spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.spec_id_seq', 1, false);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: conf conf_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.conf
    ADD CONSTRAINT conf_pkey PRIMARY KEY (id);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Name: link link_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT link_pkey PRIMARY KEY (id);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: messenger_messages messenger_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.messenger_messages
    ADD CONSTRAINT messenger_messages_pkey PRIMARY KEY (id);


--
-- Name: node node_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT node_pkey PRIMARY KEY (id);


--
-- Name: node_region node_region_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.node_region
    ADD CONSTRAINT node_region_pkey PRIMARY KEY (node_id, region_id);


--
-- Name: node_tag node_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.node_tag
    ADD CONSTRAINT node_tag_pkey PRIMARY KEY (node_id, tag_id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: page page_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.page
    ADD CONSTRAINT page_pkey PRIMARY KEY (id);


--
-- Name: refund refund_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT refund_pkey PRIMARY KEY (id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- Name: spec spec_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.spec
    ADD CONSTRAINT spec_pkey PRIMARY KEY (id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: user_node user_node_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.user_node
    ADD CONSTRAINT user_node_pkey PRIMARY KEY (user_id, node_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: idx_14f389a882f1baf4; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_14f389a882f1baf4 ON public.conf USING btree (language_id);


--
-- Name: idx_36ac99f1ccd7e912; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_36ac99f1ccd7e912 ON public.link USING btree (menu_id);


--
-- Name: idx_70ac95f8460d9fd7; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_70ac95f8460d9fd7 ON public.node_tag USING btree (node_id);


--
-- Name: idx_70ac95f8bad26311; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_70ac95f8bad26311 ON public.node_tag USING btree (tag_id);


--
-- Name: idx_75ea56e016ba31db; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_75ea56e016ba31db ON public.messenger_messages USING btree (delivered_at);


--
-- Name: idx_75ea56e0e3bd61ce; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_75ea56e0e3bd61ce ON public.messenger_messages USING btree (available_at);


--
-- Name: idx_75ea56e0fb7336f0; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_75ea56e0fb7336f0 ON public.messenger_messages USING btree (queue_name);


--
-- Name: idx_857fe84512469de2; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_857fe84512469de2 ON public.node USING btree (category_id);


--
-- Name: idx_857fe845727aca70; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_857fe845727aca70 ON public.node USING btree (parent_id);


--
-- Name: idx_857fe84582f1baf4; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_857fe84582f1baf4 ON public.node USING btree (language_id);


--
-- Name: idx_bb70e4d3460d9fd7; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_bb70e4d3460d9fd7 ON public.node_region USING btree (node_id);


--
-- Name: idx_bb70e4d398260155; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_bb70e4d398260155 ON public.node_region USING btree (region_id);


--
-- Name: idx_c00e173e460d9fd7; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_c00e173e460d9fd7 ON public.spec USING btree (node_id);


--
-- Name: idx_c53d045f460d9fd7; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_c53d045f460d9fd7 ON public.image USING btree (node_id);


--
-- Name: idx_d2294458460d9fd7; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_d2294458460d9fd7 ON public.feedback USING btree (node_id);


--
-- Name: idx_f529939837fdbd6d; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_f529939837fdbd6d ON public."order" USING btree (consumer_id);


--
-- Name: idx_f5299398460d9fd7; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_f5299398460d9fd7 ON public."order" USING btree (node_id);


--
-- Name: idx_f62f176c4663e4; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_f62f176c4663e4 ON public.region USING btree (page_id);


--
-- Name: idx_fffea48c460d9fd7; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_fffea48c460d9fd7 ON public.user_node USING btree (node_id);


--
-- Name: idx_fffea48ca76ed395; Type: INDEX; Schema: public; Owner: rj
--

CREATE INDEX idx_fffea48ca76ed395 ON public.user_node USING btree (user_id);


--
-- Name: uniq_5b2c1458e636d3f5; Type: INDEX; Schema: public; Owner: rj
--

CREATE UNIQUE INDEX uniq_5b2c1458e636d3f5 ON public.refund USING btree (ord_id);


--
-- Name: uniq_8d93d649f85e0677; Type: INDEX; Schema: public; Owner: rj
--

CREATE UNIQUE INDEX uniq_8d93d649f85e0677 ON public."user" USING btree (username);


--
-- Name: messenger_messages notify_trigger; Type: TRIGGER; Schema: public; Owner: rj
--

CREATE TRIGGER notify_trigger AFTER INSERT OR UPDATE ON public.messenger_messages FOR EACH ROW EXECUTE FUNCTION public.notify_messenger_messages();


--
-- Name: conf fk_14f389a882f1baf4; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.conf
    ADD CONSTRAINT fk_14f389a882f1baf4 FOREIGN KEY (language_id) REFERENCES public.language(id);


--
-- Name: link fk_36ac99f1ccd7e912; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT fk_36ac99f1ccd7e912 FOREIGN KEY (menu_id) REFERENCES public.menu(id);


--
-- Name: refund fk_5b2c1458e636d3f5; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT fk_5b2c1458e636d3f5 FOREIGN KEY (ord_id) REFERENCES public."order"(id);


--
-- Name: node_tag fk_70ac95f8460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.node_tag
    ADD CONSTRAINT fk_70ac95f8460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id) ON DELETE CASCADE;


--
-- Name: node_tag fk_70ac95f8bad26311; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.node_tag
    ADD CONSTRAINT fk_70ac95f8bad26311 FOREIGN KEY (tag_id) REFERENCES public.tag(id) ON DELETE CASCADE;


--
-- Name: node fk_857fe84512469de2; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT fk_857fe84512469de2 FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: node fk_857fe845727aca70; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT fk_857fe845727aca70 FOREIGN KEY (parent_id) REFERENCES public.node(id);


--
-- Name: node fk_857fe84582f1baf4; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT fk_857fe84582f1baf4 FOREIGN KEY (language_id) REFERENCES public.language(id);


--
-- Name: node_region fk_bb70e4d3460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.node_region
    ADD CONSTRAINT fk_bb70e4d3460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id) ON DELETE CASCADE;


--
-- Name: node_region fk_bb70e4d398260155; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.node_region
    ADD CONSTRAINT fk_bb70e4d398260155 FOREIGN KEY (region_id) REFERENCES public.region(id) ON DELETE CASCADE;


--
-- Name: spec fk_c00e173e460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.spec
    ADD CONSTRAINT fk_c00e173e460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id);


--
-- Name: image fk_c53d045f460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fk_c53d045f460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id);


--
-- Name: feedback fk_d2294458460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT fk_d2294458460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id);


--
-- Name: order fk_f529939837fdbd6d; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_f529939837fdbd6d FOREIGN KEY (consumer_id) REFERENCES public."user"(id);


--
-- Name: order fk_f5299398460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_f5299398460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id);


--
-- Name: region fk_f62f176c4663e4; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT fk_f62f176c4663e4 FOREIGN KEY (page_id) REFERENCES public.page(id);


--
-- Name: user_node fk_fffea48c460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.user_node
    ADD CONSTRAINT fk_fffea48c460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id) ON DELETE CASCADE;


--
-- Name: user_node fk_fffea48ca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: rj
--

ALTER TABLE ONLY public.user_node
    ADD CONSTRAINT fk_fffea48ca76ed395 FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

