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
    country character varying(30) DEFAULT NULL::character varying,
    sex smallint,
    province character varying(255) DEFAULT NULL::character varying,
    city character varying(255) DEFAULT NULL::character varying,
    note character varying(255) DEFAULT NULL::character varying,
    name character varying(255) DEFAULT NULL::character varying,
    type smallint
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
    value character varying(255)
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
1	随车起重运输车	cate1
2	汽车起重机	cate2
3	其它	other
\.


--
-- Data for Name: conf; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.conf (id, language_id, sitename, keywords, description, address, phone, email, logo, updated_at, note) FROM stdin;
3	\N	人杰特汽	人杰特汽	人杰特汽	\N	\N	\N	logo-66f4e56a80593405568721.png	2024-09-26 04:39:06	\N
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20240925045608	2024-09-25 04:56:18	394
DoctrineMigrations\\Version20240925123107	2024-09-25 12:31:11	20
DoctrineMigrations\\Version20240929010350	2024-09-29 01:04:19	12
DoctrineMigrations\\Version20241004050948	2024-10-04 05:09:51	16
DoctrineMigrations\\Version20241004082716	2024-10-04 08:27:19	12
DoctrineMigrations\\Version20241004102901	2024-10-04 10:29:04	9
\.


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.feedback (id, node_id, firstname, lastname, email, phone, title, body, country, sex, province, city, note, name, type) FROM stdin;
18	\N	\N	\N	\N	33	\N	33	\N	0	天津市	和平区	333	111	1
19	\N	\N	\N	\N	5555	\N	555	\N	\N	\N	\N	\N	55	0
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.image (id, node_id, image, title) FROM stdin;
6	1	p-2-66f8a5cf4b0a2628898561.jpg	60度角图
7	1	p-3-66f8a5cf4e2a3958168705.jpg	正侧面
8	1	p-4-66f8a5cf4e86f001125249.jpg	长吊机图
5	1	p-1-66f8a5cf51491428362740.jpg	正面图
9	1	p-5-66f8a5ee61c78446770414.jpg	\N
10	1	p-6-66f8a5ee624d2639907380.jpg	\N
11	1	p-7-66f8a5ee62a3c915367614.jpg	\N
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
6	\N	1	\N	公司荣誉3	2024-10-03 03:34:22	<p>公司荣誉3</p>	honor-3-66fe10be7d6d0775076913.jpg	公司荣誉3	2024-10-03 03:34:22	\N	\N	\N	0	0	\N	0	\N
9	\N	1	\N	轮播图1	2024-10-04 01:49:21	<p>轮播图1</p>	home1-66ff55fdb6355141312297.jpg	轮播图1	2024-10-04 02:42:05	\N	\N	\N	0	0	\N	0	\N
8	\N	1	\N	轮播图1	2024-10-04 01:49:06	<p>轮播图1</p>	home1-66ff560791e73453626871.jpg	轮播图1	2024-10-04 02:42:15	\N	\N	\N	0	0	\N	0	\N
7	\N	1	\N	轮播图1	2024-10-04 01:48:49	<p>轮播图1轮播图1</p>	home1-66ff560f2d0cd487817194.jpg	轮播图1	2024-10-04 02:42:23	\N	\N	\N	0	0	\N	0	\N
12	\N	1	\N	随车起重运输车2	2024-10-04 02:49:50	\N	slider-2-66ff57ced1e95179465647.jpg	\N	2024-10-04 02:49:50	\N	\N	\N	0	0	\N	0	\N
13	\N	1	\N	随车起重运输车3	2024-10-04 02:50:16	\N	slider-2-66ff57e94e4b8575644571.jpg	\N	2024-10-04 02:50:17	\N	\N	\N	0	0	\N	0	\N
14	\N	1	\N	汽车起重机1	2024-10-04 02:50:35	\N	slider-2-66ff57fc52706123570225.jpg	\N	2024-10-04 02:50:36	\N	\N	\N	0	0	\N	0	\N
31	\N	1	\N	领导关怀4	2024-10-04 06:59:26	\N	concern-2-66ff924f0b818315012866.jpg	\N	2024-10-04 06:59:27	\N	\N	\N	0	0	\N	0	\N
32	\N	1	\N	领导关怀5	2024-10-04 06:59:39	\N	concern-3-66ff925b8f58f655076767.jpg	\N	2024-10-04 06:59:39	\N	\N	\N	0	0	\N	0	\N
40	\N	1	\N	直销活动1	2024-10-04 07:47:58	<h2><strong>直销活动</strong></h2>	honor-4-66ff9daeaf5ab427977774.jpg	\N	2024-10-04 07:47:58	\N	\N	\N	0	0	\N	0	\N
41	\N	1	\N	促销活动1	2024-10-04 07:48:27	<p>促销活动1</p>	honor-4-66ff9dcc7e928571520588.jpg	\N	2024-10-04 07:48:28	\N	\N	\N	0	0	\N	0	\N
42	\N	1	\N	联名活动1	2024-10-04 07:48:46	<p>联名活动1</p>	honor-3-66ff9ddec9b38516455198.jpg	\N	2024-10-04 07:48:46	\N	\N	\N	0	0	\N	0	\N
43	\N	1	\N	定制活动1	2024-10-04 07:49:06	<p>定制活动1</p>	honor-3-66ff9df362542091947467.jpg	\N	2024-10-04 07:49:07	\N	\N	\N	0	0	\N	0	\N
44	\N	1	\N	新闻资讯5	2024-10-04 08:06:58	<p>新闻资讯5</p>	honor-3-66ffa222b6198336573735.jpg	新闻资讯5	2024-10-04 08:06:58	\N	\N	\N	0	0	\N	0	\N
45	\N	1	\N	新闻资讯6	2024-10-04 08:07:34	<p>新闻资讯6</p>	concern-1-66ff9550df5c8923316928-66ffa247359ac699278547.jpg	新闻资讯6	2024-10-04 08:07:35	\N	\N	\N	0	0	\N	0	\N
46	\N	1	\N	产品1	2024-10-04 09:15:12	<p>产品1</p>	product-66ffb22114c0f592238034.png	产品1	2024-10-04 09:15:13	\N	\N	\N	0	0	\N	0	\N
47	\N	1	\N	产品2	2024-10-04 09:17:25	<p>产品2</p>	product-66ffb2a66befe526644133.png	产品2	2024-10-04 09:17:26	\N	\N	\N	0	0	\N	0	\N
48	\N	1	\N	产品3	2024-10-04 09:17:45	<p>产品3</p>	product-66ffb2b9f0cb8512530796.png	产品3	2024-10-04 09:17:45	\N	\N	\N	0	0	\N	0	\N
49	\N	1	\N	产品4	2024-10-04 09:19:14	<p>产品4</p>	product-66ffb313526bb541639161.png	产品4	2024-10-04 09:19:15	\N	\N	\N	0	0	\N	0	\N
50	\N	1	\N	产品5	2024-10-04 09:19:29	<p>产品5</p>	product-66ffb32278f13118541315.png	产品6	2024-10-04 09:19:30	\N	\N	\N	0	0	\N	0	\N
51	\N	1	\N	产品6	2024-10-04 09:19:41	<p>产品6</p>	product-66ffb32dad2ad268426387.png	产品6	2024-10-04 09:19:41	\N	\N	\N	0	0	\N	0	\N
52	\N	1	\N	产品7	2024-10-04 09:19:53	<p>产品7</p>	product-66ffb339f10e8584857452.png	产品7	2024-10-04 09:19:53	\N	\N	\N	0	0	\N	0	\N
53	\N	1	\N	产品8	2024-10-04 09:20:03	<p>产品8</p>	product-66ffb3441503b033202049.png	产品8	2024-10-04 09:20:04	\N	\N	\N	0	0	\N	0	\N
54	\N	1	\N	产品9	2024-10-04 09:20:14	<p>产品9</p>	product-66ffb34f756f4222260426.png	产品9	2024-10-04 09:20:15	\N	\N	\N	0	0	\N	0	\N
55	\N	1	\N	产品10	2024-10-04 09:20:25	<p>产品10</p>	product-66ffb35a00fe6055158148.png	产品10	2024-10-04 09:20:26	\N	\N	\N	0	0	\N	0	\N
56	\N	1	\N	产品11	2024-10-04 09:20:35	<p>产品11</p>	product-66ffb363e1a35551210151.png	产品11	2024-10-04 09:20:35	\N	\N	\N	0	0	\N	0	\N
57	\N	1	\N	产品12	2024-10-04 09:20:45	<p>产品12</p>	product-66ffb36da08cb780889011.png	产品12	2024-10-04 09:20:45	\N	\N	\N	0	0	\N	0	\N
58	\N	1	\N	产品13	2024-10-04 09:20:56	<p>产品13</p>	product-66ffb37903f3b931558553.png	产品13	2024-10-04 09:20:57	\N	\N	\N	0	0	\N	0	\N
59	\N	1	\N	产品14	2024-10-04 09:21:06	<p>产品14</p>	product-66ffb38370a74463091111.png	产品14	2024-10-04 09:21:07	\N	\N	\N	0	0	\N	0	\N
60	\N	1	\N	产品15	2024-10-04 09:21:17	<p>产品15</p>	product-66ffb38de0ff2042871117.png	产品15	2024-10-04 09:21:17	\N	\N	\N	0	0	\N	0	\N
61	\N	1	\N	产品16	2024-10-04 09:21:28	<p>产品16</p>	product-66ffb39927393869025222.png	产品16	2024-10-04 09:21:29	\N	\N	\N	0	0	\N	0	\N
3	\N	1	\N	公司荣誉-标题	2024-10-03 02:38:53	<p>人杰特种汽车将持续秉承“专业、信赖、科技”的经营理念和“严格、踏实、上进、创新”的企业精神，以“制造满足顾客需要，为用户创造更高附加值的产品”为目标，不断推陈出新，用人品打造精品，用精品服务社会，努力成为中国最全心全意为客户创造更高附加值的产品;以雄厚的经济实力、领先的技术、科学的管理、完善的服务体系缔造中国专用车更高品质。</p>	\N	\N	2024-10-03 02:38:53	\N	\N	\N	0	0	\N	0	\N
2	\N	1	\N	公司介绍	2024-10-03 02:37:33	<p><span style="background-color:rgb(255,255,255);color:rgb(58,58,58);">湖北人杰特种汽车科技有限公司（以下简称“人杰特种汽车”），成立于2010年,坐落于中国商用车之都——东风商用车生产基地湖北省十堰市，成立10年来始终根据《中华人民共和国行政许可法》和《国务院对确需保留的行政审批项目设定行政许可的决定》的规定，遵循予以许可的汽车、摩托车、三轮汽车生产企业及产品（第309批）的公告，致力于随车起重机、汽车起重机、特种作业车以及各类特种专用车的研发、制造及营销服务。其中随车起重机实现年产销量持续高速增长，自2013年起产销量连续七年稳居全国前三，实现年销售额2亿余元。经过多年科技创新与技术沉淀，现已成为中国最具规模和市场影响力的专用车生产企业，是中国随车起重行业的领跑者。</span></p><p><span style="background-color:rgb(255,255,255);color:rgb(58,58,58);">人杰特种汽车不断突破与自我完善，形成了一整套与世界接轨的管理运作模式。先进精准的制造、检测设备配合一流生产工艺，确保公司核心技术优势得以顺利转化。高效运行的“ISO9001-2000质量认证体系”、“环境/职业健康安全管理认证体系”和“3C认证”等制度体系，保证了公司始终处于稳步、健康、可持续发展。</span></p><p><span style="background-color:rgb(255,255,255);color:rgb(58,58,58);">公司运用自主品牌、资金、渠道等资源优势，建立了覆盖全国的营销体系和服务网络，可以及时高效地为全国用户提供全生命周期服务。在深耕国内市场的同时，人杰特种汽车放眼全球，积极拓展国际市场，将公司产品远销至10多个国家和地区。</span></p><p><span style="background-color:rgb(255,255,255);color:rgb(58,58,58);">展望未来，人杰特种汽车将持续秉承“专业、信赖、科技”的经营理念和“严格、踏实、上进、创新”的企业精神，以“制造满足顾客需要，为用户创造更高附加值的产品”为目标，不断推陈出新，用人品打造精品，用精品服务社会，努力成为中国最全心全意为客户创造更高附加值的产品;以雄厚的经济实力、领先的技术、科学的管理、完善的服务体系缔造中国专用车更高品质。</span></p>	about-1-66fe0f62a9f89068537326.jpg	\N	2024-10-03 03:28:34	\N	\N	\N	0	0	\N	0	\N
4	\N	1	\N	公司荣誉1	2024-10-03 03:33:08	<p>公司荣誉1</p>	honor-1-66fe10755a945133407463.jpg	公司荣誉1	2024-10-03 03:33:09	\N	\N	\N	0	0	\N	0	\N
5	\N	1	\N	公司荣誉2	2024-10-03 03:33:43	<p>公司荣誉2</p>	honor-2-66fe10983ddd4901761159.jpg	公司荣誉2	2024-10-03 03:33:44	\N	\N	\N	0	0	\N	0	\N
11	\N	1	\N	随车起重运输车1	2024-10-04 02:49:37	\N	slider-2-66ff57c290874326662134.jpg	\N	2024-10-04 02:49:38	\N	\N	\N	0	0	\N	0	\N
15	\N	1	\N	汽车起重机2	2024-10-04 02:50:44	\N	slider-2-66ff58050ccee948835263.jpg	\N	2024-10-04 02:50:45	\N	\N	\N	0	0	\N	0	\N
16	\N	1	\N	汽车起重机3	2024-10-04 02:50:53	\N	slider-2-66ff580e29b6a692743509.jpg	\N	2024-10-04 02:50:54	\N	\N	\N	0	0	\N	0	\N
17	\N	1	\N	汽车起重机4	2024-10-04 02:52:26	\N	slider-2-66ff586aea1db841978379.jpg	\N	2024-10-04 02:52:26	\N	\N	\N	0	0	\N	0	\N
28	\N	1	\N	领导关怀1	2024-10-04 06:58:53	\N	concern-1-66ff922e20d7f206300976.jpg	\N	2024-10-04 06:58:54	\N	\N	\N	0	0	\N	0	\N
29	\N	1	\N	领导关怀2	2024-10-04 06:59:01	\N	concern-1-66ff923638d1a785277088.jpg	\N	2024-10-04 06:59:02	\N	\N	\N	0	0	\N	0	\N
18	\N	1	\N	新闻资讯1	2024-10-04 03:05:55	\N	slider-3-2-66ff7320b0436778633242.jpg	新闻资讯1	2024-10-04 04:46:24	\N	\N	\N	0	0	\N	0	\N
21	\N	1	\N	新闻资讯4	2024-10-04 04:45:24	\N	slider-3-1-66ff72e55cdba636889373.jpg	新闻资讯4	2024-10-04 04:45:25	\N	\N	\N	0	0	\N	0	\N
20	\N	1	\N	新闻资讯3	2024-10-04 03:06:58	\N	slider-3-3-66ff5bd2f123a038329562.jpg	新闻资讯3	2024-10-04 03:06:58	\N	\N	\N	0	0	\N	0	\N
19	\N	1	\N	新闻资讯2	2024-10-04 03:06:48	\N	slider-3-2-66ff5bc97ed11079260421.jpg	新闻资讯2	2024-10-04 03:06:49	\N	\N	\N	0	0	\N	0	\N
22	\N	1	\N	员工风采1	2024-10-04 06:57:09	\N	staff-1-66ff91c62ef3e538211968.jpg	\N	2024-10-04 06:57:10	\N	\N	\N	0	0	\N	0	\N
23	\N	1	\N	员工风采2	2024-10-04 06:57:30	\N	staff-2-66ff91db8e7d7463412672.jpg	\N	2024-10-04 06:57:31	\N	\N	\N	0	0	\N	0	\N
24	\N	1	\N	员工风采3	2024-10-04 06:57:44	\N	staff-3-66ff91e894066816179626.jpg	\N	2024-10-04 06:57:44	\N	\N	\N	0	0	\N	0	\N
25	\N	1	\N	员工风采4	2024-10-04 06:57:56	\N	staff-4-66ff91f51307e572443325.jpg	\N	2024-10-04 06:57:57	\N	\N	\N	0	0	\N	0	\N
26	\N	1	\N	员工风采5	2024-10-04 06:58:09	\N	staff-5-66ff9201c3b32314534441.jpg	\N	2024-10-04 06:58:09	\N	\N	\N	0	0	\N	0	\N
27	\N	1	\N	员工风采6	2024-10-04 06:58:19	\N	staff-6-66ff920c499d2636344306.jpg	\N	2024-10-04 06:58:20	\N	\N	\N	0	0	\N	0	\N
30	\N	1	\N	领导关怀3	2024-10-04 06:59:09	\N	concern-1-66ff923de88ee753371811.jpg	\N	2024-10-04 06:59:09	\N	\N	\N	0	0	\N	0	\N
1	\N	1	\N	n1	2024-09-25 12:32:50	<figure class="image"><img style="aspect-ratio:600/388;" src="/images/66f8a8e8c47c9-p-5.jpg" width="600" height="388"></figure><p><span style="background-color:rgb(255,255,255);color:rgb(102,102,102);">东风牌DFH5310JSQAX1V随车起重运输车又称随车吊，是在东风商用车生产的天龙8×7随车吊专用底盘基础上加装重汽希尔博牌ST300型随车起重机，由全液压泵系统，实现快速升降，回转、吊运物体的一款高效卓越的专用车。广泛适用于城镇市政管理、供水、供电等检修、维护作业，还适用于汽车行业4S店的维修检修作业，码头港口集装箱的装卸，具有高效、快捷、安全、方便的特点。</span></p><figure class="image"><img style="aspect-ratio:600/386;" src="/images/66f8a8f668b27-p-6.jpg" width="600" height="386"></figure><p><span style="background-color:rgb(255,255,255);color:rgb(102,102,102);">东风牌DFH5310JSQAX1V随车起重运输车又称随车吊，是在东风商用车生产的天龙8×7随车吊专用底盘基础上加装重汽希尔博牌ST300型随车起重机，由全液压泵系统，实现快速升降，回转、吊运物体的一款高效卓越的专用车。广泛适用于城镇市政管理、供水、供电等检修、维护作业，还适用于汽车行业4S店的维修检修作业，码头港口集装箱的装卸，具有高效、快捷、安全、方便的特点。</span></p><figure class="image"><img style="aspect-ratio:600/408;" src="/images/66f8a8ff56186-p-7.jpg" width="600" height="408"></figure><p><span style="background-color:rgb(255,255,255);color:rgb(102,102,102);">东风牌DFH5310JSQAX1V随车起重运输车又称随车吊，是在东风商用车生产的天龙8×7随车吊专用底盘基础上加装重汽希尔博牌ST300型随车起重机，由全液压泵系统，实现快速升降，回转、吊运物体的一款高效卓越的专用车。广泛适用于城镇市政管理、供水、供电等检修、维护作业，还适用于汽车行业4S店的维修检修作业，码头港口集装箱的装卸，具有高效、快捷、安全、方便的特点。</span></p>	\N	东风牌DFH5310JSQAX1V随车起重运输车又称随车吊，是在东风商用车生产的天龙8×7随车吊专用底盘基础上加装重汽希尔博牌ST300型随车起重机，由全液压泵系统，实现快速升降，回转、吊运物体的一款高效卓越的专用车。广泛适用于城镇市政管理、供水、供电等检修、维护作业，还适用于汽车行业4S店的维修检修作业，码头港口集装箱的装卸，具有高效、快捷、安全、方便的特点。	2024-09-25 12:32:50	\N	\N	\N	0	0	\N	0	\N
33	\N	1	\N	领导关怀6	2024-10-04 06:59:52	\N	concern-4-66ff926930db7790162832.jpg	\N	2024-10-04 06:59:53	\N	\N	\N	0	0	\N	0	\N
34	\N	1	\N	领导关怀7	2024-10-04 07:00:08	\N	concern-5-66ff92789316c946314544.jpg	\N	2024-10-04 07:00:08	\N	\N	\N	0	0	\N	0	\N
35	\N	1	\N	公司荣誉4	2024-10-04 07:05:54	\N	honor-4-66ff93d393c19974553683.jpg	\N	2024-10-04 07:05:55	\N	\N	\N	0	0	\N	0	\N
36	\N	1	\N	领导关怀-轮播图1	2024-10-04 07:12:03	\N	concern-1-66ff9543cd860412489026.jpg	\N	2024-10-04 07:12:03	\N	\N	\N	0	0	\N	0	\N
37	\N	1	\N	领导关怀-轮播图2	2024-10-04 07:12:16	\N	concern-1-66ff9550df5c8923316928.jpg	\N	2024-10-04 07:12:16	\N	\N	\N	0	0	\N	0	\N
38	\N	1	\N	领导关怀-轮播图3	2024-10-04 07:12:26	\N	concern-1-66ff955b4c655619025533.jpg	\N	2024-10-04 07:12:27	\N	\N	\N	0	0	\N	0	\N
39	\N	1	\N	新品上市1	2024-10-04 07:38:44	<p>新品上市1</p>	honor-3-66ff9b856f908086578656.jpg	\N	2024-10-04 07:38:45	\N	\N	\N	0	0	\N	0	\N
\.


--
-- Data for Name: node_region; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.node_region (node_id, region_id) FROM stdin;
1	1
2	7
3	13
4	8
5	8
6	8
7	1
8	1
9	1
11	3
12	3
13	3
14	4
15	4
16	4
17	4
18	12
19	12
20	12
21	12
22	9
23	9
24	9
25	9
26	9
27	9
28	10
29	10
30	10
31	10
32	10
33	10
34	10
35	8
36	15
37	15
38	15
39	14
40	16
41	17
42	18
43	19
44	12
45	12
46	11
47	11
48	11
49	11
50	11
51	11
52	11
53	11
54	11
55	11
56	11
57	11
58	11
59	11
60	11
61	11
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
3	关于我们	about
4	售后服务	services
5	产品专题	topics
6	产品中心	products
7	新闻资讯	news
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
2	\N	页脚	footer	1	\N	\N	\N
12	7	新闻资讯	news	5	\N	body,image,summary,tags,createdAt	\N
11	6	产品中心	products	15	\N	body,image,summary,tags,specs,images,category,phone,address,createdAt	\N
1	1	轮播图-1	slide_1	3	\N	body,image,summary,regions,tags,createdAt,images	\N
19	5	定制活动	topic_customize	1	\N	createdAt,body,image,summary,tags	\N
18	5	联名活动	topic_co	1	\N	createdAt,body,image,summary,tags	\N
17	5	促销活动	topic_promote	1	\N	createdAt,body,image,summary,tags	\N
16	5	直销活动	topic_direct	1	\N	createdAt,body,image,summary,tags	\N
15	3	领导关怀-轮播图	concern_slide	5	\N	createdAt,body,image,summary,tags	\N
14	5	新品上市	topic_new	5	\N	createdAt,body,image,summary,tags	\N
13	3	公司荣誉-标题	honor_title	1	\N	createdAt,body,image,summary,tags	\N
10	3	领导关怀	concern	4	\N	createdAt,body,image,summary,tags	\N
9	3	员工风采	staff	6	\N	createdAt,body,image,summary,tags	\N
8	3	公司荣誉	honor	4	\N	createdAt,body,image,summary,tags	\N
6	\N	轮播图-3	slide_3	5	\N	createdAt,body,image,summary,tags	\N
5	\N	轮播图-2-3	slide_2_3	5	\N	createdAt,image,body,summary,tags,specs,images,category	\N
4	1	轮播图-汽车起重机	slide_2_2	5	\N	createdAt,body,image,summary,tags,specs,images,category	\N
3	1	轮播图-起重运输车	slide_2_1	5	\N	createdAt,body,image,summary,tags,specs,images,category	\N
7	3	公司介绍	intro	1	\N	body,image,summary,tags,createdAt	\N
\.


--
-- Data for Name: spec; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.spec (id, node_id, name, value) FROM stdin;
14	1	车辆类别	随车起重运输车
15	1	整车型号	XCL5180JSQ
16	1	XCL5180JSQ	EQ1180GFVJ
17	1	颜色（底盘+吊机）	杰狮红/黄杰狮红/红珠光钼红/黄珠光钼红/红工程黄/黄
18	1	发动机型号	YC6A240-50/YC6A270-50/WP7.245E51/WP7.270E51/ISD245 50
19	1	轴距	2100+3800+1350/2140+4060+1350/2100+4500+1350/2140+3800+1350/2140+4500+1350
20	1	选装吊机	徐工14、12、16吨/古河14、12、16吨
21	1	排放	排放
22	1	外廓尺寸(mm)	\N
13	1	参考价格	40,000,00
24	1	最大扭矩/转速（N·m/（r/min））	\N
23	1	额定功率/转速（kW/（r/min））	\N
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
2	admin	["ROLE_ADMIN"]	$2y$13$lA1mUOaYcrjxs.ENWphige833NEIA0Kx37TIH4YXKzWBfCVHe6ic.	\N	\N	admin	\N	\N
\.


--
-- Data for Name: user_node; Type: TABLE DATA; Schema: public; Owner: rj
--

COPY public.user_node (user_id, node_id) FROM stdin;
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- Name: conf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.conf_id_seq', 4, true);


--
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.feedback_id_seq', 19, true);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.image_id_seq', 11, true);


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

SELECT pg_catalog.setval('public.node_id_seq', 61, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- Name: page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.page_id_seq', 7, true);


--
-- Name: refund_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.refund_id_seq', 1, false);


--
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.region_id_seq', 19, true);


--
-- Name: spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.spec_id_seq', 24, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


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

