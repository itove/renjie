--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-3+b1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-3+b1)

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


ALTER SEQUENCE public.category_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.conf_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.feedback_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.image_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.language_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.link_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.menu_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.messenger_messages_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.node_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.order_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.page_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.refund_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.region_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.spec_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.tag_id_seq OWNER TO rj;

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


ALTER SEQUENCE public.user_id_seq OWNER TO rj;

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
4	清障车	qingzhangche
5	高空作业车	gaokongzuoye
6	电源车	dianyuanche
7	救险车	jiuxianche
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
20	\N	\N	\N	\N	89168787452	\N	<strong><a href="https://pr-site.com">primer-8</a></strong>	\N	\N	\N	\N	\N	<strong><a href="https://pr-site.com">primer-1</a></strong>	0
21	\N	\N	\N	\N	86159189859	\N	Salut, ech wollt Äre Präis wëssen.	\N	\N	\N	\N	\N	DavidFax	0
22	\N	\N	\N	\N	89989694166	\N	Hi, I wanted to know your price.	\N	\N	\N	\N	\N	TedFax	0
23	\N	\N	\N	\N	85425873478	\N	Γεια σου, ήθελα να μάθω την τιμή σας.	\N	\N	\N	\N	\N	MasonFax	0
24	\N	\N	\N	\N	81626874954	\N	Thank you for registering - it was incredible and pleasant all the best http://renjieteqi.com ladonna  cucumber	\N	\N	\N	\N	\N	ladonna436669	0
26	\N	\N	\N	\N	85116994124	\N	Salut, ech wollt Äre Präis wëssen.	\N	\N	\N	\N	\N	RobertFax	0
27	\N	\N	\N	\N	84168133293	\N	Ողջույն, ես ուզում էի իմանալ ձեր գինը.	\N	\N	\N	\N	\N	TedFax	0
28	\N	\N	\N	\N	87735559658	\N	Ndewo, achọrọ m ịmara ọnụahịa gị.	\N	\N	\N	\N	\N	MasonFax	0
29	\N	\N	\N	\N	87572369662	\N	Hi, roeddwn i eisiau gwybod eich pris.	\N	\N	\N	\N	\N	RobertFax	0
30	\N	\N	\N	\N	81463195125	\N	Sawubona, bengifuna ukwazi intengo yakho.	\N	\N	\N	\N	\N	MasonFax	0
31	\N	\N	\N	\N	13085263132	\N	牵引车	\N	\N	\N	\N	\N	13085263132	0
33	\N	\N	\N	\N	81324158246	\N	Dia duit, theastaigh uaim do phraghas a fháil.	\N	\N	\N	\N	\N	DavidFax	0
34	\N	\N	\N	\N	81875818755	\N	Hi, I wanted to know your price.	\N	\N	\N	\N	\N	TedFax	0
35	\N	\N	\N	\N	89822573684	\N	Hai, saya ingin tahu harga Anda.	\N	\N	\N	\N	\N	RobertFax	0
36	\N	\N	\N	\N	84744811549	\N	Ողջույն, ես ուզում էի իմանալ ձեր գինը.	\N	\N	\N	\N	\N	MasonFax	0
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
12	72	http://source.cn-truck.com/ggimg/clcp/386/a91101740.jpg	\N
13	72	http://source.cn-truck.com/ggimg/clcp/386/a9110174_1.jpg	\N
14	72	http://source.cn-truck.com/ggimg/clcp/386/a9110174_2.jpg	\N
15	72	http://source.cn-truck.com/ggimg/clcp/386/a9110174_3.jpg	\N
16	72	http://source.cn-truck.com/ggimg/clcp/386/a91101744.jpg	\N
17	72	http://source.cn-truck.com/ggimg/clcp/386/a91101745.jpg	\N
18	73	http://source.cn-truck.com/ggimg/clcp/386/a91105030.jpg	\N
19	73	http://source.cn-truck.com/ggimg/clcp/386/a9110503_1.jpg	\N
20	73	http://source.cn-truck.com/ggimg/clcp/386/a9110503_2.jpg	\N
21	73	http://source.cn-truck.com/ggimg/clcp/386/a9110503_3.jpg	\N
22	73	http://source.cn-truck.com/ggimg/clcp/386/a91105034.jpg	\N
23	73	http://source.cn-truck.com/ggimg/clcp/386/a91105035.jpg	\N
24	74	http://source.cn-truck.com/ggimg/clcp/386/a91105310.jpg	\N
25	74	http://source.cn-truck.com/ggimg/clcp/386/a9110531_1.jpg	\N
26	74	http://source.cn-truck.com/ggimg/clcp/386/a9110531_2.jpg	\N
27	74	http://source.cn-truck.com/ggimg/clcp/386/a9110531_3.jpg	\N
28	74	http://source.cn-truck.com/ggimg/clcp/386/a91105314.jpg	\N
29	74	http://source.cn-truck.com/ggimg/clcp/386/a91105315.jpg	\N
30	75	http://source.cn-truck.com/ggimg/clcp/386/a96101780.jpg	\N
31	75	http://source.cn-truck.com/ggimg/clcp/386/a9610178_1.jpg	\N
32	75	http://source.cn-truck.com/ggimg/clcp/386/a9610178_2.jpg	\N
33	75	http://source.cn-truck.com/ggimg/clcp/386/a9610178_3.jpg	\N
34	75	http://source.cn-truck.com/ggimg/clcp/386/a96101784.jpg	\N
35	75	http://source.cn-truck.com/ggimg/clcp/386/a96101785.jpg	\N
36	76	http://source.cn-truck.com/ggimg/clcp/386/a9d177250.jpg	\N
37	76	http://source.cn-truck.com/ggimg/clcp/386/a9d177251.jpg	\N
38	76	http://source.cn-truck.com/ggimg/clcp/386/a9d17725_2.jpg	\N
39	76	http://source.cn-truck.com/ggimg/clcp/386/a9d17725_3.jpg	\N
40	76	http://source.cn-truck.com/ggimg/clcp/386/a9d177254.jpg	\N
41	76	http://source.cn-truck.com/ggimg/clcp/386/a9d177255.jpg	\N
42	77	http://source.cn-truck.com/ggimg/clcp/386/a9c165680.jpg	\N
43	77	http://source.cn-truck.com/ggimg/clcp/386/a9c165681.jpg	\N
44	77	http://source.cn-truck.com/ggimg/clcp/386/a9c16568_2.jpg	\N
45	77	http://source.cn-truck.com/ggimg/clcp/386/a9c16568_3.jpg	\N
46	77	http://source.cn-truck.com/ggimg/clcp/386/a9c165684.jpg	\N
47	77	http://source.cn-truck.com/ggimg/clcp/386/a9c165685.jpg	\N
48	78	http://source.cn-truck.com/ggimg/clcp/386/a9f224230.jpg	\N
49	78	http://source.cn-truck.com/ggimg/clcp/386/a9f22423_1.jpg	\N
50	78	http://source.cn-truck.com/ggimg/clcp/386/a9f22423_2.jpg	\N
51	78	http://source.cn-truck.com/ggimg/clcp/386/a9f22423_3.jpg	\N
52	78	http://source.cn-truck.com/ggimg/clcp/386/a9f224234.jpg	\N
53	78	http://source.cn-truck.com/ggimg/clcp/386/a9f224235.jpg	\N
54	79	http://source.cn-truck.com/ggimg/clcp/386/a9d188250.jpg	\N
55	79	http://source.cn-truck.com/ggimg/clcp/386/a9d18825_1.jpg	\N
56	79	http://source.cn-truck.com/ggimg/clcp/386/a9d18825_2.jpg	\N
57	79	http://source.cn-truck.com/ggimg/clcp/386/a9d18825_3.jpg	\N
58	79	http://source.cn-truck.com/ggimg/clcp/386/a9d188254.jpg	\N
59	79	http://source.cn-truck.com/ggimg/clcp/386/a9d188255.jpg	\N
60	80	http://source.cn-truck.com/ggimg/clcp/386/aa3281880.jpg	\N
61	80	http://source.cn-truck.com/ggimg/clcp/386/aa328188_1.jpg	\N
62	80	http://source.cn-truck.com/ggimg/clcp/386/aa328188_2.jpg	\N
63	80	http://source.cn-truck.com/ggimg/clcp/386/aa328188_3.jpg	\N
64	80	http://source.cn-truck.com/ggimg/clcp/386/aa3281884.jpg	\N
65	80	http://source.cn-truck.com/ggimg/clcp/386/aa3281885.jpg	\N
66	81	http://source.cn-truck.com/ggimg/clcp/386/aa2277640.jpg	\N
67	81	http://source.cn-truck.com/ggimg/clcp/386/aa227764_1.jpg	\N
68	81	http://source.cn-truck.com/ggimg/clcp/386/aa227764_2.jpg	\N
69	81	http://source.cn-truck.com/ggimg/clcp/386/aa227764_3.jpg	\N
70	81	http://source.cn-truck.com/ggimg/clcp/386/aa2277644.jpg	\N
71	81	http://source.cn-truck.com/ggimg/clcp/386/aa2277645.jpg	\N
72	82	http://source.cn-truck.com/ggimg/clcp/386/aa1255360.jpg	\N
73	82	http://source.cn-truck.com/ggimg/clcp/386/aa125536_1.jpg	\N
74	82	http://source.cn-truck.com/ggimg/clcp/386/aa125536_2.jpg	\N
75	82	http://source.cn-truck.com/ggimg/clcp/386/aa125536_3.jpg	\N
76	82	http://source.cn-truck.com/ggimg/clcp/386/aa1255364.jpg	\N
77	82	http://source.cn-truck.com/ggimg/clcp/386/aa1255365.jpg	\N
78	83	http://source.cn-truck.com/ggimg/clcp/386/aa3292060.jpg	\N
79	83	http://source.cn-truck.com/ggimg/clcp/386/aa329206_1.jpg	\N
80	83	http://source.cn-truck.com/ggimg/clcp/386/aa329206_2.jpg	\N
81	83	http://source.cn-truck.com/ggimg/clcp/386/aa329206_3.jpg	\N
82	83	http://source.cn-truck.com/ggimg/clcp/386/aa3292064.jpg	\N
83	83	http://source.cn-truck.com/ggimg/clcp/386/aa3292065.jpg	\N
84	84	http://source.cn-truck.com/ggimg/clcp/386/aa3292690.jpg	\N
85	84	http://source.cn-truck.com/ggimg/clcp/386/aa329269_1.jpg	\N
86	84	http://source.cn-truck.com/ggimg/clcp/386/aa329269_2.jpg	\N
87	84	http://source.cn-truck.com/ggimg/clcp/386/aa329269_3.jpg	\N
88	84	http://source.cn-truck.com/ggimg/clcp/386/aa3292694.jpg	\N
89	84	http://source.cn-truck.com/ggimg/clcp/386/aa3292695.jpg	\N
90	85	http://source.cn-truck.com/ggimg/clcp/386/aa4309200.jpg	\N
91	85	http://source.cn-truck.com/ggimg/clcp/386/aa430920_1.jpg	\N
92	85	http://source.cn-truck.com/ggimg/clcp/386/aa430920_2.jpg	\N
93	85	http://source.cn-truck.com/ggimg/clcp/386/aa430920_3.jpg	\N
94	85	http://source.cn-truck.com/ggimg/clcp/386/aa4309204.jpg	\N
95	85	http://source.cn-truck.com/ggimg/clcp/386/aa4309205.jpg	\N
96	86	http://source.cn-truck.com/ggimg/clcp/386/w21491020.jpg	\N
97	86	http://source.cn-truck.com/ggimg/clcp/386/w21491021.jpg	\N
98	86	http://source.cn-truck.com/ggimg/clcp/386/w21491022.jpg	\N
99	86	http://source.cn-truck.com/ggimg/clcp/386/w21491023.jpg	\N
100	86	http://source.cn-truck.com/ggimg/clcp/386/w21491024.jpg	\N
101	86	http://source.cn-truck.com/ggimg/clcp/386/w21491025.jpg	\N
102	87	http://source.cn-truck.com/ggimg/clcp/386/w61559760.jpg	\N
103	87	http://source.cn-truck.com/ggimg/clcp/386/w61559761.jpg	\N
104	87	http://source.cn-truck.com/ggimg/clcp/386/w61559762.jpg	\N
105	87	http://source.cn-truck.com/ggimg/clcp/386/w61559763.jpg	\N
106	87	http://source.cn-truck.com/ggimg/clcp/386/w61559764.jpg	\N
107	87	http://source.cn-truck.com/ggimg/clcp/386/w61559765.jpg	\N
108	88	http://source.cn-truck.com/ggimg/clcp/386/x61678420.jpg	\N
109	88	http://source.cn-truck.com/ggimg/clcp/386/x6167842_1.jpg	\N
110	88	http://source.cn-truck.com/ggimg/clcp/386/x6167842_2.jpg	\N
111	88	http://source.cn-truck.com/ggimg/clcp/386/x6167842_3.jpg	\N
112	88	http://source.cn-truck.com/ggimg/clcp/386/x61678424.jpg	\N
113	88	http://source.cn-truck.com/ggimg/clcp/386/x61678425.jpg	\N
114	89	http://source.cn-truck.com/ggimg/clcp/386/w31478030.jpg	\N
115	89	http://source.cn-truck.com/ggimg/clcp/386/w31478031.jpg	\N
116	89	http://source.cn-truck.com/ggimg/clcp/386/w31478032.jpg	\N
117	89	http://source.cn-truck.com/ggimg/clcp/386/w3147803_3.jpg	\N
118	89	http://source.cn-truck.com/ggimg/clcp/386/w31478034.jpg	\N
119	89	http://source.cn-truck.com/ggimg/clcp/386/w31478035.jpg	\N
120	90	http://source.cn-truck.com/ggimg/clcp/386/z11364030.jpg	\N
121	90	http://source.cn-truck.com/ggimg/clcp/386/z1136403_1.jpg	\N
122	90	http://source.cn-truck.com/ggimg/clcp/386/z1136403_2.jpg	\N
123	90	http://source.cn-truck.com/ggimg/clcp/386/z1136403_3.jpg	\N
124	90	http://source.cn-truck.com/ggimg/clcp/386/z11364034.jpg	\N
125	90	http://source.cn-truck.com/ggimg/clcp/386/z11364035.jpg	\N
126	91	http://source.cn-truck.com/ggimg/clcp/386/z01324480.jpg	\N
127	91	http://source.cn-truck.com/ggimg/clcp/386/z01324481.jpg	\N
128	91	http://source.cn-truck.com/ggimg/clcp/386/z0132448_2.jpg	\N
129	91	http://source.cn-truck.com/ggimg/clcp/386/z0132448_3.jpg	\N
130	91	http://source.cn-truck.com/ggimg/clcp/386/z01324484.jpg	\N
131	91	http://source.cn-truck.com/ggimg/clcp/386/z01324485.jpg	\N
132	92	http://source.cn-truck.com/ggimg/clcp/386/z01313020.jpg	\N
133	92	http://source.cn-truck.com/ggimg/clcp/386/z01313021.jpg	\N
134	92	http://source.cn-truck.com/ggimg/clcp/386/z0131302_2.jpg	\N
135	92	http://source.cn-truck.com/ggimg/clcp/386/z0131302_3.jpg	\N
136	92	http://source.cn-truck.com/ggimg/clcp/386/z01313024.jpg	\N
137	92	http://source.cn-truck.com/ggimg/clcp/386/z01313025.jpg	\N
138	93	http://source.cn-truck.com/ggimg/clcp/386/y91305130.jpg	\N
139	93	http://source.cn-truck.com/ggimg/clcp/386/y91305131.jpg	\N
140	93	http://source.cn-truck.com/ggimg/clcp/386/y9130513_2.jpg	\N
141	93	http://source.cn-truck.com/ggimg/clcp/386/y9130513_3.jpg	\N
142	93	http://source.cn-truck.com/ggimg/clcp/386/y91305134.jpg	\N
143	93	http://source.cn-truck.com/ggimg/clcp/386/y91305135.jpg	\N
144	94	http://source.cn-truck.com/ggimg/clcp/386/y91285060.jpg	\N
145	94	http://source.cn-truck.com/ggimg/clcp/386/y91285061.jpg	\N
146	94	http://source.cn-truck.com/ggimg/clcp/386/y9128506_2.jpg	\N
147	94	http://source.cn-truck.com/ggimg/clcp/386/y9128506_3.jpg	\N
148	94	http://source.cn-truck.com/ggimg/clcp/386/y91285064.jpg	\N
149	94	http://source.cn-truck.com/ggimg/clcp/386/y91285065.jpg	\N
150	95	http://source.cn-truck.com/ggimg/clcp/386/x91029130.jpg	\N
151	95	http://source.cn-truck.com/ggimg/clcp/386/x9102913_1.jpg	\N
152	95	http://source.cn-truck.com/ggimg/clcp/386/x9102913_2.jpg	\N
153	95	http://source.cn-truck.com/ggimg/clcp/386/x9102913_3.jpg	\N
154	95	http://source.cn-truck.com/ggimg/clcp/386/x91029134.jpg	\N
155	95	http://source.cn-truck.com/ggimg/clcp/386/x91029135.jpg	\N
156	96	http://source.cn-truck.com/ggimg/clcp/386/y31128220.jpg	\N
157	96	http://source.cn-truck.com/ggimg/clcp/386/y31128221.jpg	\N
158	96	http://source.cn-truck.com/ggimg/clcp/386/y3112822_2.jpg	\N
159	96	http://source.cn-truck.com/ggimg/clcp/386/y3112822_3.jpg	\N
160	96	http://source.cn-truck.com/ggimg/clcp/386/y31128224.jpg	\N
161	96	http://source.cn-truck.com/ggimg/clcp/386/y31128225.jpg	\N
162	97	http://source.cn-truck.com/ggimg/clcp/386/z51514950.jpg	\N
163	97	http://source.cn-truck.com/ggimg/clcp/386/z51514951.jpg	\N
164	97	http://source.cn-truck.com/ggimg/clcp/386/z51514952.jpg	\N
165	97	http://source.cn-truck.com/ggimg/clcp/386/z5151495_3.jpg	\N
166	97	http://source.cn-truck.com/ggimg/clcp/386/z51514954.jpg	\N
167	97	http://source.cn-truck.com/ggimg/clcp/386/z51514955.jpg	\N
168	98	http://source.cn-truck.com/ggimg/clcp/386/z51497590.jpg	\N
169	98	http://source.cn-truck.com/ggimg/clcp/386/z51497591.jpg	\N
170	98	http://source.cn-truck.com/ggimg/clcp/386/z51497592.jpg	\N
171	98	http://source.cn-truck.com/ggimg/clcp/386/z5149759_3.jpg	\N
172	98	http://source.cn-truck.com/ggimg/clcp/386/z51497594.jpg	\N
173	98	http://source.cn-truck.com/ggimg/clcp/386/z51497595.jpg	\N
174	99	http://source.cn-truck.com/ggimg/clcp/386/z31452990.jpg	\N
175	99	http://source.cn-truck.com/ggimg/clcp/386/z31452991.jpg	\N
176	99	http://source.cn-truck.com/ggimg/clcp/386/z3145299_2.jpg	\N
177	99	http://source.cn-truck.com/ggimg/clcp/386/z3145299_3.jpg	\N
178	99	http://source.cn-truck.com/ggimg/clcp/386/z31452994.jpg	\N
179	99	http://source.cn-truck.com/ggimg/clcp/386/z31452995.jpg	\N
180	100	http://source.cn-truck.com/ggimg/clcp/386/z81604250.jpg	\N
181	100	http://source.cn-truck.com/ggimg/clcp/386/z8160425_1.jpg	\N
182	100	http://source.cn-truck.com/ggimg/clcp/386/z8160425_2.jpg	\N
183	100	http://source.cn-truck.com/ggimg/clcp/386/z8160425_3.jpg	\N
184	100	http://source.cn-truck.com/ggimg/clcp/386/z81604254.jpg	\N
185	100	http://source.cn-truck.com/ggimg/clcp/386/z81604255.jpg	\N
186	101	http://source.cn-truck.com/ggimg/clcp/386/z71589470.jpg	\N
187	101	http://source.cn-truck.com/ggimg/clcp/386/z71589471.jpg	\N
188	101	http://source.cn-truck.com/ggimg/clcp/386/z71589472.jpg	\N
189	101	http://source.cn-truck.com/ggimg/clcp/386/z71589473.jpg	\N
190	101	http://source.cn-truck.com/ggimg/clcp/386/z71589474.jpg	\N
191	101	http://source.cn-truck.com/ggimg/clcp/386/z71589475.jpg	\N
192	102	http://source.cn-truck.com/ggimg/clcp/386/z71581480.jpg	\N
193	102	http://source.cn-truck.com/ggimg/clcp/386/z71581481.jpg	\N
194	102	http://source.cn-truck.com/ggimg/clcp/386/z71581482.jpg	\N
195	102	http://source.cn-truck.com/ggimg/clcp/386/z71581483.jpg	\N
196	102	http://source.cn-truck.com/ggimg/clcp/386/z71581484.jpg	\N
197	102	http://source.cn-truck.com/ggimg/clcp/386/z71581485.jpg	\N
198	103	http://source.cn-truck.com/ggimg/clcp/386/aaa422570.jpg	\N
199	103	http://source.cn-truck.com/ggimg/clcp/386/aaa422574.jpg	\N
200	103	http://source.cn-truck.com/ggimg/clcp/386/aaa422575.jpg	\N
201	104	http://source.cn-truck.com/ggimg/clcp/386/aaa415010.jpg	\N
202	104	http://source.cn-truck.com/ggimg/clcp/386/aaa415014.jpg	\N
203	104	http://source.cn-truck.com/ggimg/clcp/386/aaa415015.jpg	\N
204	105	http://source.cn-truck.com/ggimg/clcp/386/aaa416650.jpg	\N
205	105	http://source.cn-truck.com/ggimg/clcp/386/aaa416654.jpg	\N
206	105	http://source.cn-truck.com/ggimg/clcp/386/aaa416655.jpg	\N
207	106	http://source.cn-truck.com/ggimg/clcp/386/aaa415400.jpg	\N
208	106	http://source.cn-truck.com/ggimg/clcp/386/aaa415404.jpg	\N
209	106	http://source.cn-truck.com/ggimg/clcp/386/aaa415405.jpg	\N
210	107	http://source.cn-truck.com/ggimg/clcp/386/z21429580.jpg	\N
211	107	http://source.cn-truck.com/ggimg/clcp/386/z21429581.jpg	\N
212	107	http://source.cn-truck.com/ggimg/clcp/386/z2142958_2.jpg	\N
213	107	http://source.cn-truck.com/ggimg/clcp/386/z2142958_3.jpg	\N
214	107	http://source.cn-truck.com/ggimg/clcp/386/z21429584.jpg	\N
215	107	http://source.cn-truck.com/ggimg/clcp/386/z21429585.jpg	\N
216	108	http://source.cn-truck.com/ggimg/clcp/386/z71589370.jpg	\N
217	108	http://source.cn-truck.com/ggimg/clcp/386/z71589371.jpg	\N
218	108	http://source.cn-truck.com/ggimg/clcp/386/z71589372.jpg	\N
219	108	http://source.cn-truck.com/ggimg/clcp/386/z71589373.jpg	\N
220	108	http://source.cn-truck.com/ggimg/clcp/386/z71589374.jpg	\N
221	108	http://source.cn-truck.com/ggimg/clcp/386/z71589375.jpg	\N
222	109	http://source.cn-truck.com/ggimg/clcp/385/aa1251400.jpg	\N
223	109	http://source.cn-truck.com/ggimg/clcp/385/aa125140_1.jpg	\N
224	109	http://source.cn-truck.com/ggimg/clcp/385/aa125140_2.jpg	\N
225	109	http://source.cn-truck.com/ggimg/clcp/385/aa125140_3.jpg	\N
226	109	http://source.cn-truck.com/ggimg/clcp/385/aa1251404.jpg	\N
227	109	http://source.cn-truck.com/ggimg/clcp/385/aa1251405.jpg	\N
228	110	http://source.cn-truck.com/ggimg/clcp/385/aa1261200.jpg	\N
229	110	http://source.cn-truck.com/ggimg/clcp/385/aa126120_1.jpg	\N
230	110	http://source.cn-truck.com/ggimg/clcp/385/aa126120_2.jpg	\N
231	110	http://source.cn-truck.com/ggimg/clcp/385/aa126120_3.jpg	\N
232	110	http://source.cn-truck.com/ggimg/clcp/385/aa1261204.jpg	\N
233	110	http://source.cn-truck.com/ggimg/clcp/385/aa1261205.jpg	\N
234	111	http://source.cn-truck.com/ggimg/clcp/385/a9f227900.jpg	\N
235	111	http://source.cn-truck.com/ggimg/clcp/385/a9f22790_1.jpg	\N
236	111	http://source.cn-truck.com/ggimg/clcp/385/a9f22790_2.jpg	\N
237	111	http://source.cn-truck.com/ggimg/clcp/385/a9f22790_3.jpg	\N
238	111	http://source.cn-truck.com/ggimg/clcp/385/a9f227904.jpg	\N
239	111	http://source.cn-truck.com/ggimg/clcp/385/a9f227905.jpg	\N
240	112	http://source.cn-truck.com/ggimg/clcp/385/x91023700.jpg	\N
241	112	http://source.cn-truck.com/ggimg/clcp/385/x91023701.jpg	\N
242	112	http://source.cn-truck.com/ggimg/clcp/385/x91023702.jpg	\N
243	112	http://source.cn-truck.com/ggimg/clcp/385/x91023703.jpg	\N
244	112	http://source.cn-truck.com/ggimg/clcp/385/x91023704.jpg	\N
245	112	http://source.cn-truck.com/ggimg/clcp/385/x91023705.jpg	\N
246	113	http://source.cn-truck.com/ggimg/clcp/385/x71699700.jpg	\N
247	113	http://source.cn-truck.com/ggimg/clcp/385/x71699701.jpg	\N
248	113	http://source.cn-truck.com/ggimg/clcp/385/x71699702.jpg	\N
249	113	http://source.cn-truck.com/ggimg/clcp/385/x71699703.jpg	\N
250	113	http://source.cn-truck.com/ggimg/clcp/385/x71699704.jpg	\N
251	113	http://source.cn-truck.com/ggimg/clcp/385/x71699705.jpg	\N
252	114	http://source.cn-truck.com/ggimg/clcp/385/x71707390.jpg	\N
253	114	http://source.cn-truck.com/ggimg/clcp/385/x71707391.jpg	\N
254	114	http://source.cn-truck.com/ggimg/clcp/385/x71707392.jpg	\N
255	114	http://source.cn-truck.com/ggimg/clcp/385/x71707393.jpg	\N
256	114	http://source.cn-truck.com/ggimg/clcp/385/x71707394.jpg	\N
257	114	http://source.cn-truck.com/ggimg/clcp/385/x71707395.jpg	\N
258	115	http://source.cn-truck.com/ggimg/clcp/385/x71706720.jpg	\N
259	115	http://source.cn-truck.com/ggimg/clcp/385/x71706721.jpg	\N
260	115	http://source.cn-truck.com/ggimg/clcp/385/x71706722.jpg	\N
261	115	http://source.cn-truck.com/ggimg/clcp/385/x71706723.jpg	\N
262	115	http://source.cn-truck.com/ggimg/clcp/385/x71706724.jpg	\N
263	115	http://source.cn-truck.com/ggimg/clcp/385/x71706725.jpg	\N
264	116	http://source.cn-truck.com/ggimg/clcp/385/x91025500.jpg	\N
265	116	http://source.cn-truck.com/ggimg/clcp/385/x9102550_1.jpg	\N
266	116	http://source.cn-truck.com/ggimg/clcp/385/x9102550_2.jpg	\N
267	116	http://source.cn-truck.com/ggimg/clcp/385/x9102550_3.jpg	\N
268	116	http://source.cn-truck.com/ggimg/clcp/385/x91025504.jpg	\N
269	116	http://source.cn-truck.com/ggimg/clcp/385/x91025505.jpg	\N
270	117	http://source.cn-truck.com/ggimg/clcp/385/x91028610.jpg	\N
271	117	http://source.cn-truck.com/ggimg/clcp/385/x91028611.jpg	\N
272	117	http://source.cn-truck.com/ggimg/clcp/385/x91028612.jpg	\N
273	117	http://source.cn-truck.com/ggimg/clcp/385/x91028613.jpg	\N
274	117	http://source.cn-truck.com/ggimg/clcp/385/x91028614.jpg	\N
275	117	http://source.cn-truck.com/ggimg/clcp/385/x91028615.jpg	\N
276	118	http://source.cn-truck.com/ggimg/clcp/385/x91036230.jpg	\N
277	118	http://source.cn-truck.com/ggimg/clcp/385/x91036231.jpg	\N
278	118	http://source.cn-truck.com/ggimg/clcp/385/x91036232.jpg	\N
279	118	http://source.cn-truck.com/ggimg/clcp/385/x91036233.jpg	\N
280	118	http://source.cn-truck.com/ggimg/clcp/385/x91036234.jpg	\N
281	118	http://source.cn-truck.com/ggimg/clcp/385/x91036235.jpg	\N
282	119	http://source.cn-truck.com/ggimg/clcp/385/x51639870.jpg	\N
283	119	http://source.cn-truck.com/ggimg/clcp/385/x51639871.jpg	\N
284	119	http://source.cn-truck.com/ggimg/clcp/385/x51639872.jpg	\N
285	119	http://source.cn-truck.com/ggimg/clcp/385/x51639873.jpg	\N
286	119	http://source.cn-truck.com/ggimg/clcp/385/x51639874.jpg	\N
287	119	http://source.cn-truck.com/ggimg/clcp/385/x51639875.jpg	\N
288	120	http://source.cn-truck.com/ggimg/clcp/385/x51657850.jpg	\N
289	120	http://source.cn-truck.com/ggimg/clcp/385/x51657851.jpg	\N
290	120	http://source.cn-truck.com/ggimg/clcp/385/x51657852.jpg	\N
291	120	http://source.cn-truck.com/ggimg/clcp/385/x51657853.jpg	\N
292	120	http://source.cn-truck.com/ggimg/clcp/385/x51657854.jpg	\N
293	120	http://source.cn-truck.com/ggimg/clcp/385/x51657855.jpg	\N
294	121	http://source.cn-truck.com/ggimg/clcp/385/y91303630.jpg	\N
295	121	http://source.cn-truck.com/ggimg/clcp/385/y9130363_1.jpg	\N
296	121	http://source.cn-truck.com/ggimg/clcp/385/y9130363_2.jpg	\N
297	121	http://source.cn-truck.com/ggimg/clcp/385/y9130363_3.jpg	\N
298	121	http://source.cn-truck.com/ggimg/clcp/385/y91303634.jpg	\N
299	121	http://source.cn-truck.com/ggimg/clcp/385/y91303635.jpg	\N
300	122	http://source.cn-truck.com/ggimg/clcp/385/y21025550.jpg	\N
301	122	http://source.cn-truck.com/ggimg/clcp/385/y21025551.jpg	\N
302	122	http://source.cn-truck.com/ggimg/clcp/385/y2102555_2.jpg	\N
303	122	http://source.cn-truck.com/ggimg/clcp/385/y2102555_3.jpg	\N
304	122	http://source.cn-truck.com/ggimg/clcp/385/y21025554.jpg	\N
305	122	http://source.cn-truck.com/ggimg/clcp/385/y21025555.jpg	\N
306	123	http://source.cn-truck.com/ggimg/clcp/385/z01313360.jpg	\N
307	123	http://source.cn-truck.com/ggimg/clcp/385/z0131336_1.jpg	\N
308	123	http://source.cn-truck.com/ggimg/clcp/385/z0131336_2.jpg	\N
309	123	http://source.cn-truck.com/ggimg/clcp/385/z0131336_3.jpg	\N
310	123	http://source.cn-truck.com/ggimg/clcp/385/z01313364.jpg	\N
311	123	http://source.cn-truck.com/ggimg/clcp/385/z01313365.jpg	\N
312	124	http://source.cn-truck.com/ggimg/clcp/385/y91306070.jpg	\N
313	124	http://source.cn-truck.com/ggimg/clcp/385/y9130607_1.jpg	\N
314	124	http://source.cn-truck.com/ggimg/clcp/385/y9130607_2.jpg	\N
315	124	http://source.cn-truck.com/ggimg/clcp/385/y9130607_3.jpg	\N
316	124	http://source.cn-truck.com/ggimg/clcp/385/y91306074.jpg	\N
317	124	http://source.cn-truck.com/ggimg/clcp/385/y91306075.jpg	\N
318	125	http://source.cn-truck.com/ggimg/clcp/385/z11379230.jpg	\N
319	125	http://source.cn-truck.com/ggimg/clcp/385/z1137923_1.jpg	\N
320	125	http://source.cn-truck.com/ggimg/clcp/385/z1137923_2.jpg	\N
321	125	http://source.cn-truck.com/ggimg/clcp/385/z1137923_3.jpg	\N
322	125	http://source.cn-truck.com/ggimg/clcp/385/z11379234.jpg	\N
323	125	http://source.cn-truck.com/ggimg/clcp/385/z11379235.jpg	\N
324	126	http://source.cn-truck.com/ggimg/clcp/385/z11364630.jpg	\N
325	126	http://source.cn-truck.com/ggimg/clcp/385/z11364631.jpg	\N
326	126	http://source.cn-truck.com/ggimg/clcp/385/z1136463_2.jpg	\N
327	126	http://source.cn-truck.com/ggimg/clcp/385/z1136463_3.jpg	\N
328	126	http://source.cn-truck.com/ggimg/clcp/385/z11364634.jpg	\N
329	126	http://source.cn-truck.com/ggimg/clcp/385/z11364635.jpg	\N
330	127	http://source.cn-truck.com/ggimg/clcp/385/aa9385720.jpg	\N
331	127	http://source.cn-truck.com/ggimg/clcp/385/aa9385724.jpg	\N
332	127	http://source.cn-truck.com/ggimg/clcp/385/aa9385725.jpg	\N
333	128	http://source.cn-truck.com/ggimg/clcp/385/aa9395690.jpg	\N
334	128	http://source.cn-truck.com/ggimg/clcp/385/aa9395694.jpg	\N
335	128	http://source.cn-truck.com/ggimg/clcp/385/aa9395695.jpg	\N
336	129	http://source.cn-truck.com/ggimg/clcp/384/aa2273450.jpg	\N
337	129	http://source.cn-truck.com/ggimg/clcp/384/aa227345_1.jpg	\N
338	129	http://source.cn-truck.com/ggimg/clcp/384/aa227345_2.jpg	\N
339	129	http://source.cn-truck.com/ggimg/clcp/384/aa227345_3.jpg	\N
340	129	http://source.cn-truck.com/ggimg/clcp/384/aa2273454.jpg	\N
341	129	http://source.cn-truck.com/ggimg/clcp/384/aa2273455.jpg	\N
342	130	http://source.cn-truck.com/ggimg/clcp/383/y21045230.jpg	\N
343	130	http://source.cn-truck.com/ggimg/clcp/383/y21045231.jpg	\N
344	130	http://source.cn-truck.com/ggimg/clcp/383/y2104523_2.jpg	\N
345	130	http://source.cn-truck.com/ggimg/clcp/383/y21045234.jpg	\N
346	130	http://source.cn-truck.com/ggimg/clcp/383/y21045235.jpg	\N
347	131	http://source.cn-truck.com/ggimg/clcp/374/x41614910.jpg	\N
348	131	http://source.cn-truck.com/ggimg/clcp/374/x41614911.jpg	\N
349	131	http://source.cn-truck.com/ggimg/clcp/374/x41614912.jpg	\N
350	131	http://source.cn-truck.com/ggimg/clcp/374/x4161491_3.jpg	\N
351	131	http://source.cn-truck.com/ggimg/clcp/374/x41614914.jpg	\N
352	131	http://source.cn-truck.com/ggimg/clcp/374/x41614915.jpg	\N
353	132	http://source.cn-truck.com/ggimg/clcp/374/z11376170.jpg	\N
354	132	http://source.cn-truck.com/ggimg/clcp/374/z1137617_1.jpg	\N
355	132	http://source.cn-truck.com/ggimg/clcp/374/z1137617_2.jpg	\N
356	132	http://source.cn-truck.com/ggimg/clcp/374/z1137617_3.jpg	\N
357	132	http://source.cn-truck.com/ggimg/clcp/374/z11376174.jpg	\N
358	132	http://source.cn-truck.com/ggimg/clcp/374/z11376175.jpg	\N
359	133	http://source.cn-truck.com/ggimg/clcp/378/x71691160.jpg	\N
360	133	http://source.cn-truck.com/ggimg/clcp/378/x71691161.jpg	\N
361	133	http://source.cn-truck.com/ggimg/clcp/378/x7169116_2.jpg	\N
362	133	http://source.cn-truck.com/ggimg/clcp/378/x71691164.jpg	\N
363	133	http://source.cn-truck.com/ggimg/clcp/378/x71691165.jpg	\N
364	134	http://source.cn-truck.com/ggimg/clcp/386/aaa420380.jpg	\N
365	134	http://source.cn-truck.com/ggimg/clcp/386/aaa420384.jpg	\N
366	134	http://source.cn-truck.com/ggimg/clcp/386/aaa420385.jpg	\N
367	135	http://source.cn-truck.com/ggimg/clcp/384/aa8376110.jpg	\N
368	135	http://source.cn-truck.com/ggimg/clcp/384/aa8376114.jpg	\N
369	135	http://source.cn-truck.com/ggimg/clcp/384/aa8376115.jpg	\N
370	136	http://source.cn-truck.com/ggimg/clcp/382/a9d184480.jpg	\N
371	136	http://source.cn-truck.com/ggimg/clcp/382/a9d18448_1.jpg	\N
372	136	http://source.cn-truck.com/ggimg/clcp/382/a9d18448_2.jpg	\N
373	136	http://source.cn-truck.com/ggimg/clcp/382/a9d18448_3.jpg	\N
374	136	http://source.cn-truck.com/ggimg/clcp/382/a9d184484.jpg	\N
375	136	http://source.cn-truck.com/ggimg/clcp/382/a9d184485.jpg	\N
376	137	http://source.cn-truck.com/ggimg/clcp/377/a9c170760.jpg	\N
377	137	http://source.cn-truck.com/ggimg/clcp/377/a9c17076_1.jpg	\N
378	137	http://source.cn-truck.com/ggimg/clcp/377/a9c17076_2.jpg	\N
379	137	http://source.cn-truck.com/ggimg/clcp/377/a9c17076_3.jpg	\N
380	137	http://source.cn-truck.com/ggimg/clcp/377/a9c170764.jpg	\N
381	137	http://source.cn-truck.com/ggimg/clcp/377/a9c170765.jpg	\N
382	138	http://source.cn-truck.com/ggimg/clcp/374/a9d183760.jpg	\N
383	138	http://source.cn-truck.com/ggimg/clcp/374/a9d183764.jpg	\N
384	138	http://source.cn-truck.com/ggimg/clcp/374/a9d183765.jpg	\N
385	139	http://source.cn-truck.com/ggimg/clcp/385/aa7355210.jpg	\N
386	139	http://source.cn-truck.com/ggimg/clcp/385/aa7355211.jpg	\N
387	139	http://source.cn-truck.com/ggimg/clcp/385/aa735521_2.jpg	\N
388	139	http://source.cn-truck.com/ggimg/clcp/385/aa7355214.jpg	\N
389	139	http://source.cn-truck.com/ggimg/clcp/385/aa7355215.jpg	\N
390	140	http://source.cn-truck.com/ggimg/clcp/385/aa7358500.jpg	\N
391	140	http://source.cn-truck.com/ggimg/clcp/385/aa7358501.jpg	\N
392	140	http://source.cn-truck.com/ggimg/clcp/385/aa735850_2.jpg	\N
393	140	http://source.cn-truck.com/ggimg/clcp/385/aa735850_3.jpg	\N
394	140	http://source.cn-truck.com/ggimg/clcp/385/aa7358504.jpg	\N
395	140	http://source.cn-truck.com/ggimg/clcp/385/aa7358505.jpg	\N
396	141	http://source.cn-truck.com/ggimg/clcp/382/aa2271510.jpg	\N
397	141	http://source.cn-truck.com/ggimg/clcp/382/aa2271511.jpg	\N
398	141	http://source.cn-truck.com/ggimg/clcp/382/aa227151_2.jpg	\N
399	141	http://source.cn-truck.com/ggimg/clcp/382/aa2271513.jpg	\N
400	141	http://source.cn-truck.com/ggimg/clcp/382/aa2271514.jpg	\N
401	141	http://source.cn-truck.com/ggimg/clcp/382/aa2271515.jpg	\N
402	142	http://source.cn-truck.com/ggimg/clcp/374/z81602960.jpg	\N
403	142	http://source.cn-truck.com/ggimg/clcp/374/z81602961.jpg	\N
404	142	http://source.cn-truck.com/ggimg/clcp/374/z81602962.jpg	\N
405	142	http://source.cn-truck.com/ggimg/clcp/374/z81602963.jpg	\N
406	142	http://source.cn-truck.com/ggimg/clcp/374/z81602964.jpg	\N
407	142	http://source.cn-truck.com/ggimg/clcp/374/z81602965.jpg	\N
408	143	http://source.cn-truck.com/ggimg/clcp/385/y81260490.jpg	\N
409	143	http://source.cn-truck.com/ggimg/clcp/385/y81260492.jpg	\N
410	143	http://source.cn-truck.com/ggimg/clcp/385/y81260493.jpg	\N
411	143	http://source.cn-truck.com/ggimg/clcp/385/y81260494.jpg	\N
412	143	http://source.cn-truck.com/ggimg/clcp/385/y81260495.jpg	\N
413	144	http://source.cn-truck.com/ggimg/clcp/385/z11374950.jpg	\N
414	144	http://source.cn-truck.com/ggimg/clcp/385/z11374951.jpg	\N
415	144	http://source.cn-truck.com/ggimg/clcp/385/z11374952.jpg	\N
416	144	http://source.cn-truck.com/ggimg/clcp/385/z11374954.jpg	\N
417	144	http://source.cn-truck.com/ggimg/clcp/385/z11374955.jpg	\N
418	145	http://source.cn-truck.com/ggimg/clcp/384/y41101880.jpg	\N
419	145	http://source.cn-truck.com/ggimg/clcp/384/y41101881.jpg	\N
420	145	http://source.cn-truck.com/ggimg/clcp/384/y41101882.jpg	\N
421	145	http://source.cn-truck.com/ggimg/clcp/384/y41101884.jpg	\N
422	145	http://source.cn-truck.com/ggimg/clcp/384/y41101885.jpg	\N
423	146	http://source.cn-truck.com/ggimg/clcp/384/x71708460.jpg	\N
424	146	http://source.cn-truck.com/ggimg/clcp/384/x7170846_1.jpg	\N
425	146	http://source.cn-truck.com/ggimg/clcp/384/x71708462.jpg	\N
426	146	http://source.cn-truck.com/ggimg/clcp/384/x71708463.jpg	\N
427	146	http://source.cn-truck.com/ggimg/clcp/384/x71708464.jpg	\N
428	146	http://source.cn-truck.com/ggimg/clcp/384/x71708465.jpg	\N
429	147	http://source.cn-truck.com/ggimg/clcp/382/z71595040.jpg	\N
430	147	http://source.cn-truck.com/ggimg/clcp/382/z71595041.jpg	\N
431	147	http://source.cn-truck.com/ggimg/clcp/382/z71595042.jpg	\N
432	147	http://source.cn-truck.com/ggimg/clcp/382/z71595043.jpg	\N
433	147	http://source.cn-truck.com/ggimg/clcp/382/z71595044.jpg	\N
434	148	http://source.cn-truck.com/ggimg/clcp/374/z01328810.jpg	\N
435	148	http://source.cn-truck.com/ggimg/clcp/374/z01328811.jpg	\N
436	148	http://source.cn-truck.com/ggimg/clcp/374/z01328812.jpg	\N
437	148	http://source.cn-truck.com/ggimg/clcp/374/z01328813.jpg	\N
438	148	http://source.cn-truck.com/ggimg/clcp/374/z01328814.jpg	\N
439	148	http://source.cn-truck.com/ggimg/clcp/374/z01328815.jpg	\N
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
12	\N	1	\N	随车起重运输车2	2024-10-04 02:49:50	\N	slider-2-66ff57ced1e95179465647.jpg	\N	2024-10-04 02:49:50	\N	\N	\N	0	0	\N	0	\N
13	\N	1	\N	随车起重运输车3	2024-10-04 02:50:16	\N	slider-2-66ff57e94e4b8575644571.jpg	\N	2024-10-04 02:50:17	\N	\N	\N	0	0	\N	0	\N
14	\N	1	\N	汽车起重机1	2024-10-04 02:50:35	\N	slider-2-66ff57fc52706123570225.jpg	\N	2024-10-04 02:50:36	\N	\N	\N	0	0	\N	0	\N
31	\N	1	\N	领导关怀4	2024-10-04 06:59:26	\N	concern-2-66ff924f0b818315012866.jpg	\N	2024-10-04 06:59:27	\N	\N	\N	0	0	\N	0	\N
32	\N	1	\N	领导关怀5	2024-10-04 06:59:39	\N	concern-3-66ff925b8f58f655076767.jpg	\N	2024-10-04 06:59:39	\N	\N	\N	0	0	\N	0	\N
40	\N	1	\N	直销活动1	2024-10-04 07:47:58	<h2><strong>直销活动</strong></h2>	honor-4-66ff9daeaf5ab427977774.jpg	\N	2024-10-04 07:47:58	\N	\N	\N	0	0	\N	0	\N
41	\N	1	\N	促销活动1	2024-10-04 07:48:27	<p>促销活动1</p>	honor-4-66ff9dcc7e928571520588.jpg	\N	2024-10-04 07:48:28	\N	\N	\N	0	0	\N	0	\N
42	\N	1	\N	联名活动1	2024-10-04 07:48:46	<p>联名活动1</p>	honor-3-66ff9ddec9b38516455198.jpg	\N	2024-10-04 07:48:46	\N	\N	\N	0	0	\N	0	\N
43	\N	1	\N	定制活动1	2024-10-04 07:49:06	<p>定制活动1</p>	honor-3-66ff9df362542091947467.jpg	\N	2024-10-04 07:49:07	\N	\N	\N	0	0	\N	0	\N
3	\N	1	\N	公司荣誉-标题	2024-10-03 02:38:53	<p>人杰特种汽车将持续秉承“专业、信赖、科技”的经营理念和“严格、踏实、上进、创新”的企业精神，以“制造满足顾客需要，为用户创造更高附加值的产品”为目标，不断推陈出新，用人品打造精品，用精品服务社会，努力成为中国最全心全意为客户创造更高附加值的产品;以雄厚的经济实力、领先的技术、科学的管理、完善的服务体系缔造中国专用车更高品质。</p>	\N	\N	2024-10-03 02:38:53	\N	\N	\N	0	0	\N	0	\N
2	\N	1	\N	公司介绍	2024-10-03 02:37:33	<p><span style="background-color:rgb(255,255,255);color:rgb(58,58,58);">湖北人杰特种汽车科技有限公司（以下简称“人杰特种汽车”），成立于2010年,坐落于中国商用车之都——东风商用车生产基地湖北省十堰市，成立10年来始终根据《中华人民共和国行政许可法》和《国务院对确需保留的行政审批项目设定行政许可的决定》的规定，遵循予以许可的汽车、摩托车、三轮汽车生产企业及产品（第309批）的公告，致力于随车起重机、汽车起重机、特种作业车以及各类特种专用车的研发、制造及营销服务。其中随车起重机实现年产销量持续高速增长，自2013年起产销量连续七年稳居全国前三，实现年销售额2亿余元。经过多年科技创新与技术沉淀，现已成为中国最具规模和市场影响力的专用车生产企业，是中国随车起重行业的领跑者。</span></p><p><span style="background-color:rgb(255,255,255);color:rgb(58,58,58);">人杰特种汽车不断突破与自我完善，形成了一整套与世界接轨的管理运作模式。先进精准的制造、检测设备配合一流生产工艺，确保公司核心技术优势得以顺利转化。高效运行的“ISO9001-2000质量认证体系”、“环境/职业健康安全管理认证体系”和“3C认证”等制度体系，保证了公司始终处于稳步、健康、可持续发展。</span></p><p><span style="background-color:rgb(255,255,255);color:rgb(58,58,58);">公司运用自主品牌、资金、渠道等资源优势，建立了覆盖全国的营销体系和服务网络，可以及时高效地为全国用户提供全生命周期服务。在深耕国内市场的同时，人杰特种汽车放眼全球，积极拓展国际市场，将公司产品远销至10多个国家和地区。</span></p><p><span style="background-color:rgb(255,255,255);color:rgb(58,58,58);">展望未来，人杰特种汽车将持续秉承“专业、信赖、科技”的经营理念和“严格、踏实、上进、创新”的企业精神，以“制造满足顾客需要，为用户创造更高附加值的产品”为目标，不断推陈出新，用人品打造精品，用精品服务社会，努力成为中国最全心全意为客户创造更高附加值的产品;以雄厚的经济实力、领先的技术、科学的管理、完善的服务体系缔造中国专用车更高品质。</span></p>	about-1-66fe0f62a9f89068537326.jpg	\N	2024-10-03 03:28:34	\N	\N	\N	0	0	\N	0	\N
11	\N	1	\N	随车起重运输车1	2024-10-04 02:49:37	\N	slider-2-66ff57c290874326662134.jpg	\N	2024-10-04 02:49:38	\N	\N	\N	0	0	\N	0	\N
15	\N	1	\N	汽车起重机2	2024-10-04 02:50:44	\N	slider-2-66ff58050ccee948835263.jpg	\N	2024-10-04 02:50:45	\N	\N	\N	0	0	\N	0	\N
8	\N	1	\N	轮播图1-2	2024-10-04 01:49:06	<p>轮播图1</p>	a-img-7151-670f43f94cc40648458782.jpg	轮播图1	2024-10-16 04:41:29	\N	\N	\N	0	0	\N	0	\N
9	\N	1	\N	轮播图1-3	2024-10-04 01:49:21	<p>轮播图1</p>	a-img-5378-670f440441352130267437.jpg	轮播图1	2024-10-16 04:41:40	\N	\N	\N	0	0	\N	0	\N
6	\N	1	\N	亿元奖	2024-10-03 03:34:22	<p>亿元奖</p>	wei-xin-tu-pian-20241015162510-672111c27e6cf248483731.jpg	公司荣誉3	2024-10-29 16:48:02	\N	\N	\N	0	0	\N	0	\N
5	\N	1	\N	千台奖	2024-10-03 03:33:43	<p>千台奖</p>	wei-xin-tu-pian-20241015162511-672111f102af6841835214.jpg	公司荣誉2	2024-10-29 16:48:49	\N	\N	\N	0	0	\N	0	\N
4	\N	1	\N	钻石经销商	2024-10-03 03:33:08	<p>钻石经销商</p>	wei-xin-tu-pian-20241015162512-6721121a01870109115515.jpg	公司荣誉1	2024-10-29 16:49:30	\N	\N	\N	0	0	\N	0	\N
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
36	\N	1	\N	领导关怀-轮播图1	2024-10-04 07:12:03	\N	concern-1-66ff9543cd860412489026.jpg	\N	2024-10-04 07:12:03	\N	\N	\N	0	0	\N	0	\N
37	\N	1	\N	领导关怀-轮播图2	2024-10-04 07:12:16	\N	concern-1-66ff9550df5c8923316928.jpg	\N	2024-10-04 07:12:16	\N	\N	\N	0	0	\N	0	\N
38	\N	1	\N	领导关怀-轮播图3	2024-10-04 07:12:26	\N	concern-1-66ff955b4c655619025533.jpg	\N	2024-10-04 07:12:27	\N	\N	\N	0	0	\N	0	\N
39	\N	1	\N	新品上市1	2024-10-04 07:38:44	<p>新品上市1</p>	honor-3-66ff9b856f908086578656.jpg	\N	2024-10-04 07:38:45	\N	\N	\N	0	0	\N	0	\N
62	\N	\N	\N	湖北人杰特种汽车科技有限公司售后服务承诺书	2024-10-16 03:31:00	<p style="text-align:center;"><strong>湖北人杰特种汽车科技有限公司</strong></p><p style="text-align:center;"><strong>售后服务承诺书</strong></p><p>公司建设完整的质量保证体系和售后服务体系，分别在全国各地区建立售后服务点。公司生产的产品在市场运营体验效果优良，并在市场上活的良好的信誉。为更好的提供优质的售后服务，我司郑重做出如下售后承诺：</p><p>1、公司销售的新能源汽车和燃油类车辆产品的电子信息与汽车产品相一致，采用的底盘均是已取得生产准入企业及其国家有效的公告车型，且通过新汽车专项检测，符合汽车相关标准。主要关键零部件，如动力蓄电池储能装置、驱动电机、电机控制器等质保期均承诺不低于5年或20万公里（以先到为准），具体保质细则以随车使用说明书为准。</p><p>2、公司内部服务人员培训：公司成立售后服务组，不定期邀请合作的底盘生产企业工程师对组员进行产品知识培训、技术培训等；</p><p>外部服务网点人员培训：公司新能源汽车是在二类底盘上加装专用装置而成的改装车，我们不改变底盘电池、电机、电控等关键零部件，但是作为新能源汽车企业责任主体，公司定期索取底盘生产企业等售后服务网站人员培训信息。</p><p>产品用户培训：根据《新能源汽车动力蓄电池回收和利用管理暂行办法》要求，公司网站公示新能源汽车电池动力蓄电池装置信息。公司为销售的新能源汽车提供一份随车《使用说明书》，给用户提供操作、注意事项以及保养维护等方面的查询。汽车交付时，公司工程师向用户详细介绍产品的使用特性及要求，并演示专用装置使用要领和新能源关键零部件使用注意事项。</p><p>3、售后服务项目及内容</p><p>1）质量保修</p><p>为故障车辆进行质量鉴定，处理用户的质量索赔要求</p><p>2）24小时外出救援。</p><p>售后部在接到用户故障问题反馈后，售后技术工程师先通过电话指导用户排除一般性故障，若问题仍无法解决的，0.5小时内，公司售后部通知对应底盘服务站人员前往现场处理。根据故障情况需公司售后服务人员前往现场处理的，省内24小时到达现场、省外72小时内到达现场。维修人员到达现场后，对轻微故障4小时内解决；一级故障（简易零部件损坏）时10小时内解决；二级故障（专用性能故障）时24小时内提供明确解决方案，及时彻底解决。三级故障（底盘动力系统、电控系统故障）时48小时内保证车辆恢复状态，正常运行。我司将提供终身售后服务，且根据用户需要，为用户培训操作人员，提供相关技术资料。为使车辆保持良好车况和专用功能得到正常使用，用户有义务对车辆底盘及其改装部分进行日常、定期维护保养和常见故障排除。</p><p>3）远程监测系统</p><p>公司可使用主机厂新能源监测平台，对已销售新能源汽车的运行状态进行监测，直至车辆停止使用或报废。</p><p>4、备件提供及质量保证期限</p><p>1） 备件提供</p><p>公司建立备件储备制度，充分考虑消耗动态和市场供求实际情况，定期按照实际情况进行必要修改，以保证备件储备合理性；新能源关键零部件的备件：公司及时更新新能源销售清单至底盘生产企业，为底盘生产企业的关键零部件备件提供准确有效依据。</p><p>2)质量保证期限</p><p>（1）上装部分三包期：从发车之日起开始计算，“三包”期限，结构件“三包”期限为一年；国产液压系统缸、泵、阀“三包”期限为一年；进口液压系统缸、泵、阀保修“三包”期限为一年；气缸、真空泵、水泵、球阀、气阀“三包”期限为一年；各种电气开关、仪器仪表、传感器、电磁线圈等“三包”期限为三个月。</p><p>（2）底盘部分三包期：新能源底盘部分三包期，按照我司订购新能源底盘《质量保证手册》上各类配件的三包期执行。</p><p>（3）售后“三包”凭证：售后服务保修卡和发票（或发票复印件）</p><p>3）售后保修内容和范围：</p><p>（1）凡属湖北人杰特种汽车科技有限公司生产的新能源汽车，在规定的售后“三包”期限内，用户未对购买车辆进行改装、加装、更换配件且严格按照《使用手册》的规定进行正确操作、使用及维护前提下，经特约服务站或公司售后部鉴定是由于产品质量问题而出现的改装部分故障或零部件损坏，由公司按上述第（1）条 “上装三包期限”规定，给予售后“三包”免费维修服务，但其损坏零部件需退回公司留存备查。</p><p>（2）质保期内的电池组及配套控制系由底盘服务网点提供技术维护并保修，质保期后的电池使用由用户与底盘双方另行协商。用户在保质期后如需更换新电池，公司可为用户联系底盘供应商回收电池。</p><p>（3）质保期内，如发生双方共同确认的较严重的质量问题，则质保期中断，该问题消除后，质保期重新开始计算。</p><p>（4）质保期后，电池组及其配套控制系统出现了质量问题或有零部件损坏，服务网点仍应承担维修、更换责任，用户应向服务网点支付维修、更换所需的相关费用。</p><p>（5）对电池组及其配套控制系统的定期监测，质保期内新能源监测平台发现有 3 级故障报警的车辆，售后部及时通知终端用户采取措施消除安全隐患并将处理结果在1日内反馈地方和国家监管平台。对1日内连续出现多次3级故障报警的车辆，安排开展安全检查，我司或特约服务站点在接到用户通知后应在48小时内免费派人到现场维修，及时修复故障；</p><p>（6）新能源汽车底盘售后服务，参照《纯电动车底盘保养手册》和《纯电动车底盘质量保证手册》执行，公司将协助用户在纯电动车底盘厂家指定的特约维修站进行底盘的维修保养，使用户得到良好的服务。</p><p>（7）售后保修原则：以维修为主，不能修的更换零部件或总成。</p><p>（8）免责条款和范围</p><p>①保修凭证上车辆型号、电机型号、底盘号与实物不相符或涂改者，不予三包维修。</p><p>② 擅自对公司产品进行改装、加装、更换产品零部件，如添加弹簧片数、更换加厚的钢板弹簧、用电设备、结构件，或更换液压件等不予三包维修。</p><p>③ 未按《纯电动车使用手册》的要求进行使用、维护，或超范围使用的，包括但不现于以下情况：</p><p>Ø 不定期加注或更换润滑油、液压油导致的零配件损坏；</p><p>Ø 操作不当致使车辆故障；或改变装载介质致使产品变形损坏等。不属于保修范围的产品发生故障不予保修，包括对零件的变更以及由此引起的车辆损坏或失效的，不予保修。</p><p>Ø 车辆改装部分出现故障不及时，强制使用引起的继发性故障及损坏的零部件。</p><p>Ø 未经本公司同意，用户自行拆卸、修理的零部件。</p><p>Ø 任何自然灾害、火灾、撞车、偷盗所导致的损失以及由此引起的二次损伤，或任何由于烟尘、化学试剂、海水、海风、盐类或其它类似原因导致的损伤。</p><p>Ø 正常使用带来的产品正常磨损、失色、退化等。</p><p>5、售后服务过程中发现问题的反馈</p><p>新能源汽车维修过程中出现的批量产品故障或安全隐患的，公司及时填写《质量信息反馈表》，上报合作的底盘生产企业，协助制定合理处理方案。经合作的底盘生产企业判断为产品设计问题的，按照国家《缺陷汽车产品召回管理条例》有关规定执行召回。</p><p>6、动力蓄电池回收</p><p>根据《新能源汽车动力蓄电池回收利用管理暂行办法》要求，公司向社会公开新能源汽车采用的动力蓄电池维修和更换等技术信息，公开与底盘合作的电池回收服务网点信息以及回收步骤，为用户提供方便、快捷的回收服务建立动力蓄电池回收渠道。</p><p>7、索赔处理</p><p>技质部组织相关部门进行评审锁定故障及安全事故原因，判定责任方，第一时间解决客户损失。如问题原因由供应商质量问题导致，追诉供应商责任，并责成供应商对所有涉及车辆进行更换维修，保证产品质量，承担客户损失。并对此类故障提供分析报告，排查同批次或同类型产品质量，确保出厂零部件满足车辆适用要求。</p><p>8、在产品质量、安全、环保等方面出现严重问题时的应对措施。</p><p>1）公司成立了关于产品质量、安全、环保方面出现严重问题时的应急处理小组，包括通讯联络组、现场抢救组、后勤保障组、技术处理组以及危机处理组，建立新能源汽车安全事故管理办法。</p><p>2） 新能源产品质量、安全、环保等方面出现严重问题时，现场处理组第一时间赶往现场，配合底盘服务站人员处理问题；</p><p>3）技术处理组12小时内抵达现场，协助底盘服务站人员进行事故鉴定取证，如需第三方机构鉴定，现场抢救组需维护好现场等待机构达到；</p><p>4）危机处理组负责对公众发布信息，借助法律支持，防止造成社会负面影响。</p><p>9、售后服务网点开发</p><p>公司目前指定的销售网点、维修网点按照RJQP-28《售后服务控制程序》进行相关筛选、内部评审后确定，现有的售后服务网点满足对我公司新能源产品推广应用区域的全覆盖。目前我公司售后服务网点开发建设主要是两种方式，一种方式我按照公司RJQP-28《售后服务控制程序》在车辆运营区域开发售后服务网点，来满足新能源产品售后维修。第二种方式是联合二类底盘生产企业的售后服务网点，经我公司评估是否具有新能源汽车产品售后服务能力后，再将其纳入我公司售后服务网点系统中。</p><p>公司依据 RJQP-07《人力资源管理控制程序》，对销售人员和服务人员必须经过专业培训后方可上岗。售后部切实做好新能源汽车的售后服务及应急保障能力支持，每年度初对售后服务站和在用新能源产品进行自查，并向主管部门提交自查报告。</p><p><br>&nbsp;</p><p>湖北人杰特种汽车科技有限公司设有24小时客户服务中心，为您提供全天候咨询、投诉和回访呼叫服务，欢迎您对我们的服务工作提出宝贵意见和建议。</p><p>我司售后服务联系方式</p><p>服务热线：0719-8233676</p><p>地址：十堰市张湾区工业新区上河路6-1号&nbsp;</p>	\N	\N	2024-10-16 03:31:00	\N	\N	\N	\N	\N	\N	\N	\N
7	\N	1	\N	轮播图1-1	2024-10-04 01:48:49	<p>轮播图1轮播图1</p>	a-nku5xzseh-0sx6l-o-gj1t-670f43deda1cb496854692.png	轮播图1	2024-10-16 04:41:02	\N	\N	\N	0	0	\N	0	\N
63	\N	\N	\N	轮播图1-4	2024-10-16 04:41:54	\N	a-img-5336-670f441248617992022718.jpg	\N	2024-10-16 04:41:54	\N	\N	\N	\N	\N	\N	\N	\N
64	\N	\N	\N	轮播图1-5	2024-10-16 04:42:10	\N	a-a1568364929f84632ec49cf78f0f283-670f44224e4c4101830480.jpg	\N	2024-10-16 04:42:10	\N	\N	\N	\N	\N	\N	\N	\N
65	\N	\N	\N	轮播图1-6	2024-10-16 04:42:19	\N	a-26121d83a6140a1f456182251a030d1-670f442b19e74370195450.jpg	\N	2024-10-16 04:42:19	\N	\N	\N	\N	\N	\N	\N	\N
66	\N	\N	\N	救险车1	2024-10-29 16:11:06	\N	1-6721091a5e96a013588971.jpg	\N	2024-10-29 16:11:06	\N	\N	\N	\N	\N	\N	\N	\N
67	\N	\N	\N	清障车1	2024-10-29 16:12:42	\N	2-6721097ad340e407881311.jpg	\N	2024-10-29 16:12:42	\N	\N	\N	\N	\N	\N	\N	\N
68	\N	\N	\N	清障车2	2024-10-29 16:13:01	\N	2-6721098d75c7c659222458.jpg	\N	2024-10-29 16:13:01	\N	\N	\N	\N	\N	\N	\N	\N
69	\N	\N	\N	清障车3	2024-10-29 16:13:22	\N	2-672109a26c186445259116.jpg	\N	2024-10-29 16:13:22	\N	\N	\N	\N	\N	\N	\N	\N
70	\N	\N	\N	随车吊1	2024-10-29 16:14:16	\N	3-672109d86e169647946540.jpg	\N	2024-10-29 16:14:16	\N	\N	\N	\N	\N	\N	\N	\N
45	\N	1	\N	“双品牌 双渠道”再结硕果！徐工随车&东风华神一体化战略合作，两大行业“顶流”强强联手	2024-10-04 08:07:34	<p style="text-align:center;"><strong>立足行业“顶流”，占领品牌高地</strong>&nbsp;</p><p style="text-align:justify;"><span style="color:rgb(89,89,89);">2019年，为了将合作向纵深推进，双方就“双品牌·双渠道”的战略合作达成共识，开启一体化战略合作的强强联手之旅。</span></p><p style="text-align:justify;"><span style="color:rgb(89,89,89);">2021年，面对全球疫情持续演变，经济下行、行业内卷，徐工随车起重机产业“双品牌·双渠道”营销理念不断深入落地，并以此为跳板打破壁垒瓶颈，稳如泰山，直面严峻的市场考验。</span></p><figure class="image"><img style="aspect-ratio:1080/720;" src="/images/67210cc9bc824-640.jpg" width="1080" height="720"></figure><p style="text-align:justify;"><span style="color:rgb(89,89,89);">2022年，在随车起重运输车行业，一场历史性变革正暗波汹涌。徐工随车将继续秉持“互利共赢”的合作原则，充分利用双方的品牌影响力与渠道优势，凝聚共识，同心同力，为共同实现高质量、高效率、高效益、可持续的“三高一可”发展提供助力。</span></p><p style="text-align:justify;"><span style="color:rgb(89,89,89);">仪式上，徐工随车总经理助理、营销公司总经理晁玉国和东风华神营销公司总经理胡建勇，分别对多年坚定同行与所铸就的产业硕果互道感谢。</span></p><figure class="image"><img style="aspect-ratio:1080/419;" src="/images/67210cea58689-2.jpg" width="1080" height="419"></figure><p style="text-align:center;">&nbsp;</p><p style="text-align:justify;"><span style="color:rgb(89,89,89);">双方就“全面合作、互利互惠、务求实效”的原则达成战略共识，并将持续建立长期战略伙伴关系，加快资源互补，推动全国随车起重机行业发展，为工程机械产业的发展壮大及徐工珠峰登顶的宏伟目标，贡献更多力量。</span></p><p style="text-align:justify;">&nbsp;</p><figure class="image"><img style="aspect-ratio:1080/709;" src="/images/67210d0633b8f-3.jpg" width="1080" height="709"></figure><p style="text-align:justify;">&nbsp;</p><p style="text-align:justify;"><span style="color:rgb(89,89,89);">特别是在</span><span style="color:rgb(30,155,232);"><strong>技术研发、资源协同、市场开发及商业模式创新</strong></span><span style="color:rgb(89,89,89);">等相关领域，形成规范化、模块化、专业化的设计和制造，组建</span><span style="color:rgb(30,155,232);"><strong>一体化深度协同的经销和服务体系。</strong></span></p><p style="text-align:justify;">&nbsp;</p><figure class="image"><img style="aspect-ratio:1080/676;" src="/images/67210d1b2f0f3-4.jpg" width="1080" height="676"></figure><p style="text-align:justify;"><span style="color:rgb(30,155,232);">签约仪式结束后，第一批交付订单车辆从东风华神厂区缓慢驶出。</span></p><p style="text-align:center;"><strong>行健而致远，联手赋能行业梦想&nbsp;</strong></p><p style="text-align:justify;"><span style="color:rgb(89,89,89);">十多年来，徐工随车在城市运营专用车领域与</span><span style="color:rgb(30,155,232);"><strong>徐工汽车、一汽解放、陕汽重卡、东风华神等高端底盘品牌</strong></span><span style="color:rgb(89,89,89);">融合，打造行业内高端标杆渠道体系，率先提出并建立基于全价值链的“双品牌·双渠道”战略，实现共荣共赢。</span></p><p style="text-align:justify;">&nbsp;</p><figure class="image"><img style="aspect-ratio:1080/629;" src="/images/67210d4a54879-6.jpg" width="1080" height="629"></figure><p style="text-align:justify;"><span style="color:rgb(89,89,89);">大力加速推进细分市场布局，迅速扩大市场份额，全面释放“双品牌·双渠道”的品牌影响力，</span><span style="color:rgb(30,155,232);"><strong>为城市建设、行业发展、客户获益创造价值。</strong></span></p>	640-67210d77c6d88673972323.jpg	2022年2月14日，徐工随车与东风集团旗下东风华神底盘品牌，举行全面战略合作签约仪式。\r\n徐州徐工随车起重机有限公司党委书记、总经理孙小军与东风华神汽车有限公司党委书记、总经理孙振义，出席签约仪式，并代表双方签署战略合作协议。这标志着徐工推进“双品牌·双渠道”战略，取得又一硕果。	2024-10-29 16:29:43	\N	\N	\N	0	0	\N	0	\N
35	\N	1	\N	张湾区民营企业制造业20强	2024-10-04 07:05:54	\N	wei-xin-tu-pian-20241015162136-6721117849c40804611956.jpg	\N	2024-10-29 16:46:48	\N	\N	\N	0	0	\N	0	\N
44	\N	1	\N	重磅 | 东风华神、徐工随车“百城百店”联合推广行动正式启动	2024-10-04 08:06:58	<p style="text-align:justify;"><span style="color:rgb(0,0,0);">8月26日，东风华神汽车有限公司（以下简称：东风华神）、徐州徐工随车起重机有限公司（以下简称：徐工随车）“百城百店”联合推广启动仪式在东风华神报告厅隆重举行。此次活动是继2022年东风华神、徐工随车“强强联合、共赢未来”战略合作协议签订以来，双方合作的再次深化。<strong>今后，双方将全面开启强强联合、深度沟通、共建共享、共赢共进的发展之路，为进一步提升东风华神和徐工随车整车一体化市场影响力及市场份额，强化促进双方的销售渠道与市场推广联动共赢。</strong></span></p><figure class="image"><img style="aspect-ratio:1080/720;" src="/images/67210ef7bbad0-1.jpg" width="1080" height="720"></figure><p style="text-align:center;"><strong>商道共赢</strong></p><p style="text-align:justify;"><span style="color:rgb(0,0,0);">徐工随车党委副书记、副总经理商晓恒，徐工随车营销公司副总经理兼专用及新品业务部部长吴步昇，十堰博维汽车贸易有限公司总经理夏昌林，徐工随车营销公司各大区的总经理；东风特种商用车有限公司党委书记、总经理孙振义，东风特商副总经理赵浩南，东风华神总经理助理吕宗平，东风华神营销公司总经理胡建勇出席启动仪式。</span></p><figure class="image"><img style="aspect-ratio:1080/720;" src="/images/67210f18b73de-2.jpg" width="1080" height="720"></figure><p style="text-align:justify;"><span style="color:rgb(0,0,0);">胡建勇在致辞中说，此次活动是对东风华神与徐工随车全新产品的一次展示，也是进一步拉近东风华神与徐工随车之间距离，发现和改善东风华神营销工作不足的绝好机会。东风华神愿与徐工随车进一步加强合作，通过战略联合共同推动全国随车吊行业发展，深化市场协同、技术协同、资源协同、广宣协同，从而实现优势互补，共创共赢。</span></p><figure class="image"><img style="aspect-ratio:1080/720;" src="/images/67210f271c918-3.jpg" width="1080" height="720"></figure><p style="text-align:justify;"><span style="color:rgb(0,0,0);">吴步昇表示，东风华神、徐工随车“百城百店”联合推广启动会旨在升级合作、联动市场、回馈客户，携手推进“双品牌·一体化”战略走深走实。徐工随车将进一步凝聚“东风华神、徐工随车、经销商伙伴”三方合力，携手并肩、同心同向，为东风华神的发展壮大和徐工“建设世界一流企业、攀登全球产业珠峰”贡献更多力量。</span></p><figure class="image"><img style="aspect-ratio:1080/738;" src="/images/67210f35e29ca-4.jpg" width="1080" height="738"></figure><p style="text-align:justify;"><span style="color:rgb(0,0,0);">启动仪式上，孙振义与商晓恒共同启动“百城百店”联合推广行动启动球。</span></p><figure class="image"><img style="aspect-ratio:1080/720;" src="/images/67210f46ad960-5.jpg" width="1080" height="720"></figure><p style="text-align:justify;"><span style="color:rgb(0,0,0);">吕宗平、吴步昇共同为徐工随车五大区域总经理颁发战旗。</span></p><figure class="image"><img style="aspect-ratio:1080/624;" src="/images/67210f5369eca-6.jpg" width="1080" height="624"></figure><p style="text-align:justify;"><span style="color:rgb(0,0,0);">孙振义与商晓恒一同鸣枪发车，30台东风华神徐工专供整车承载着东风华神、徐工随车的使命和梦想踏上新征程。</span></p><figure class="image"><img style="aspect-ratio:1080/720;" src="/images/67210f62cbfb4-7.jpg" width="1080" height="720"></figure><p><br>&nbsp;</p><p style="text-align:center;">站在新起点 开启新征程</p><p style="text-align:center;">东风华神&amp;徐工随车</p><p style="text-align:center;">携手共进&nbsp;共赢未来</p><figure class="image"><img style="aspect-ratio:1080/710;" src="/images/67210f85b3dd4-8.jpg" width="1080" height="710"></figure><figure class="image"><img style="aspect-ratio:1080/720;" src="/images/67210f8d34e63-9.jpg" width="1080" height="720"></figure><figure class="image"><img style="aspect-ratio:1080/720;" src="/images/67210f9987eb3-10.jpg" width="1080" height="720"></figure><figure class="image"><img style="aspect-ratio:1080/720;" src="/images/67210fa01e28e-11.jpg" width="1080" height="720"></figure>	1-6721100039f34279924673.jpg	8月26日，东风华神汽车有限公司（以下简称：东风华神）、徐州徐工随车起重机有限公司（以下简称：徐工随车）“百城百店”联合推广启动仪式在东风华神报告厅隆重举行。	2024-10-29 16:40:32	\N	\N	\N	0	0	\N	0	\N
71	\N	\N	\N	收获奖项	2024-10-29 16:51:06	\N	wei-xin-tu-pian-20241015162143-672112918969e698969959.jpg	\N	2024-10-29 16:51:29	\N	\N	\N	\N	\N	\N	\N	\N
72	\N	1	\N	猛卡士特牌XCL5182JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/a91101740.jpg	\N	2024-10-29 22:10:11	\N	\N	\N	0	\N	\N	0	\N
73	\N	1	\N	猛卡士特牌XCL5259JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/a91105030.jpg	\N	2024-10-29 22:10:11	\N	\N	\N	0	\N	\N	0	\N
74	\N	1	\N	猛卡士特牌XCL5189JSQ6P随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/a91105310.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
75	\N	1	\N	猛卡士特牌XCL5310JSQL6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/a96101780.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
76	\N	1	\N	猛卡士特牌XCL5181JSQJ6L随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/a9d177250.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
77	\N	1	\N	猛卡士特牌XCL5189JSQ6L随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/a9c165680.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
78	\N	1	\N	猛卡士特牌XCL5185JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/a9f224230.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
79	\N	1	\N	猛卡士特牌XCL5259JSQL6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/a9d188250.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
80	\N	1	\N	猛卡士特牌XCL5253JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/aa3281880.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
81	\N	1	\N	猛卡士特牌XCL5311JSQJ6D随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/aa2277640.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
82	\N	1	\N	猛卡士特牌XCL5250JSQD6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/aa1255360.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
83	\N	1	\N	猛卡士特牌XCL5180JSQG6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/aa3292060.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
84	\N	1	\N	猛卡士特牌XCL5180JSQH6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/aa3292690.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
85	\N	1	\N	猛卡士特牌XCL5250JSQH6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/aa4309200.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
86	\N	1	\N	猛卡士特牌XCL5250JSQ随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/w21491020.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
87	\N	1	\N	猛卡士特牌XCL5310JSQ6D随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/w61559760.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
88	\N	1	\N	猛卡士特牌XCL5256JSQH随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/x61678420.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
89	\N	1	\N	猛卡士特牌XCL5180JSQL6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/w31478030.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
90	\N	1	\N	猛卡士特牌XCL5256JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/z11364030.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
91	\N	1	\N	猛卡士特牌XCL5243JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/z01324480.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
92	\N	1	\N	猛卡士特牌XCL5312JSQ6P随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/z01313020.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
93	\N	1	\N	猛卡士特牌XCL5250JSQS6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/y91305130.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
94	\N	1	\N	猛卡士特牌XCL5183JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/y91285060.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
95	\N	1	\N	猛卡士特牌XCL5189JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/x91029130.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
96	\N	1	\N	猛卡士特牌XCL5251JSQJ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/y31128220.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
97	\N	1	\N	猛卡士特牌XCL5186JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/z51514950.jpg	\N	2024-10-29 22:10:12	\N	\N	\N	0	\N	\N	0	\N
98	\N	1	\N	猛卡士特牌XCL5186JSQL6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/z51497590.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
99	\N	1	\N	猛卡士特牌XCL5312JSQ6P2随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/z31452990.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
100	\N	1	\N	猛卡士特牌XCL5258JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/z81604250.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
101	\N	1	\N	猛卡士特牌XCL5250JSQL6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/z71589470.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
102	\N	1	\N	猛卡士特牌XCL5256JSQL6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/z71581480.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
103	\N	1	\N	猛卡士特牌XCL5251JSQB6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/aaa422570.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
104	\N	1	\N	猛卡士特牌XCL5181JSQB6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/aaa415010.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
105	\N	1	\N	猛卡士特牌XCL5180JSQBEV纯电动随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/aaa416650.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
106	\N	1	\N	猛卡士特牌XCL5311JSQB6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/aaa415400.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
107	\N	1	\N	猛卡士特牌XCL5160JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/z21429580.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
108	\N	1	\N	猛卡士特牌XCL5166JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/z71589370.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
109	\N	1	\N	猛卡士特牌XCL5254JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/aa1251400.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
110	\N	1	\N	猛卡士特牌XCL5161JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/aa1261200.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
111	\N	1	\N	猛卡士特牌XCL5186JSQ6D随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/a9f227900.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
112	\N	1	\N	猛卡士特牌XCL5312JSQH随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/x91023700.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
113	\N	1	\N	猛卡士特牌XCL5312JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/x71699700.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
114	\N	1	\N	猛卡士特牌XCL5319JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/x71707390.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
115	\N	1	\N	猛卡士特牌XCL5257JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/x71706720.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
116	\N	1	\N	猛卡士特牌XCL5316JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/x91025500.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
117	\N	1	\N	猛卡士特牌XCL5319JSQ随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/x91028610.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
118	\N	1	\N	猛卡士特牌XCL5315JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/x91036230.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
119	\N	1	\N	猛卡士特牌XCL5315JSQH随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/x51639870.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
120	\N	1	\N	猛卡士特牌XCL5185JSQH随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/x51657850.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
121	\N	1	\N	猛卡士特牌XCL5310JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/y91303630.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
122	\N	1	\N	猛卡士特牌XCL5311JSQJ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/y21025550.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
123	\N	1	\N	猛卡士特牌XCL5250JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/z01313360.jpg	\N	2024-10-29 22:10:13	\N	\N	\N	0	\N	\N	0	\N
124	\N	1	\N	猛卡士特牌XCL5310JSQG6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/y91306070.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
125	\N	1	\N	猛卡士特牌XCL5317JSQ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/z11379230.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
126	\N	1	\N	猛卡士特牌XCL5257JSQ随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/z11364630.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
127	\N	1	\N	猛卡士特牌XCL5250JSQS6D随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/aa9385720.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
128	\N	1	\N	猛卡士特牌XCL5253JSQS6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/aa9395690.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
129	\N	1	\N	猛卡士特牌XCL5251JSQJ6D随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/384/aa2273450.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
130	\N	1	\N	猛卡士特牌XCL5181JSQJ6随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/383/y21045230.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
131	\N	1	\N	猛卡士特牌XCL5141JSQ6L随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/374/x41614910.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
132	\N	1	\N	猛卡士特牌XCL5316JSQH随车起重运输车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/374/z11376170.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
133	\N	2	\N	猛卡士特牌XCL5410JQZ汽车起重机	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/378/x71691160.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
134	\N	4	\N	猛卡士特牌XCL5100TQZB6清障车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/386/aaa420380.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
135	\N	4	\N	猛卡士特牌XCL5045TQZB6清障车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/384/aa8376110.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
136	\N	4	\N	猛卡士特牌XCL5186TQZG6清障车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/382/a9d184480.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
137	\N	4	\N	猛卡士特牌XCL5180TQZD6清障车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/377/a9c170760.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
138	\N	5	\N	猛卡士特牌XCL5047JGK6高空作业车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/374/a9d183760.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
139	\N	6	\N	猛卡士特牌XCL5090XDY6电源车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/aa7355210.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
140	\N	6	\N	猛卡士特牌XCL5100XDY6电源车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/aa7358500.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
141	\N	6	\N	猛卡士特牌XCL5310XDYCA6电源车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/382/aa2271510.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
142	\N	6	\N	猛卡士特牌XCL5250XDYZZ6电源车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/374/z81602960.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
143	\N	7	\N	猛卡士特牌XCL5160XXHZZ6救险车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/y81260490.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
144	\N	7	\N	猛卡士特牌XCL5040XXHEQ6救险车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/385/z11374950.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
145	\N	7	\N	猛卡士特牌XCL5070XXHEQ6救险车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/384/y41101880.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
146	\N	7	\N	猛卡士特牌XCL5181XXHL6救险车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/384/x71708460.jpg	\N	2024-10-29 22:10:14	\N	\N	\N	0	\N	\N	0	\N
147	\N	7	\N	猛卡士特牌XCL5031XXHQL6救险车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/382/z71595040.jpg	\N	2024-10-29 22:10:15	\N	\N	\N	0	\N	\N	0	\N
148	\N	7	\N	猛卡士特牌XCL5070XXHQL6救险车	2024-10-29 08:10:11	\N	http://source.cn-truck.com/ggimg/clcp/374/z01328810.jpg	\N	2024-10-29 22:10:15	\N	\N	\N	0	\N	\N	0	\N
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
62	20
63	1
64	1
65	1
66	23
67	5
68	5
69	5
71	8
70	3
72	11
73	11
74	11
75	11
76	11
77	11
78	11
79	11
80	11
81	11
82	11
83	11
84	11
85	11
86	11
87	11
88	11
89	11
90	11
91	11
92	11
93	11
94	11
95	11
96	11
97	11
98	11
99	11
100	11
101	11
102	11
103	11
104	11
105	11
106	11
107	11
108	11
109	11
110	11
111	11
112	11
113	11
114	11
115	11
116	11
117	11
118	11
119	11
120	11
121	11
122	11
123	11
124	11
125	11
126	11
127	11
128	11
129	11
130	11
131	11
132	11
133	11
134	11
135	11
136	11
137	11
138	11
139	11
140	11
141	11
142	11
143	11
144	11
145	11
146	11
147	11
148	11
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
4	1	轮播图-汽车起重机	slide_2_2	5	\N	createdAt,body,image,summary,tags,specs,images,category	\N
7	3	公司介绍	intro	1	\N	body,image,summary,tags,createdAt	\N
20	4	售后服务承诺	guarantee	1	\N	body,image,summary,tags	\N
1	1	轮播图-1	slide_1	6	\N	body,image,summary,regions,tags,createdAt,images	\N
22	1	轮播图-电源车	slide_2_5	5	\N	body,image,summary,tags,specs	\N
21	1	轮播图-高空作业车	slide_2_4	5	\N	body,image,summary,tags,specs	\N
23	1	轮播图-救险车	slide_2_6	5	\N	body,image,summary,tags,specs	\N
5	1	轮播图-清障车	slide_2_3	5	\N	createdAt,image,body,summary,tags,specs,images,category	\N
3	1	轮播图-随车起重运输车	slide_2_1	5	\N	createdAt,body,image,summary,tags,specs,images,category	\N
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
25	72	外形尺寸:	9000×2500,2550×3550,3650,3750,3850(mm)
26	72	货箱尺寸:	4800,5000,5200,5400,5800,6100,5600,6200,6300×2400,2450×400,550,600(mm)
27	72	总质量:	18000(Kg)
28	72	载质量利用系数:	1.14,1.00,1.27,1.4
29	72	整备质量:	12200,12800,11700(Kg)
30	72	额定载质量:	5670,5605,5070,5005,6170,6105(Kg)
31	72	挂车质量:	(Kg)
32	72	半挂鞍座:	
33	72	驾驶室:	
34	72	前排乘客:	2,3(人)
35	72	额定载客：	(人)
36	72	防抱死系统：	有
37	72	接近角/离去角：	16/11(°)
38	72	前悬/后悬：	1430/2570,1450/2550,1307/2693(mm)
39	72	轴荷：	6500/11500
40	72	轴距：	5000(mm)
41	72	轴数：	2
42	72	最高车速：	89(km/h)
43	72	油耗：	26.4,26.4,26.4,20.95,20.95(L/100Km)
44	72	弹簧片数：	8/10+8,9/10+8
45	72	轮胎数：	6(个)
46	72	轮胎规格：	10.00R20 18PR,11R22.5 18PR
47	72	前轮距：	1915,1920(mm)
48	72	后轮距：	1820,1860,1840(mm)
49	72	制动前：	
50	72	制动后：	
51	72	制操前：	
52	72	制操后：	
53	72	转向形式：	方向盘
54	72	起动方式：	
55	72	Vin车辆识别代码:	LGAX3B13×××××××××\nLGAC3B13×××××××××\nLGAX3C13×××××××××\nLGAC3A13×××××××××\nLGAX3A13×××××××××
56	73	外形尺寸:	12000×2500,2550×3700,3800,3900,3990,3750,3850(mm)
57	73	货箱尺寸:	6500,7200,7800,7900,8000,8100,8200,8300,8400,8500×2400,2450×400,500,550,800,600(mm)
58	73	总质量:	25000(Kg)
59	73	载质量利用系数:	1.29,1.00,1.15,1.19,1.38
60	73	整备质量:	17200,18800,17900(Kg)
61	73	额定载质量:	7670,6070,6970,7605,6005,6905(Kg)
62	73	挂车质量:	(Kg)
63	73	半挂鞍座:	
64	73	驾驶室:	
65	73	前排乘客:	2,3(人)
66	73	额定载客：	(人)
67	73	防抱死系统：	有
68	73	接近角/离去角：	16/9(°)
69	73	前悬/后悬：	1525/3300(mm)
70	73	轴荷：	7000/18000(二轴组)
71	73	轴距：	5775+1400,4375+1400,4775+1400(mm)
72	73	轴数：	3
73	73	最高车速：	89(km/h)
74	73	油耗：	32.18,32.37,32.37,32.41,32.18,31.22,30.91,30.91,30.91(L/100Km)
75	73	弹簧片数：	10/12
76	73	轮胎数：	10(个)
77	73	轮胎规格：	11.00R20 18PR,12.00R20 16PR,12R22.5 18PR
78	73	前轮距：	2011,2036,2070(mm)
79	73	后轮距：	1860/1860(mm)
80	73	制动前：	
81	73	制动后：	
82	73	制操前：	
83	73	制操后：	
84	73	转向形式：	方向盘
85	73	起动方式：	
86	73	Vin车辆识别代码:	LZGCL2M4×××××××××\nLZGCL2N4×××××××××\nLZGCL2P4×××××××××\nLZGCL2R4×××××××××\nLZGCL2L4×××××××××
87	74	外形尺寸:	9000,8275,7810×2500,2550×3550,3650,3750,3850(mm)
88	74	货箱尺寸:	4800,5000,5200,5400,5800,6050,6100,5600,4500,4600,5100,5500,4700,4900,5300,5700,5900,6000,6200,6300×2400,2450×400,550(mm)
89	74	总质量:	18000(Kg)
90	74	载质量利用系数:	1.14,1,1.19
91	74	整备质量:	12200,12800,11700(Kg)
92	74	额定载质量:	5670,5605,5070,5005,6170,6105(Kg)
93	74	挂车质量:	(Kg)
94	74	半挂鞍座:	
95	74	驾驶室:	
96	74	前排乘客:	2,3(人)
97	74	额定载客：	(人)
98	74	防抱死系统：	有
99	74	接近角/离去角：	20/12(°)
100	74	前悬/后悬：	1300/2600,1300/2475,1300/2310(mm)
101	74	轴荷：	6500/11500
102	74	轴距：	5100,4500,4200,4700(mm)
103	74	轴数：	2
104	74	最高车速：	89(km/h)
105	74	油耗：	26.5,24.39,24.70,26.41(L/100Km)
106	74	弹簧片数：	7/9+7,7/10+3,9/10+6,9/10+8,9/11+8,8/10+8,3/4+3,9/10+3
107	74	轮胎数：	6(个)
108	74	轮胎规格：	10.00R20 18PR
109	74	前轮距：	1900,1940,1970(mm)
110	74	后轮距：	1860(mm)
111	74	制动前：	
112	74	制动后：	
113	74	制操前：	
114	74	制操后：	
115	74	转向形式：	方向盘
116	74	起动方式：	
117	74	Vin车辆识别代码:	LZGCD2H1×××××××××\nLZGCD2J1×××××××××
118	75	外形尺寸:	12000×2520,2550×3750,3850,3950,3990(mm)
119	75	货箱尺寸:	7500,7700,8200,8400,8500,8000×2300,2400,2450×400,550,800(mm)
120	75	总质量:	31000(Kg)
121	75	载质量利用系数:	1.01,1.16,1.02
122	75	整备质量:	22200,23200,24200(Kg)
123	75	额定载质量:	8670,8605,7670,7605,6670,6605(Kg)
124	75	挂车质量:	(Kg)
125	75	半挂鞍座:	
126	75	驾驶室:	
127	75	前排乘客:	2,3(人)
128	75	额定载客：	(人)
129	75	防抱死系统：	有
130	75	接近角/离去角：	19/14(°)
131	75	前悬/后悬：	1410/2690,1410/2890,1250/2850,1250/3050(mm)
132	75	轴荷：	6500/6500/18000(二轴组)
133	75	轴距：	2150+4400+1350,2250+4100+1350(mm)
134	75	轴数：	4
135	75	最高车速：	88(km/h)
136	75	油耗：	37.20,37.20,37.10,35.11,36.67(L/100Km)
137	75	弹簧片数：	9/9/13
138	75	轮胎数：	12(个)
139	75	轮胎规格：	11.00R20 18PR
140	75	前轮距：	2040/2040,2050/2050,1960/1960(mm)
141	75	后轮距：	1860/1860(mm)
142	75	制动前：	
143	75	制动后：	
144	75	制操前：	
145	75	制操后：	
146	75	转向形式：	方向盘
147	75	起动方式：	
148	75	Vin车辆识别代码:	LGHXPJ6X×××××××××
149	76	外形尺寸:	9000×2500,2550×3650,3750,3850(mm)
150	76	货箱尺寸:	5000,5200,5400,5600,5800,6100,6200,6300×2400,2450×550,600(mm)
151	76	总质量:	18000(Kg)
152	76	载质量利用系数:	1.00,1.14,1.27
153	76	整备质量:	12800,12200,11700(Kg)
154	76	额定载质量:	5070,5005,5670,5605,6170,6105(Kg)
155	76	挂车质量:	(Kg)
156	76	半挂鞍座:	
157	76	驾驶室:	
158	76	前排乘客:	2,3(人)
159	76	额定载客：	(人)
160	76	防抱死系统：	有
161	76	接近角/离去角：	17/8(°)
162	76	前悬/后悬：	1400/2600(mm)
163	76	轴荷：	6500/11500
164	76	轴距：	5300,5000,4700,4500,5600,5800,6000,4200,4000,3800(mm)
165	76	轴数：	2
166	76	最高车速：	89(km/h)
167	76	油耗：	26.25,26.92,21.38,23.40(L/100Km)
168	76	弹簧片数：	10/12+8,12/12+8,13/12+8,7/7+6,10/12+9,10/9+7
169	76	轮胎数：	6(个)
170	76	轮胎规格：	10.00R20,11.00R20,295/80R22.5,295/60R22.5,275/80R22.5,11R22.5
171	76	前轮距：	1928,1827,1800,1950(mm)
172	76	后轮距：	1878,1860(mm)
173	76	制动前：	
174	76	制动后：	
175	76	制操前：	
176	76	制操后：	
177	76	转向形式：	方向盘
178	76	起动方式：	
179	76	Vin车辆识别代码:	LFNAHULM×××××××××\nLFNAHUKM×××××××××\nLFNAHULK×××××××××\nLFNAHUKK×××××××××\nLFNAHULJ×××××××××\nLFNAHUKJ×××××××××\nLFNAHULH×××××××××\nLFNAHUKH×××××××××\nLFNAHULP×××××××××\nLFNAHUKP×××××××××\nLFNAHULN×××××××××\nLFNAHUKN×××××××××\nLFNAHULR×××××××××\nLFNAHUKR×××××××××\nLFN
180	77	外形尺寸:	9000,8275,7810×2500,2550×3550,3650,3750,3850(mm)
181	77	货箱尺寸:	4800,5000,5200,5400,5600,5800,6050,6100,4500,4600,5100,5500,4700,4900,5300,5700,5900,6000,6200,6300×2400,2450×400,550(mm)
182	77	总质量:	18000(Kg)
183	77	载质量利用系数:	1.25,1.4,1.57
184	77	整备质量:	11800,11300,10800(Kg)
185	77	额定载质量:	6070,6005,6570,6505,7070,7005(Kg)
186	77	挂车质量:	(Kg)
187	77	半挂鞍座:	
188	77	驾驶室:	
189	77	前排乘客:	2,3(人)
190	77	额定载客：	(人)
191	77	防抱死系统：	有
192	77	接近角/离去角：	20/10(°)
193	77	前悬/后悬：	1300/2600,1300/2475,1300/2310(mm)
194	77	轴荷：	6500/11500
195	77	轴距：	5100,4500,4200,4700(mm)
196	77	轴数：	2
197	77	最高车速：	89(km/h)
198	77	油耗：	26.5,24.39,24.70,26.41(L/100Km)
199	77	弹簧片数：	7/9+7,7/10+3,9/10+6,9/10+8,9/11+8,8/10+8,3/4+3,9/10+3
200	77	轮胎数：	6(个)
201	77	轮胎规格：	10.00R20 18PR
202	77	前轮距：	1900,1940,1970(mm)
203	77	后轮距：	1860(mm)
204	77	制动前：	
205	77	制动后：	
206	77	制操前：	
207	77	制操后：	
208	77	转向形式：	方向盘
209	77	起动方式：	
210	77	Vin车辆识别代码:	LZGCD2H1×××××××××\nLZGCD2J1×××××××××
211	78	外形尺寸:	7860,8420,9000×2500,2550×3650,3750,3850(mm)
212	78	货箱尺寸:	5000,5200,5400,5600,5800,6100,6200,6300×2400,2450×550,600(mm)
213	78	总质量:	18000(Kg)
214	78	载质量利用系数:	1.27,1.14,1.00,1.02
215	78	整备质量:	11700,12200,12800(Kg)
216	78	额定载质量:	6105,5605,5005(Kg)
217	78	挂车质量:	(Kg)
218	78	半挂鞍座:	
219	78	驾驶室:	
220	78	前排乘客:	3(人)
221	78	额定载客：	(人)
222	78	防抱死系统：	有
223	78	接近角/离去角：	18/11,18/10(°)
224	78	前悬/后悬：	1345/2315,1345/2575,1445/2455,1345/2555(mm)
225	78	轴荷：	6500/11500
226	78	轴距：	4500,4700,5100,5300,3800,5700,4200,3950(mm)
227	78	轴数：	2
228	78	最高车速：	90,89(km/h)
229	78	油耗：	26.43,26.10(L/100Km)
451	85	后轮距：	1860/1860(mm)
230	78	弹簧片数：	11/12+9,8/9+5,10/10+8
231	78	轮胎数：	6(个)
232	78	轮胎规格：	10.00R20 18PR,10.00-20 18PR,275/80R22.5 18PR
233	78	前轮距：	1940,2046,1916(mm)
234	78	后轮距：	1860,1800(mm)
235	78	制动前：	
236	78	制动后：	
237	78	制操前：	
238	78	制操后：	
239	78	转向形式：	方向盘
240	78	起动方式：	
241	78	Vin车辆识别代码:	LNXAEG08×××××××××\nLNXAEG09×××××××××\nLNXAEG04×××××××××\nLNXAEG05×××××××××
242	79	外形尺寸:	12000×2550,2500×3700,3800,3900,3990,3850,3950(mm)
243	79	货箱尺寸:	7500,7700,8000,8200,8400,8500×2400,2450×400,550(mm)
244	79	总质量:	25000(Kg)
245	79	载质量利用系数:	1.28,1.15,1.04
246	79	整备质量:	16230,16900,17550(Kg)
247	79	额定载质量:	8640,7970,7320(Kg)
248	79	挂车质量:	(Kg)
249	79	半挂鞍座:	
250	79	驾驶室:	
251	79	前排乘客:	2(人)
252	79	额定载客：	(人)
253	79	防抱死系统：	有
254	79	接近角/离去角：	16/7(°)
255	79	前悬/后悬：	1525/3300(mm)
256	79	轴荷：	7000/18000(二轴组)
257	79	轴距：	5775+1400,4375+1400,4775+1400(mm)
258	79	轴数：	3
259	79	最高车速：	89(km/h)
260	79	油耗：	32.18,32.37,32.37,32.41,32.18,31.22,30.91,30.91,30.91(L/100Km)
261	79	弹簧片数：	10/12
262	79	轮胎数：	10(个)
263	79	轮胎规格：	11.00R20 18PR,12.00R20 16PR,12R22.5 18PR
264	79	前轮距：	2011,2036,2070(mm)
265	79	后轮距：	1860/1860(mm)
266	79	制动前：	
267	79	制动后：	
268	79	制操前：	
269	79	制操后：	
270	79	转向形式：	方向盘
271	79	起动方式：	
272	79	Vin车辆识别代码:	LZGCL2M4×××××××××\nLZGCL2N4×××××××××\nLZGCL2P4×××××××××\nLZGCL2R4×××××××××\nLZGCL2L4×××××××××
273	80	外形尺寸:	10890,12000×2500,2550×3650,3750,3850,3950(mm)
274	80	货箱尺寸:	7200,7500,7700,8000,8200,8300,8400,8500×2400,2450×400,550,600(mm)
275	80	总质量:	25000(Kg)
276	80	载质量利用系数:	1.32,1.21,1.11,1.03
277	80	整备质量:	16230,16800,17300,17800(Kg)
278	80	额定载质量:	8640,8575,8070,8005,7570,7505,7070,7005(Kg)
279	80	挂车质量:	(Kg)
280	80	半挂鞍座:	
281	80	驾驶室:	
282	80	前排乘客:	2,3(人)
283	80	额定载客：	(人)
284	80	防抱死系统：	有
285	80	接近角/离去角：	23/7,23/8(°)
286	80	前悬/后悬：	1440/3350,1500/3290,1440/3310,1500/3250(mm)
287	80	轴荷：	7000/18000(二轴组)
288	80	轴距：	4350+1350,4750+1350,5400+1350,5700+1350,5900+1350,3600+1350(mm)
289	80	轴数：	3
290	80	最高车速：	89(km/h)
291	80	油耗：	31.70,31.00,31.40,31.40,31.40,30.30,31.10,31.10,29.05,26.59(L/100Km)
292	80	弹簧片数：	9/10,8/13,9/13
293	80	轮胎数：	10(个)
294	80	轮胎规格：	11.00-20 16PR,11.00R20 18PR,12R22.5 18PR,295/80R22.5 18PR
295	80	前轮距：	1940,1965,1980,2020,2040(mm)
296	80	后轮距：	1860/1860(mm)
297	80	制动前：	
298	80	制动后：	
299	80	制操前：	
300	80	制操后：	
301	80	转向形式：	方向盘
302	80	起动方式：	
303	80	Vin车辆识别代码:	LXUX4C44×××××××××\nLXUX4C45×××××××××\nLXUX4D44×××××××××\nLXUX4D45×××××××××\nLXUX4D43×××××××××\nLXUX4C43×××××××××
304	81	外形尺寸:	12000×2550×3750,3850,3950,3990(mm)
305	81	货箱尺寸:	7700,8000,8200,8300,8400,8500×2400,2450×400,550,600(mm)
306	81	总质量:	31000(Kg)
307	81	载质量利用系数:	1.31,1.15,1.01
308	81	整备质量:	20200,21200,22200(Kg)
309	81	额定载质量:	10605,10670,9605,9670,8605,8670(Kg)
310	81	挂车质量:	(Kg)
311	81	半挂鞍座:	
312	81	驾驶室:	
313	81	前排乘客:	3,2(人)
314	81	额定载客：	(人)
315	81	防抱死系统：	有
316	81	接近角/离去角：	15/10(°)
317	81	前悬/后悬：	1400/2750,1470/2680(mm)
318	81	轴荷：	6500/6500/18000(二轴组)
319	81	轴距：	2400+4100+1350,2200+4300+1350(mm)
320	81	轴数：	4
321	81	最高车速：	89(km/h)
322	81	油耗：	36.17,36.17,36.45,36.45,36.78,36.78,36.78,36.78,36.45,36.45,36.45(L/100Km)
323	81	弹簧片数：	11/11/10,12/12/10,11/12/10,9/9/10,10/9/10
324	81	轮胎数：	12(个)
325	81	轮胎规格：	11.00R20,12R22.5,11R22.5
326	81	前轮距：	1963/1963,1950/1950,2050/2050(mm)
327	81	后轮距：	1878/1878(mm)
328	81	制动前：	
329	81	制动后：	
330	81	制操前：	
331	81	制操后：	
332	81	转向形式：	方向盘
333	81	起动方式：	
334	81	Vin车辆识别代码:	LFNFVUMX×××××××××\nLFNFVUNX×××××××××\nLFNFVUPX×××××××××
335	82	外形尺寸:	12000×2550,2500×3950,3850,3750(mm)
336	82	货箱尺寸:	7500,7800,8000,8200,8400,8500×2450,2400×400,550,800(mm)
337	82	总质量:	25000(Kg)
338	82	载质量利用系数:	1.39,1.25,1.11
339	82	整备质量:	16230,16900,17600(Kg)
340	82	额定载质量:	8640,8575,7970,7905,7270,7205(Kg)
341	82	挂车质量:	(Kg)
342	82	半挂鞍座:	
343	82	驾驶室:	
344	82	前排乘客:	2,3(人)
345	82	额定载客：	(人)
346	82	防抱死系统：	有
347	82	接近角/离去角：	21/7(°)
348	82	前悬/后悬：	1400/3450(mm)
349	82	轴荷：	7000/18000(二轴组)
350	82	轴距：	5800+1350,5750+1400(mm)
351	82	轴数：	3
352	82	最高车速：	90(km/h)
353	82	油耗：	31.90(L/100Km)
354	82	弹簧片数：	10/10,9/12,9/13,10/13,9/10
355	82	轮胎数：	10(个)
356	82	轮胎规格：	11.00R20 18PR,12R22.5 18PR,295/80R22.5 18PR
357	82	前轮距：	2032,2050(mm)
358	82	后轮距：	1860/1860(mm)
359	82	制动前：	
360	82	制动后：	
361	82	制操前：	
362	82	制操后：	
363	82	转向形式：	方向盘
364	82	起动方式：	
365	82	Vin车辆识别代码:	LC1HMKBG×××××××××\nLC1HMMBG×××××××××
366	83	外形尺寸:	9000×2500,2550×3650,3750,3850(mm)
367	83	货箱尺寸:	5000,5200,5400,5600,5800,6100×2400,2450×550(mm)
368	83	总质量:	18000(Kg)
369	83	载质量利用系数:	1.00,1.14,1.27
370	83	整备质量:	12800,12200,11700(Kg)
371	83	额定载质量:	5070,5005,5670,5605,6170,6105(Kg)
372	83	挂车质量:	(Kg)
373	83	半挂鞍座:	
374	83	驾驶室:	
375	83	前排乘客:	2,3(人)
376	83	额定载客：	(人)
377	83	防抱死系统：	有
378	83	接近角/离去角：	16/10(°)
379	83	前悬/后悬：	1250/2650,1450/2450(mm)
380	83	轴荷：	6500/11500
381	83	轴距：	5100(mm)
382	83	轴数：	2
383	83	最高车速：	88(km/h)
384	83	油耗：	25.85(L/100Km)
385	83	弹簧片数：	9/10+8
386	83	轮胎数：	6(个)
387	83	轮胎规格：	10.00R20 18PR
388	83	前轮距：	1910(mm)
389	83	后轮距：	1860(mm)
390	83	制动前：	
391	83	制动后：	
392	83	制操前：	
393	83	制操后：	
394	83	转向形式：	方向盘
395	83	起动方式：	
396	83	Vin车辆识别代码:	LXP2EE03×××××××××
397	84	外形尺寸:	8255,7790,7325,8560,9000×2550,2500×3750,3650,3550(mm)
398	84	货箱尺寸:	4800,4700,4600,4500,4400,4300,4200,4100,3950,5000,5100,5200,5400,5600,5800,6000,6100,6200,6300×2450,2400×600,550(mm)
399	84	总质量:	18000(Kg)
400	84	载质量利用系数:	1.09,1.25,1.40
401	84	整备质量:	12080,11500,11000(Kg)
402	84	额定载质量:	5725,6305,6805(Kg)
403	84	挂车质量:	(Kg)
404	84	半挂鞍座:	
405	84	驾驶室:	
406	84	前排乘客:	3(人)
407	84	额定载客：	(人)
408	84	防抱死系统：	有
409	84	接近角/离去角：	17/11,17/12(°)
410	84	前悬/后悬：	1280/2475,1280/2310,1280/2145,1280/2580,1280/2720(mm)
411	84	轴荷：	6500/11500
412	84	轴距：	3900,4200,4500,4700,5000(mm)
413	84	轴数：	2
414	84	最高车速：	90(km/h)
415	84	油耗：	25.88,25.88,25.88(L/100Km)
416	84	弹簧片数：	11/11+9,3/3+3,3/11+9,10/11+9,10/11+8
417	84	轮胎数：	6(个)
418	84	轮胎规格：	10.00R20 18PR
419	84	前轮距：	1920,1950,1980,1810,1900(mm)
420	84	后轮距：	1800,1860,1720(mm)
421	84	制动前：	
422	84	制动后：	
423	84	制操前：	
424	84	制操后：	
425	84	转向形式：	方向盘
426	84	起动方式：	
427	84	Vin车辆识别代码:	LJVH8JDD×××××××××\nLJVA8JDD×××××××××\nLJVH8JDF×××××××××\nLJVA8JDF×××××××××\nLJVH8JDG×××××××××\nLJVA8JDG×××××××××\nLJVH8JDB×××××××××\nLJVA8JDB×××××××××\nLJVH8JDC×××××××××\nLJVA8JDC×××××××××\nLJVH8JDH×××××××××\nLJVA8JDH×××××××××\nLJVH8JDE×××××××××\nLJVA8JDE×××××××××
428	85	外形尺寸:	12000×2550,2500×3650,3750,3850,3950(mm)
429	85	货箱尺寸:	7500,7800,8000,8200,8400,8500×2450,2400×400,550,800(mm)
430	85	总质量:	25000(Kg)
431	85	载质量利用系数:	1.31,1.17,1.01
432	85	整备质量:	17200,17900,18800(Kg)
433	85	额定载质量:	7670,7605,6970,6905,6070,6005(Kg)
434	85	挂车质量:	(Kg)
435	85	半挂鞍座:	
436	85	驾驶室:	
437	85	前排乘客:	2,3(人)
438	85	额定载客：	(人)
439	85	防抱死系统：	有
440	85	接近角/离去角：	21/7(°)
441	85	前悬/后悬：	1400/3450(mm)
442	85	轴荷：	7000/18000(二轴组)
443	85	轴距：	5800+1350,5750+1400(mm)
444	85	轴数：	3
445	85	最高车速：	90(km/h)
446	85	油耗：	31.90,32.12(L/100Km)
447	85	弹簧片数：	10/10,9/12,9/13,10/13,9/10
448	85	轮胎数：	10(个)
449	85	轮胎规格：	11.00R20 18PR,12R22.5 18PR,295/80R22.5 18PR
450	85	前轮距：	2032,2050(mm)
452	85	制动前：	
453	85	制动后：	
454	85	制操前：	
455	85	制操后：	
456	85	转向形式：	方向盘
457	85	起动方式：	
458	85	Vin车辆识别代码:	LC1HMKBG×××××××××\nLC1HMMBG×××××××××
459	86	外形尺寸:	10050,10700,11950×2500,2550×3750,3850,3950(mm)
460	86	货箱尺寸:	6500,6800,7200,7500,7800,8000,8200,8500×2300,2400,2450×550,800(mm)
461	86	总质量:	25000(Kg)
462	86	载质量利用系数:	1.00,1.04
463	86	整备质量:	17350,16250(Kg)
464	86	额定载质量:	7455,7520,8555,8620(Kg)
465	86	挂车质量:	(Kg)
466	86	半挂鞍座:	
467	86	驾驶室:	
468	86	前排乘客:	3,2(人)
469	86	额定载客：	(人)
470	86	防抱死系统：	有
471	86	接近角/离去角：	28/21,28/18,28/16(°)
472	86	前悬/后悬：	1250/3100,1250/3350,1250/3500,1450/3300,1410/3340,1450/3150,1410/3190,1450/2900,1410/2940(mm)
473	86	轴荷：	7000/18000(二轴组)
474	86	轴距：	4350+1350,4750+1350,5850+1350,5350+1350(mm)
475	86	轴数：	3
476	86	最高车速：	88(km/h)
477	86	油耗：	32.4,32.4,32.2(L/100Km)
478	86	弹簧片数：	9/13,13/10,3/10,9/10,13/13,3/13
479	86	轮胎数：	10(个)
480	86	轮胎规格：	11.00R20 18PR
481	86	前轮距：	1910,1970,2020,2050,1950(mm)
482	86	后轮距：	1820/1820,1860/1860(mm)
483	86	制动前：	
484	86	制动后：	
485	86	制操前：	
486	86	制操后：	
487	86	转向形式：	方向盘
488	86	起动方式：	
489	86	Vin车辆识别代码:	LGHXLH4S×××××××××\nLGHXLJ4S×××××××××\nLGHXLH4U×××××××××\nLGHXLJ4U×××××××××\nLGHXLH4X×××××××××\nLGHXLJ4X×××××××××\nLGHXLH4W×××××××××\nLGHXLJ4W×××××××××\nLGHXLD4S×××××××××\nLGHXLD4U×××××××××\nLGHXLD4X×××××××××\nLGHXLD4W×××××××××
490	87	外形尺寸:	12000,10750×2500,2550×3800,3900,3990(mm)
491	87	货箱尺寸:	7500,7700,8200,8500×2300,2400,2450×400,550,800(mm)
492	87	总质量:	31000(Kg)
493	87	载质量利用系数:	1.00,1.00
494	87	整备质量:	22500,21000(Kg)
495	87	额定载质量:	8370,8305,9870,9805(Kg)
496	87	挂车质量:	(Kg)
497	87	半挂鞍座:	
498	87	驾驶室:	
499	87	前排乘客:	2,3(人)
500	87	额定载客：	(人)
501	87	防抱死系统：	有
502	87	接近角/离去角：	17/11(°)
503	87	前悬/后悬：	1250/2900,1410/2740,1500/2650,1250/2850,1410/2690,1500/2600(mm)
504	87	轴荷：	6500/6500/18000(二轴组)
505	87	轴距：	1850+3200+1350,1850+3600+1350,2150+4400+1350,2100+3200+1350,2100+4400+1350,2250+4100+1350,1850+4600+1350(mm)
506	87	轴数：	4
507	87	最高车速：	88(km/h)
508	87	油耗：	37.4,37.2,37.2(L/100Km)
509	87	弹簧片数：	9/9/13
510	87	轮胎数：	12(个)
511	87	轮胎规格：	11.00R20,11.00R20 16PR,11.00R20 18PR
512	87	前轮距：	1970/1970,2040/2040,1950/1950(mm)
513	87	后轮距：	1860/1860(mm)
514	87	制动前：	
515	87	制动后：	
516	87	制操前：	
517	87	制操后：	
518	87	转向形式：	方向盘
519	87	起动方式：	
520	87	Vin车辆识别代码:	LGHXPH6V×××××××××\nLGHXPJ6V×××××××××\nLGHXPH6W×××××××××\nLGHXPJ6W×××××××××\nLGHXPH6X×××××××××\nLGHXPJ6X×××××××××
521	88	外形尺寸:	12000,10800×2550,2500×3850,3750,3650(mm)
522	88	货箱尺寸:	7700,8200,8400,8500,7300,7200,7100,7000,6800,6500×2450,2400×550,800(mm)
523	88	总质量:	25000(Kg)
524	88	载质量利用系数:	1.07,1.01,1.15
525	88	整备质量:	16250,17000,17800(Kg)
526	88	额定载质量:	8620,8555,7870,7805,7070,7005(Kg)
527	88	挂车质量:	(Kg)
528	88	半挂鞍座:	
529	88	驾驶室:	
530	88	前排乘客:	2,3(人)
531	88	额定载客：	(人)
532	88	防抱死系统：	有
533	88	接近角/离去角：	20/11(°)
534	88	前悬/后悬：	1525/3275,1525/3125(mm)
535	88	轴荷：	7000/18000(二轴组)
536	88	轴距：	5850+1350,4800+1350(mm)
537	88	轴数：	3
538	88	最高车速：	89(km/h)
539	88	油耗：	32.1,32.13(L/100Km)
540	88	弹簧片数：	11/10,11/13,9/10,3/4
541	88	轮胎数：	10(个)
542	88	轮胎规格：	11.00-20 18PR,11.00R20 18PR,12R22.5 18PR
543	88	前轮距：	2050(mm)
544	88	后轮距：	1860/1860(mm)
545	88	制动前：	
546	88	制动后：	
547	88	制操前：	
548	88	制操后：	
549	88	转向形式：	方向盘
550	88	起动方式：	
551	88	Vin车辆识别代码:	LNXAEL0B×××××××××\nLNXAEL08×××××××××\nLNXAEL09×××××××××
552	89	外形尺寸:	8530,9000×2500,2550×3650,3750,3850(mm)
553	89	货箱尺寸:	5200,5800,6080,6100,5000,4800,5600×2300,2400,2450×400,550(mm)
554	89	总质量:	18000(Kg)
555	89	载质量利用系数:	1.14,1.05
556	89	整备质量:	11580,12580(Kg)
557	89	额定载质量:	6225,6290,5225,5290(Kg)
558	89	挂车质量:	(Kg)
559	89	半挂鞍座:	
560	89	驾驶室:	
561	89	前排乘客:	3,2(人)
562	89	额定载客：	(人)
563	89	防抱死系统：	有
564	89	接近角/离去角：	28/12(°)
565	89	前悬/后悬：	1250/2580,1250/2650,1450/2450,1410/2490,1450/2380,1410/2420(mm)
566	89	轴荷：	6500/11500
567	89	轴距：	3950,4200,4500,4700,5100,4400(mm)
568	89	轴数：	2
569	89	最高车速：	88(km/h)
570	89	油耗：	25.0,24.5,24.5,24.1,24.3,26.39(L/100Km)
571	89	弹簧片数：	9/11+8,3/4+3,9/10+8
572	89	轮胎数：	6(个)
573	89	轮胎规格：	10.00R20 18PR,295/80R22.5 16PR,275/80R22.5 18PR
574	89	前轮距：	1875,1910,1950,1965,1970,2020,2050,1935(mm)
575	89	后轮距：	1820,1870,1860(mm)
576	89	制动前：	
577	89	制动后：	
578	89	制操前：	
579	89	制操后：	
580	89	转向形式：	方向盘
581	89	起动方式：	
582	89	Vin车辆识别代码:	LGHXHH1H×××××××××\nLGHXHH1K×××××××××\nLGHXHH1L×××××××××\nLGHXHH1M×××××××××\nLGHXHH1P×××××××××\nLGHXHD1H×××××××××\nLGHXHD1K×××××××××\nLGHXHD1L×××××××××\nLGHXHD1M×××××××××\nLGHXHD1P×××××××××\nLGHXHG1H×××××××××\nLGHXHG1K×××××××××\nLGHXHG1L×××××××××\nLGHXHG1M×××××××××\nLGH
583	90	外形尺寸:	10800,12000,11950,10050,10210×2550×3750,3850,3950(mm)
584	90	货箱尺寸:	6500,7200,7800,6500,7200,7800,8200,8400,8500×2400,2450×400,550,800(mm)
585	90	总质量:	25000(Kg)
586	90	载质量利用系数:	1.29,1.00
587	90	整备质量:	17200,18800(Kg)
588	90	额定载质量:	7670,6070,7605,6005(Kg)
589	90	挂车质量:	(Kg)
590	90	半挂鞍座:	
591	90	驾驶室:	
592	90	前排乘客:	2,3(人)
593	90	额定载客：	(人)
594	90	防抱死系统：	有
595	90	接近角/离去角：	19/18,19/16(°)
596	90	前悬/后悬：	1410/3290,1410/3390,1250/2350,1410/3340,1250/3500,1250/3450,1250/3100,1410/3100(mm)
597	90	轴荷：	7000/18000(二轴组)
598	90	轴距：	4750+1350,5850+1350,4350+1350(mm)
599	90	轴数：	3
600	90	最高车速：	88(km/h)
601	90	油耗：	32.4,30.3,30.2,32.4,31.71(L/100Km)
602	90	弹簧片数：	9/13,13/10,3/10,9/12,3/12,3/13,9/10,13/10,13/12
603	90	轮胎数：	10(个)
604	90	轮胎规格：	11.00R20 18PR
605	90	前轮距：	2040,1960(mm)
606	90	后轮距：	1860/1860(mm)
607	90	制动前：	
608	90	制动后：	
609	90	制操前：	
610	90	制操后：	
611	90	转向形式：	方向盘
612	90	起动方式：	
613	90	Vin车辆识别代码:	LGHXLH4U×××××××××\nLGHXLH4X×××××××××\nLGHXLJ4X×××××××××\nLGHXLJ4U×××××××××\nLGHXLH4S×××××××××\nLGHXLJ4S×××××××××
614	91	外形尺寸:	10890,12000×2500,2550×3950,3850,3750(mm)
615	91	货箱尺寸:	7200,7500,7700,8200,8400,8500×2400,2450×400,550,800(mm)
616	91	总质量:	24490(Kg)
617	91	载质量利用系数:	1.22,1.07
618	91	整备质量:	16300,17100(Kg)
619	91	额定载质量:	8060,7995,7260,7195(Kg)
620	91	挂车质量:	(Kg)
621	91	半挂鞍座:	
622	91	驾驶室:	
623	91	前排乘客:	2,3(人)
624	91	额定载客：	(人)
625	91	防抱死系统：	有
626	91	接近角/离去角：	23/13(°)
627	91	前悬/后悬：	1440/3350,1440/3310(mm)
628	91	轴荷：	6490/18000(二轴组)
629	91	轴距：	4350+1350,4750+1350,5400+1350,5700+1350,5900+1350(mm)
630	91	轴数：	3
631	91	最高车速：	89(km/h)
632	91	油耗：	30.5(L/100Km)
633	91	弹簧片数：	9/10,8/13,9/13
634	91	轮胎数：	10(个)
635	91	轮胎规格：	10.00-20 18PR,10.00R20 18PR,11.00-20 16PR,11.00R20 18PR
636	91	前轮距：	1940,1965,1980,2020(mm)
637	91	后轮距：	1860/1860(mm)
638	91	制动前：	
639	91	制动后：	
640	91	制操前：	
641	91	制操后：	
642	91	转向形式：	方向盘
643	91	起动方式：	
644	91	Vin车辆识别代码:	LXUX4C44×××××××××\nLXUX4C45×××××××××\nLXUX4D44×××××××××\nLXUX4D45×××××××××
645	92	外形尺寸:	12000×2500,2550×3750,3850,3950,3990(mm)
646	92	货箱尺寸:	7700,8200,8400,8500×2300,2400,2450×400,550,600,800(mm)
647	92	总质量:	31000(Kg)
648	92	载质量利用系数:	1.02,1.21
649	92	整备质量:	20600,19300(Kg)
650	92	额定载质量:	10270,11570(Kg)
651	92	挂车质量:	(Kg)
652	92	半挂鞍座:	
653	92	驾驶室:	
654	92	前排乘客:	2(人)
655	92	额定载客：	(人)
656	92	防抱死系统：	有
657	92	接近角/离去角：	21/11(°)
658	92	前悬/后悬：	1525/2400,1525/2450,1525/2550(mm)
659	92	轴荷：	6500/6500/18000(二轴组)
660	92	轴距：	2100+4575+1400,2100+4575+1350,2200+4475+1400,2200+4475+1350,2100+4475+1350(mm)
661	92	轴数：	4
662	92	最高车速：	89(km/h)
663	92	油耗：	37.12(L/100Km)
769	96	外形尺寸:	10900,12000×2550×3950,3850,3750(mm)
664	92	弹簧片数：	14/13/10,14/14/12,3/3/5,9/9/10,11/11/10,2/2/4,13/13/12,4/4/5,5/5/5,4/4/12,5/5/12,左14右13/左14右13/12,左13右13/左13右13/12
665	92	轮胎数：	12(个)
666	92	轮胎规格：	12.00R20 18PR,11.00R20 18PR,12R22.5 18PR
667	92	前轮距：	2058/2058,2011/2011,2036/2036,2070/2070,2022/2022(mm)
668	92	后轮距：	1860/1860(mm)
669	92	制动前：	
670	92	制动后：	
671	92	制操前：	
672	92	制操后：	
673	92	转向形式：	方向盘
674	92	起动方式：	
675	92	Vin车辆识别代码:	LZGCR2R6×××××××××\nLZGCR2P6×××××××××\nLZGCR2N6×××××××××\nLZGCR2U6×××××××××
676	93	外形尺寸:	12000,10800×2500,2550×3750,3850,3950(mm)
677	93	货箱尺寸:	7700,8200,8400,8500,6500,6800,7000,7200,7400,7600,6600,6700,6900,7100,7300,7500,7800,7900,8000,8100,8300×2400,2450×400,550,600,800(mm)
678	93	总质量:	25000(Kg)
679	93	载质量利用系数:	1.38,1.11,1.46,1.57
680	93	整备质量:	16800,18100,16460(Kg)
681	93	额定载质量:	8070,8005,6770,6705,8410,8345(Kg)
682	93	挂车质量:	(Kg)
683	93	半挂鞍座:	
684	93	驾驶室:	
685	93	前排乘客:	2,3(人)
686	93	额定载客：	(人)
687	93	防抱死系统：	有
688	93	接近角/离去角：	25/12(°)
689	93	前悬/后悬：	1450/3450,1450/3300(mm)
690	93	轴荷：	7000/18000(二轴组)
691	93	轴距：	5800+1300,3600+1300,3600+1350,3700+1300,3700+1350,3800+1300,3800+1350,4750+1300(mm)
692	93	轴数：	3
693	93	最高车速：	85(km/h)
694	93	油耗：	32.4,32.4,31.57,31.76(L/100Km)
695	93	弹簧片数：	9/10,10/12,12/12,10/10,9/12,3/4
696	93	轮胎数：	10(个)
697	93	轮胎规格：	11.00R20,11.00R20 18PR,12R22.5 18PR,12.00R20 18PR
698	93	前轮距：	1970,1900,1940,2022(mm)
699	93	后轮距：	1860/1860,1767/1767(mm)
700	93	制动前：	
701	93	制动后：	
702	93	制操前：	
703	93	制操后：	
704	93	转向形式：	方向盘
705	93	起动方式：	
706	93	Vin车辆识别代码:	LZGCL2M4×××××××××\nLZGCL2N4×××××××××\nLZGCL2L4×××××××××
707	94	外形尺寸:	8400,9000×2550,2500×3850,3750,3650(mm)
708	94	货箱尺寸:	5000,5200,5600,5800,6080,6100,6200,6300×2400,2450×550,600(mm)
709	94	总质量:	18000(Kg)
710	94	载质量利用系数:	1.57,1.28
711	94	整备质量:	11200,12090(Kg)
712	94	额定载质量:	6605,6670,5715,5780(Kg)
713	94	挂车质量:	(Kg)
714	94	半挂鞍座:	
715	94	驾驶室:	
716	94	前排乘客:	2,3(人)
717	94	额定载客：	(人)
718	94	防抱死系统：	有
719	94	接近角/离去角：	21/13(°)
720	94	前悬/后悬：	1440/2460,1500/2400,1370/2530,1300/2600,1300/2160,1440/2160,1300/2310,1440/2310(mm)
721	94	轴荷：	6500/11500
722	94	轴距：	3800,3950,4200,4500,4700,5100,5600,6000(mm)
723	94	轴数：	2
724	94	最高车速：	89(km/h)
725	94	油耗：	25.9(L/100Km)
726	94	弹簧片数：	8/10+7,8/10+8,11/11+10,3/4+3
727	94	轮胎数：	6(个)
728	94	轮胎规格：	10.00R20 18PR,275/80R22.5 18PR,10.00R20 16PR,11.00R20 16PR,11.00R20 18PR,295/80R22.5,295/60R22.5 18PR
729	94	前轮距：	1810,1880,1940,1965,1910,1980,2005,2020,2040(mm)
730	94	后轮距：	1800,1820,1860,1750,1840(mm)
731	94	制动前：	
732	94	制动后：	
733	94	制操前：	
734	94	制操后：	
735	94	转向形式：	方向盘
736	94	起动方式：	
737	94	Vin车辆识别代码:	LXUX2B12×××××××××\nLXUX2B13×××××××××\nLXUX2C12×××××××××\nLXUX2C13×××××××××\nLXUX2B14×××××××××\nLXUX2C14×××××××××\nLXUC2B12×××××××××\nLXUC2B13×××××××××\nLXUC2B14×××××××××\nLXUC2C12×××××××××\nLXUC2C13×××××××××\nLXUC2C14×××××××××
738	95	外形尺寸:	9000×2500,2550×3800,3700(mm)
739	95	货箱尺寸:	5200,5650,5800,6050,6100×2400,2450×550,600(mm)
740	95	总质量:	18000(Kg)
741	95	载质量利用系数:	1.04,1.00,1.07,1.09
742	95	整备质量:	12090,12800(Kg)
743	95	额定载质量:	5780,5715,5005,5070(Kg)
744	95	挂车质量:	(Kg)
745	95	半挂鞍座:	
746	95	驾驶室:	
747	95	前排乘客:	3,2(人)
748	95	额定载客：	(人)
749	95	防抱死系统：	有
750	95	接近角/离去角：	16/9(°)
751	95	前悬/后悬：	1340/2560(mm)
752	95	轴荷：	6500/11500
753	95	轴距：	5100,4000,4200(mm)
754	95	轴数：	2
755	95	最高车速：	89(km/h)
756	95	油耗：	26.3,26.3,26.53,26.53,26.58(L/100Km)
757	95	弹簧片数：	10/9+6,3/4+3,9/9+6,7/7+3,7/7+6
758	95	轮胎数：	6(个)
759	95	轮胎规格：	10.00R20 18PR,295/80R22.5 18PR
760	95	前轮距：	1935(mm)
761	95	后轮距：	1860(mm)
762	95	制动前：	
763	95	制动后：	
764	95	制操前：	
765	95	制操后：	
766	95	转向形式：	方向盘
767	95	起动方式：	
768	95	Vin车辆识别代码:	LZGCD2K1×××××××××\nLZGCD2J1×××××××××\nLZGCD2H1×××××××××
770	96	货箱尺寸:	7400,7700,8200,8400,8500×2400,2450×550,800(mm)
771	96	总质量:	25000(Kg)
772	96	载质量利用系数:	1.26,1.00
773	96	整备质量:	16250,17650(Kg)
774	96	额定载质量:	8620,8555,7220,7155(Kg)
775	96	挂车质量:	(Kg)
776	96	半挂鞍座:	
777	96	驾驶室:	
778	96	前排乘客:	2,3(人)
779	96	额定载客：	(人)
780	96	防抱死系统：	有
781	96	接近角/离去角：	22/10(°)
782	96	前悬/后悬：	1400/3350,1400/3450(mm)
783	96	轴荷：	7000/18000(二轴组)
784	96	轴距：	4350+1350,4800+1350,5300+1350,5800+1350(mm)
785	96	轴数：	3
786	96	最高车速：	89(km/h)
787	96	油耗：	30.74,30.74,30.74,29.55,29.55(L/100Km)
788	96	弹簧片数：	12/10,3/10,10/10
789	96	轮胎数：	10(个)
790	96	轮胎规格：	11.00R20,12R22.5,295/80R22.5,315/70R22.5
791	96	前轮距：	1928,1950,1988(mm)
792	96	后轮距：	1878/1878(mm)
793	96	制动前：	
794	96	制动后：	
795	96	制操前：	
796	96	制操后：	
797	96	转向形式：	方向盘
798	96	起动方式：	
799	96	Vin车辆识别代码:	LFNDRUMP×××××××××\nLFNDRUMS×××××××××\nLFNDRUNP×××××××××\nLFNDRUNS×××××××××\nLFNDRUMV×××××××××\nLFNDRUMX×××××××××\nLFNDRUNV×××××××××\nLFNDRUNX×××××××××\nLFNDRULP×××××××××\nLFNDRULS×××××××××\nLFNDRULV×××××××××\nLFNDRULX×××××××××\nLFNDRUPP×××××××××\nLFNDRUPS×××××××××\nLFN
800	97	外形尺寸:	8220,8260,8380,9000×2450,2500,2550×3550,3650,3750,3850(mm)
801	97	货箱尺寸:	4500,4600,4700,4800,5000,5200,5400,5800,6050,6100,6200,6300,6400,6500,5600×2300,2400,2450×400,550(mm)
802	97	总质量:	18000(Kg)
803	97	载质量利用系数:	1.57,1.28
804	97	整备质量:	11200,12080(Kg)
805	97	额定载质量:	6670,6605,5790,5725(Kg)
806	97	挂车质量:	(Kg)
807	97	半挂鞍座:	
808	97	驾驶室:	
809	97	前排乘客:	2,3(人)
810	97	额定载客：	(人)
811	97	防抱死系统：	有
812	97	接近角/离去角：	19/16,17/15(°)
813	97	前悬/后悬：	1250/2470,1285/2475,1410/2350,1410/2470,1250/2650,1285/2615,1410/2490,1300/2460,1300/2600(mm)
814	97	轴荷：	6500/11500
815	97	轴距：	4500,5100,4700,5600,5800,7150,5300,4200(mm)
816	97	轴数：	2
817	97	最高车速：	88(km/h)
818	97	油耗：	25.3,24.1,24.3,24.3,20.01,24.9,25.4,26.39(L/100Km)
819	97	弹簧片数：	9/11+8,3/4+3,9/10+8,3/3+3
820	97	轮胎数：	6(个)
821	97	轮胎规格：	10.00R20 18PR,295/80R22.5 16PR,295/60R22.5 18PR
822	97	前轮距：	1960,1860,1900,1940,1920,1880(mm)
823	97	后轮距：	1860,1820,1750(mm)
824	97	制动前：	
825	97	制动后：	
826	97	制操前：	
827	97	制操后：	
828	97	转向形式：	方向盘
829	97	起动方式：	
830	97	Vin车辆识别代码:	LGHXHH1L×××××××××\nLGHXHH1P×××××××××\nLGHXHG1L×××××××××\nLGHXHG1P×××××××××\nLGHXHD1L×××××××××\nLGHXHD1P×××××××××\nLGHXHH1M×××××××××\nLGHXHH1S×××××××××\nLGHXHH1T×××××××××\nLGHXHH1X×××××××××\nLGHXHD1M×××××××××\nLGHXHD1S×××××××××\nLGHXHD1T×××××××××\nLGHXHD1X×××××××××\nLGH
831	98	外形尺寸:	8220,8260,8380,9000×2450,2500,2550×3550,3650,3750,3850(mm)
832	98	货箱尺寸:	4500,4600,4700,4800,5000,5200,5400,5800,6050,6100,6200,6300,6400,6500,5600×2300,2400,2450×400,550(mm)
833	98	总质量:	18000(Kg)
834	98	载质量利用系数:	1.14,1.00,1.02
835	98	整备质量:	12200,12800,11700(Kg)
836	98	额定载质量:	5670,5605,5070,5005,6105,6170(Kg)
837	98	挂车质量:	(Kg)
838	98	半挂鞍座:	
839	98	驾驶室:	
840	98	前排乘客:	2,3(人)
841	98	额定载客：	(人)
842	98	防抱死系统：	有
843	98	接近角/离去角：	19/16,17/15(°)
844	98	前悬/后悬：	1250/2470,1285/2475,1410/2350,1410/2470,1250/2650,1285/2615,1410/2490,1300/2460,1300/2600(mm)
845	98	轴荷：	6500/11500
846	98	轴距：	4500,5100,4700,5600,5800,7150,5300,4200(mm)
847	98	轴数：	2
848	98	最高车速：	88(km/h)
849	98	油耗：	25.3,24.1,24.3,24.3,20.01,24.9,25.4,26.39(L/100Km)
850	98	弹簧片数：	9/11+8,3/4+3,9/10+8,3/3+3
851	98	轮胎数：	6(个)
852	98	轮胎规格：	10.00R20 18PR,295/80R22.5 16PR,295/60R22.5 18PR
853	98	前轮距：	1960,1860,1900,1940,1920,1880(mm)
854	98	后轮距：	1860,1820,1750(mm)
855	98	制动前：	
856	98	制动后：	
857	98	制操前：	
858	98	制操后：	
859	98	转向形式：	方向盘
860	98	起动方式：	
861	98	Vin车辆识别代码:	LGHXHH1L×××××××××\nLGHXHH1P×××××××××\nLGHXHG1L×××××××××\nLGHXHG1P×××××××××\nLGHXHD1L×××××××××\nLGHXHD1P×××××××××\nLGHXHH1M×××××××××\nLGHXHH1S×××××××××\nLGHXHH1T×××××××××\nLGHXHH1X×××××××××\nLGHXHD1M×××××××××\nLGHXHD1S×××××××××\nLGHXHD1T×××××××××\nLGHXHD1X×××××××××\nLGH
862	99	外形尺寸:	12000×2500,2550×3650,3750,3850,3980,3950(mm)
863	99	货箱尺寸:	7500,7700,7900,8100,8200,8400,8500×2400,2450×400,550,600(mm)
864	99	总质量:	31000(Kg)
865	99	载质量利用系数:	1.27,1.13,1.00
866	99	整备质量:	20300,21200,22150(Kg)
867	99	额定载质量:	10570,9670,8720(Kg)
868	99	挂车质量:	(Kg)
869	99	半挂鞍座:	
870	99	驾驶室:	
871	99	前排乘客:	2(人)
872	99	额定载客：	(人)
873	99	防抱死系统：	有
874	99	接近角/离去角：	21/10(°)
875	99	前悬/后悬：	1525/2400,1525/2450,1525/2550(mm)
876	99	轴荷：	6500/6500/18000(二轴组)
877	99	轴距：	2100+4575+1400,2100+4575+1350,2200+4475+1400,2200+4475+1350,2100+4475+1350(mm)
878	99	轴数：	4
879	99	最高车速：	89(km/h)
880	99	油耗：	37.12,37.12,37.12(L/100Km)
881	99	弹簧片数：	14/13/10,14/14/12,3/3/5,9/9/10,11/11/10,2/2/4,13/13/12,4/4/5,5/5/5,4/4/12,5/5/12,左14右13/左14右13/12,左13右13/左13右13/12
882	99	轮胎数：	12(个)
883	99	轮胎规格：	12.00R20 18PR,11.00R20 18PR,12R22.5 18PR
884	99	前轮距：	2058/2058,2011/2011,2036/2036,2070/2070,2022/2022(mm)
885	99	后轮距：	1860/1860(mm)
886	99	制动前：	
887	99	制动后：	
888	99	制操前：	
889	99	制操后：	
890	99	转向形式：	方向盘
891	99	起动方式：	
892	99	Vin车辆识别代码:	LZGCR2R6×××××××××\nLZGCR2P6×××××××××\nLZGCR2N6×××××××××\nLZGCR2U6×××××××××
893	100	外形尺寸:	10300×2500,2550×3650,3750,3850(mm)
894	100	货箱尺寸:	6500,6800,7100×2400,2450×550,600(mm)
895	100	总质量:	25000(Kg)
896	100	载质量利用系数:	1.21,1.50
897	100	整备质量:	14200,15500(Kg)
898	100	额定载质量:	10670,10605,9370,9305(Kg)
899	100	挂车质量:	(Kg)
900	100	半挂鞍座:	
901	100	驾驶室:	
902	100	前排乘客:	2,3(人)
903	100	额定载客：	(人)
904	100	防抱死系统：	有
905	100	接近角/离去角：	15/12,15/13(°)
906	100	前悬/后悬：	1450/2350,1450/2450(mm)
907	100	轴荷：	7000/18000(二轴组)
908	100	轴距：	5100+1300,5200+1300(mm)
909	100	轴数：	3
910	100	最高车速：	88(km/h)
911	100	油耗：	28.09,32.39(L/100Km)
912	100	弹簧片数：	9/10+8/7+-
913	100	轮胎数：	8(个)
914	100	轮胎规格：	11.00R20 18PR,10.00R20 18PR
915	100	前轮距：	1960(mm)
916	100	后轮距：	1860/1960(mm)
917	100	制动前：	
918	100	制动后：	
919	100	制操前：	
920	100	制操后：	
921	100	转向形式：	方向盘
922	100	起动方式：	
923	100	Vin车辆识别代码:	LXP2GF24×××××××××\nLXP2GG24×××××××××
924	101	外形尺寸:	10050,10700,10800,11950,12000×2500,2550×3750,3850,3950(mm)
925	101	货箱尺寸:	6500,7200,7800,8400,8500,8200×2300,2400,2450×400,550,800(mm)
926	101	总质量:	25000(Kg)
927	101	载质量利用系数:	1.00,1.00,1.00,1.06
928	101	整备质量:	17600,18800,17200(Kg)
929	101	额定载质量:	7270,7205,6070,6005,7605,7670(Kg)
930	101	挂车质量:	(Kg)
931	101	半挂鞍座:	
932	101	驾驶室:	
933	101	前排乘客:	2,3(人)
934	101	额定载客：	(人)
935	101	防抱死系统：	有
936	101	接近角/离去角：	28/21,28/18,28/16,25/18,25/21(°)
937	101	前悬/后悬：	1250/3100,1410/2940,1450/2900,1250/3350,1410/3190,1450/3150,1410/3290,1450/3250,1250/3500,1410/3390,1450/3350,1410/3340,1450/3300(mm)
938	101	轴荷：	7000/18000(二轴组)
939	101	轴距：	4350+1350,4750+1350,5850+1350,5350+1350(mm)
940	101	轴数：	3
941	101	最高车速：	88(km/h)
942	101	油耗：	32.4,32.4(L/100Km)
943	101	弹簧片数：	9/13,13/10,3/10,9/10,13/13,3/13
944	101	轮胎数：	10(个)
945	101	轮胎规格：	11.00R20 18PR
946	101	前轮距：	1910,1970,2020,2050,1950(mm)
947	101	后轮距：	1820/1820,1860/1860(mm)
948	101	制动前：	
949	101	制动后：	
950	101	制操前：	
951	101	制操后：	
952	101	转向形式：	方向盘
953	101	起动方式：	
954	101	Vin车辆识别代码:	LGHXLH4S×××××××××\nLGHXLJ4S×××××××××\nLGHXLH4U×××××××××\nLGHXLJ4U×××××××××\nLGHXLH4X×××××××××\nLGHXLJ4X×××××××××\nLGHXLH4W×××××××××\nLGHXLJ4W×××××××××\nLGHXLD4S×××××××××\nLGHXLD4U×××××××××\nLGHXLD4X×××××××××\nLGHXLD4W×××××××××
955	102	外形尺寸:	10700,10800,11950,12000,10050,10210×2500,2550×3750,3850,3950(mm)
956	102	货箱尺寸:	6500,7200,7800,8400,8500,8200×2400,2450×400,550,800(mm)
957	102	总质量:	25000(Kg)
958	102	载质量利用系数:	1.09,1.03
959	102	整备质量:	16230,17600(Kg)
960	102	额定载质量:	8640,8575,7270,7205(Kg)
961	102	挂车质量:	(Kg)
962	102	半挂鞍座:	
963	102	驾驶室:	
964	102	前排乘客:	2,3(人)
965	102	额定载客：	(人)
966	102	防抱死系统：	有
967	102	接近角/离去角：	19/18,19/16(°)
968	102	前悬/后悬：	1250/3350,1410/3190,1410/3290,1250/3500,1410/3390,1250/3450,1410/3340,1250/3100,1410/3100(mm)
969	102	轴荷：	7000/18000(二轴组)
970	102	轴距：	4750+1350,5850+1350,4350+1350(mm)
971	102	轴数：	3
972	102	最高车速：	88(km/h)
973	102	油耗：	32.4,30.3,30.2,32.4,31.71(L/100Km)
974	102	弹簧片数：	9/13,13/10,3/10,9/12,3/12,3/13,9/10,13/10,13/12
975	102	轮胎数：	10(个)
976	102	轮胎规格：	11.00R20 18PR
977	102	前轮距：	2040,1960(mm)
978	102	后轮距：	1860/1860(mm)
979	102	制动前：	
980	102	制动后：	
981	102	制操前：	
982	102	制操后：	
983	102	转向形式：	方向盘
984	102	起动方式：	
985	102	Vin车辆识别代码:	LGHXLH4U×××××××××\nLGHXLH4X×××××××××\nLGHXLJ4X×××××××××\nLGHXLJ4U×××××××××\nLGHXLH4S×××××××××\nLGHXLJ4S×××××××××
986	103	外形尺寸:	12000×2500,2550×3700,3800,3900,3990(mm)
987	103	货箱尺寸:	7500,7700,8000,8200,8400,8500×2400,2450×400,550(mm)
988	103	总质量:	25000(Kg)
989	103	载质量利用系数:	1.03
990	103	整备质量:	17600(Kg)
991	103	额定载质量:	7205,7270(Kg)
992	103	挂车质量:	(Kg)
993	103	半挂鞍座:	
994	103	驾驶室:	
995	103	前排乘客:	3,2(人)
996	103	额定载客：	(人)
997	103	防抱死系统：	有
998	103	接近角/离去角：	19/8(°)
999	103	前悬/后悬：	1320/3480(mm)
1000	103	轴荷：	7000/18000(二轴组)
1001	103	轴距：	5850+1350(mm)
1002	103	轴数：	3
1003	103	最高车速：	89(km/h)
1004	103	油耗：	29.51,31.67,30.39(L/100Km)
1005	103	弹簧片数：	10/10,9/10,9/12,3/5,3/4,2/4,10/12
1006	103	轮胎数：	10(个)
1007	103	轮胎规格：	11.00R20 18PR
1008	103	前轮距：	2090(mm)
1009	103	后轮距：	1860/1860(mm)
1010	103	制动前：	
1011	103	制动后：	
1012	103	制操前：	
1013	103	制操后：	
1014	103	转向形式：	方向盘
1015	103	起动方式：	
1016	103	Vin车辆识别代码:	LRDV6PEC×××××××××\nLRDV6PDC×××××××××
1017	104	外形尺寸:	9000×2500,2550×3650,3750,3850(mm)
1018	104	货箱尺寸:	5000,5200,5400,5600,5800,6100,6300×2400,2450×550(mm)
1019	104	总质量:	18000(Kg)
1020	104	载质量利用系数:	1.00,1.14,1.27
1021	104	整备质量:	12800,12200,11700(Kg)
1022	104	额定载质量:	5070,5005,5670,5605,6170,6105(Kg)
1023	104	挂车质量:	(Kg)
1024	104	半挂鞍座:	
1025	104	驾驶室:	
1026	104	前排乘客:	2,3(人)
1027	104	额定载客：	(人)
1028	104	防抱死系统：	有
1029	104	接近角/离去角：	18/9(°)
1030	104	前悬/后悬：	1270/2580(mm)
1031	104	轴荷：	6500/11500
1032	104	轴距：	5150,5750(mm)
1033	104	轴数：	2
1034	104	最高车速：	89(km/h)
1035	104	油耗：	26.61,26.54(L/100Km)
1036	104	弹簧片数：	10/10+8,10/8+8,8/10+8,10/10+6,9/10+8,2/3+2,9/9+6,3/4+3
1037	104	轮胎数：	6(个)
1038	104	轮胎规格：	10.00-20 18PR,10.00R20 18PR,11R22.5 18PR
1039	104	前轮距：	1955,1970,2020,2050,1922,2008,1960,1931,1982,1952(mm)
1040	104	后轮距：	1800,1840,1860,1820(mm)
1041	104	制动前：	
1042	104	制动后：	
1043	104	制操前：	
1044	104	制操后：	
1045	104	转向形式：	方向盘
1046	104	起动方式：	
1047	104	Vin车辆识别代码:	LRDV6PDC×××××××××\nLRDV6JDC×××××××××
1048	105	外形尺寸:	8380×2550,2500×3850,3750,3650,3550(mm)
1049	105	货箱尺寸:	5000,4900,4800,4700,4600,4500×2450,2400×550(mm)
1050	105	总质量:	18000(Kg)
1051	105	载质量利用系数:	1.00,1.14,1.27
1052	105	整备质量:	12800,12200,11700(Kg)
1053	105	额定载质量:	5070,5005,5670,5605,6170,6105(Kg)
1054	105	挂车质量:	(Kg)
1055	105	半挂鞍座:	
1056	105	驾驶室:	
1057	105	前排乘客:	2,3(人)
1058	105	额定载客：	(人)
1059	105	防抱死系统：	有
1060	105	接近角/离去角：	18/10(°)
1061	105	前悬/后悬：	1410/2470(mm)
1062	105	轴荷：	6500/11500
1063	105	轴距：	4500,5000,5300(mm)
1064	105	轴数：	2
1065	105	最高车速：	89(km/h)
1066	105	油耗：	(L/100Km)
1067	105	弹簧片数：	9/10+8,9/11+8,3/4+3,4/4+3,9/10,9/11,8/10+8,8/11+8,8/10,8/11
1068	105	轮胎数：	6(个)
1069	105	轮胎规格：	295/80R22.5 18PR,295/80R22.5 16PR
1070	105	前轮距：	1960,1980,2050(mm)
1071	105	后轮距：	1880,1860(mm)
1072	105	制动前：	
1073	105	制动后：	
1074	105	制操前：	
1075	105	制操后：	
1076	105	转向形式：	方向盘
1077	105	起动方式：	
1078	105	Vin车辆识别代码:	LDPGBBAD×××××××××
1079	106	外形尺寸:	12000×2500,2550×3990,3950,3850,3750(mm)
1080	106	货箱尺寸:	7700,8000,8200,8300,8400,8500×2400,2450×400,550,600(mm)
1081	106	总质量:	31000(Kg)
1082	106	载质量利用系数:	1.09,1.23,1.38
1083	106	整备质量:	20800,19900,19000(Kg)
1084	106	额定载质量:	10005,10070,10905,10970,11805,11870(Kg)
1085	106	挂车质量:	(Kg)
1086	106	半挂鞍座:	
1087	106	驾驶室:	
1088	106	前排乘客:	2,3(人)
1089	106	额定载客：	(人)
1090	106	防抱死系统：	有
1091	106	接近角/离去角：	18/8(°)
1092	106	前悬/后悬：	1320/2655(mm)
1093	106	轴荷：	6500/6500/18000(二轴组)
1094	106	轴距：	2100+4575+1350(mm)
1095	106	轴数：	4
1096	106	最高车速：	89(km/h)
1097	106	油耗：	37.2(L/100Km)
1098	106	弹簧片数：	3/3/12,13/14/12,10/10/10,13/14/10,3/3/5,10/10/12
1099	106	轮胎数：	12(个)
1100	106	轮胎规格：	11.00R20 18PR,315/60R22.5 20PR
1101	106	前轮距：	2090/2090(mm)
1102	106	后轮距：	1860/1860(mm)
1103	106	制动前：	
1104	106	制动后：	
1105	106	制操前：	
1106	106	制操后：	
1107	106	转向形式：	方向盘
1108	106	起动方式：	
1109	106	Vin车辆识别代码:	LRDV7PEC×××××××××
1110	107	外形尺寸:	7405,7795,8260,8460,9000×2450,2500,2550×3550,3650,3750,3850(mm)
1111	107	货箱尺寸:	4100,4200,4300,4500,4600,4700,4800,5000,5200,5400,5800,6050,6100,6200,6300,6400,6500×2300,2400,2450×400,550(mm)
1112	107	总质量:	16200(Kg)
1113	107	载质量利用系数:	1.67,2.14
1114	107	整备质量:	10250,9350(Kg)
1115	107	额定载质量:	5820,5755,6720,6655(Kg)
1116	107	挂车质量:	(Kg)
1117	107	半挂鞍座:	
1118	107	驾驶室:	
1119	107	前排乘客:	2,3(人)
1120	107	额定载客：	(人)
1121	107	防抱死系统：	有
1122	107	接近角/离去角：	17/15,17/14,17/13,17/11(°)
1123	107	前悬/后悬：	1285/2170,1285/2310,1285/2475,1285/2615(mm)
1124	107	轴荷：	5600/10600
1125	107	轴距：	3950,4200,4500,5100,4700,3600,3800(mm)
1126	107	轴数：	2
1127	107	最高车速：	88(km/h)
1128	107	油耗：	24.1,24.1,24.1,24.3(L/100Km)
1129	107	弹簧片数：	9/11+8,9/10+8
1130	107	轮胎数：	6(个)
1131	107	轮胎规格：	9.00R20 16PR
1132	107	前轮距：	1820,1920,1940,1960,1860,1840,1880,1900(mm)
1133	107	后轮距：	1720,1800,1820,1860,1750(mm)
1134	107	制动前：	
1135	107	制动后：	
1136	107	制操前：	
1137	107	制操后：	
1138	107	转向形式：	方向盘
1139	107	起动方式：	
1140	107	Vin车辆识别代码:	LGHXGD1H×××××××××\nLGHXGD1K×××××××××\nLGHXGD1L×××××××××\nLGHXGD1P×××××××××\nLGHXGD1M×××××××××\nLGHXGD1H×××××××××\nLGHXGD1K×××××××××\nLGHXGD1L×××××××××\nLGHXGD1P×××××××××\nLGHXGD1M×××××××××\nLGHCGD1H×××××××××\nLGHCGD1K×××××××××\nLGHCGD1L×××××××××\nLGHCGD1P×××××××××\nLGH
1141	108	外形尺寸:	9000,7405,7795,8260,8460×2450,2500,2550×3550,3650,3750,3850(mm)
1142	108	货箱尺寸:	5600,5800,6050,6100,5600,5800,6050,6100,6200,6300,6400,6500,4100,4200,4300,4500,4600,4700,4800,5000,5200,5400×2300,2400,2450×400,550(mm)
1143	108	总质量:	16200(Kg)
1144	108	载质量利用系数:	1.00,1.00,1.00
1145	108	整备质量:	10600,11600(Kg)
1146	108	额定载质量:	5470,5405,4470,4405(Kg)
1147	108	挂车质量:	(Kg)
1148	108	半挂鞍座:	
1149	108	驾驶室:	
1150	108	前排乘客:	2,3(人)
1151	108	额定载客：	(人)
1152	108	防抱死系统：	有
1153	108	接近角/离去角：	17/11(°)
1154	108	前悬/后悬：	1285/2615,1285/2170,1285/2310,1285/2475(mm)
1155	108	轴荷：	5600/10600
1156	108	轴距：	3950,4200,4500,5100,4700,3600,3800(mm)
1157	108	轴数：	2
1158	108	最高车速：	88(km/h)
1159	108	油耗：	24.1,24.1,24.1,24.3(L/100Km)
1160	108	弹簧片数：	9/11+8,9/10+8
1161	108	轮胎数：	6(个)
1162	108	轮胎规格：	9.00R20 16PR
1163	108	前轮距：	1820,1920,1940,1960,1860,1840,1880,1900(mm)
1164	108	后轮距：	1720,1800,1820,1860,1750(mm)
1165	108	制动前：	
1166	108	制动后：	
1167	108	制操前：	
1168	108	制操后：	
1169	108	转向形式：	方向盘
1170	108	起动方式：	
1171	108	Vin车辆识别代码:	LGHXGD1H×××××××××\nLGHXGD1K×××××××××\nLGHXGD1L×××××××××\nLGHXGD1P×××××××××\nLGHXGD1M×××××××××\nLGHXGD1H×××××××××\nLGHXGD1K×××××××××\nLGHXGD1L×××××××××\nLGHXGD1P×××××××××\nLGHXGD1M×××××××××\nLGHCGD1H×××××××××\nLGHCGD1K×××××××××\nLGHCGD1L×××××××××\nLGHCGD1P×××××××××\nLGH
1172	109	外形尺寸:	10270,10890,11990×2500,2550×3650,3750,3850,3950(mm)
1173	109	货箱尺寸:	6500,6800,7200,7500,7800,8000,8200,8400,8500×2400,2450×400,550(mm)
1174	109	总质量:	25000(Kg)
1175	109	载质量利用系数:	1.28,1.15,1.04
1176	109	整备质量:	16230,16900,17550(Kg)
1177	109	额定载质量:	8575,8640,7905,7970,7255,7320(Kg)
1178	109	挂车质量:	(Kg)
1179	109	半挂鞍座:	
1180	109	驾驶室:	
1181	109	前排乘客:	3,2(人)
1182	109	额定载客：	(人)
1183	109	防抱死系统：	有
1184	109	接近角/离去角：	14/7,14/6(°)
1185	109	前悬/后悬：	1440/3130,1440/3350,1440/3500(mm)
1186	109	轴荷：	7000/18000(二轴组)
1187	109	轴距：	4350+1350,4750+1350,5700+1350(mm)
1188	109	轴数：	3
1189	109	最高车速：	89(km/h)
1190	109	油耗：	32.06,31.62(L/100Km)
1289	112	制动前：	
1191	109	弹簧片数：	11/12,11/10,4/5,8/10
1192	109	轮胎数：	10(个)
1193	109	轮胎规格：	12R22.5 18PR,11.00R20 18PR
1194	109	前轮距：	2060(mm)
1195	109	后轮距：	1860/1860(mm)
1196	109	制动前：	
1197	109	制动后：	
1198	109	制操前：	
1199	109	制操后：	
1200	109	转向形式：	方向盘
1201	109	起动方式：	
1202	109	Vin车辆识别代码:	LJVA8PDK×××××××××\nLJVA8PDL×××××××××
1203	110	外形尺寸:	7325,7790,8255×2500,2550×3550,3650,3750(mm)
1204	110	货箱尺寸:	3950,4100,4200,4300,4400,4500,4600,4700,4800×2400,2450×550,600(mm)
1205	110	总质量:	16200(Kg)
1206	110	载质量利用系数:	1.34,1.51,1.70
1207	110	整备质量:	10400,9950,9500(Kg)
1208	110	额定载质量:	5605,6055,6505(Kg)
1209	110	挂车质量:	(Kg)
1210	110	半挂鞍座:	
1211	110	驾驶室:	
1212	110	前排乘客:	3(人)
1213	110	额定载客：	(人)
1214	110	防抱死系统：	有
1215	110	接近角/离去角：	17/10,17/9(°)
1216	110	前悬/后悬：	1280/2145,1280/2310,1280/2475(mm)
1217	110	轴荷：	5600/10600
1218	110	轴距：	3900,4200,4500,4700,5000,3600(mm)
1219	110	轴数：	2
1220	110	最高车速：	90(km/h)
1221	110	油耗：	26.01,26.44,26.44,26.44,26.44,26.75,26.75,26.44(L/100Km)
1222	110	弹簧片数：	11/11+9,3/3+3,3/11+9,10/11+9,10/11+8
1223	110	轮胎数：	6(个)
1224	110	轮胎规格：	9.00R20 16PR,10.00R20 18PR
1225	110	前轮距：	1920,1950,1980,1810,1765(mm)
1226	110	后轮距：	1800,1860,1725(mm)
1227	110	制动前：	
1228	110	制动后：	
1229	110	制操前：	
1230	110	制操后：	
1231	110	转向形式：	方向盘
1232	110	起动方式：	
1233	110	Vin车辆识别代码:	LJVH8GDD×××××××××\nLJVA8GDD×××××××××\nLJVH8GDG×××××××××\nLJVA8GDG×××××××××\nLJVH8GDF×××××××××\nLJVA8GDF×××××××××\nLJVH8GDB×××××××××\nLJVA8GDB×××××××××\nLJVH8GDC×××××××××\nLJVA8GDC×××××××××\nLJVA8GDH×××××××××\nLJVH8GDH×××××××××\nLJVH8GDE×××××××××\nLJVA8GDE×××××××××
1234	111	外形尺寸:	8220,8260,8380,9000×2450,2500,2550×3550,3650,3750,3850(mm)
1235	111	货箱尺寸:	4500,4600,4700,4800,5000,5200,5400,5600,5800,6050,6100,6300,6200×2300,2400,2450×400,550(mm)
1236	111	总质量:	18000(Kg)
1237	111	载质量利用系数:	1.33,1.48,1.66
1238	111	整备质量:	10700,10250,9750(Kg)
1239	111	额定载质量:	7170,7105,7620,7555,8120,8055(Kg)
1240	111	挂车质量:	(Kg)
1241	111	半挂鞍座:	
1242	111	驾驶室:	
1243	111	前排乘客:	2,3(人)
1244	111	额定载客：	(人)
1245	111	防抱死系统：	有
1246	111	接近角/离去角：	19/11,17/11,19/10(°)
1247	111	前悬/后悬：	1250/2470,1285/2475,1410/2350,1410/2470,1250/2650,1285/2615,1410/2490,1300/2460,1300/2600(mm)
1248	111	轴荷：	6500/11500
1249	111	轴距：	4500,5100,4700,5600,5800,7150,5300,4200(mm)
1250	111	轴数：	2
1251	111	最高车速：	88(km/h)
1252	111	油耗：	25.30,24.10,24.30,24.30,20.01,24.90,25.40,26.39(L/100Km)
1253	111	弹簧片数：	9/11+8,3/4+3,9/10+8,3/3+3
1254	111	轮胎数：	6(个)
1255	111	轮胎规格：	10.00R20 18PR,295/80R22.5 16PR,295/60R22.5 18PR
1256	111	前轮距：	1960,1860,1900,1940,1920,1880(mm)
1257	111	后轮距：	1860,1820,1750(mm)
1258	111	制动前：	
1259	111	制动后：	
1260	111	制操前：	
1261	111	制操后：	
1262	111	转向形式：	方向盘
1263	111	起动方式：	
1264	111	Vin车辆识别代码:	LGHXHH1L×××××××××\nLGHXHH1P×××××××××\nLGHXHG1L×××××××××\nLGHXHG1P×××××××××\nLGHXHD1L×××××××××\nLGHXHD1P×××××××××\nLGHXHH1M×××××××××\nLGHXHH1S×××××××××\nLGHXHH1T×××××××××\nLGHXHH1X×××××××××\nLGHXHD1M×××××××××\nLGHXHD1S×××××××××\nLGHXHD1T×××××××××\nLGHXHD1X×××××××××\nLGH
1265	112	外形尺寸:	12000×2500,2550×3750,3850,3950,3990(mm)
1266	112	货箱尺寸:	7700,8200,8500×2300,2400,2450×400,550,800(mm)
1267	112	总质量:	31000(Kg)
1268	112	载质量利用系数:	1.00,1.19,1.09
1269	112	整备质量:	20800,22150(Kg)
1270	112	额定载质量:	10070,10005,8720,8655(Kg)
1271	112	挂车质量:	(Kg)
1272	112	半挂鞍座:	
1273	112	驾驶室:	
1274	112	前排乘客:	2,3(人)
1275	112	额定载客：	(人)
1276	112	防抱死系统：	有
1277	112	接近角/离去角：	22/16,22/15,22/14,22/14(°)
1278	112	前悬/后悬：	1500/2500,1500/2600,1500/2750,1500/2800(mm)
1279	112	轴荷：	6500/6500/18000(二轴组)
1280	112	轴距：	2050+4250+1350,2050+4500+1350,2150+4250+1350,2150+4500+1350,1995+4400+1350,1995+4600+1350,2150+4250+1300,2050+4600+1350,2050+4400+1350,2050+3100+1350,2050+4000+1350,1995+3200+1350,1995+3600+1350,2150+3500+1350,1995+3100+1350,1995+4000+1350(mm)
1281	112	轴数：	4
1282	112	最高车速：	90(km/h)
1283	112	油耗：	35.0,35.0,34.9,35.2,35.2,35.2,35.1,35.1,35.1(L/100Km)
1284	112	弹簧片数：	9/9/10,3/3/4,9/9/9,9/9/13
1285	112	轮胎数：	12(个)
1286	112	轮胎规格：	11.00R20 18PR,12.00R20 18PR,12R22.5 18PR,295/80R22.5 18PR
1287	112	前轮距：	1965/1965,1995/1995,2020/2020,2040/2040,1940/1940,2065/2065(mm)
1288	112	后轮距：	1860/1860(mm)
1290	112	制动后：	
1291	112	制操前：	
1292	112	制操后：	
1293	112	转向形式：	方向盘
1294	112	起动方式：	
1295	112	Vin车辆识别代码:	LXUX5C65×××××××××\nLXUX5D65×××××××××\nLXUX5C64×××××××××\nLXUX5D64×××××××××
1296	113	外形尺寸:	12000×2550×3750,3850,3950,3990(mm)
1297	113	货箱尺寸:	7700,8200,8500×2300,2400,2450×400,550,800(mm)
1298	113	总质量:	31000(Kg)
1299	113	载质量利用系数:	1.19
1300	113	整备质量:	19300(Kg)
1301	113	额定载质量:	11570,11505(Kg)
1302	113	挂车质量:	(Kg)
1303	113	半挂鞍座:	
1304	113	驾驶室:	
1305	113	前排乘客:	2,3(人)
1306	113	额定载客：	(人)
1307	113	防抱死系统：	有
1308	113	接近角/离去角：	22/16,22/15,22/14,22/14(°)
1309	113	前悬/后悬：	1500/2500,1500/2600,1500/2750,1500/2800(mm)
1310	113	轴荷：	6500/6500/18000(二轴组)
1311	113	轴距：	2050+4250+1350,2050+4500+1350,2150+4250+1350,2150+4500+1350,1995+4400+1350,1995+4600+1350,2150+4250+1300,2050+4600+1350,2050+4400+1350,2050+3100+1350,2050+4000+1350,1995+3200+1350,1995+3600+1350,2150+3500+1350,1995+3100+1350,1995+4000+1350(mm)
1312	113	轴数：	4
1313	113	最高车速：	90(km/h)
1314	113	油耗：	35.0,35.0,34.9,35.2,35.2,35.2,35.1,35.1,35.1,29.8(L/100Km)
1315	113	弹簧片数：	9/9/10,3/3/4,9/9/9,9/9/13
1316	113	轮胎数：	12(个)
1317	113	轮胎规格：	11.00R20 18PR,12.00R20 18PR,12R22.5 18PR,295/80R22.5 18PR
1318	113	前轮距：	1965/1965,1995/1995,2020/2020,2040/2040,1940/1940,2065/2065(mm)
1319	113	后轮距：	1860/1860(mm)
1320	113	制动前：	
1321	113	制动后：	
1322	113	制操前：	
1323	113	制操后：	
1324	113	转向形式：	方向盘
1325	113	起动方式：	
1326	113	Vin车辆识别代码:	LXUX5C65×××××××××\nLXUX5D65×××××××××\nLXUX5C64×××××××××\nLXUX5D64×××××××××
1327	114	外形尺寸:	12000×2550×3750,3850,3950,3990(mm)
1328	114	货箱尺寸:	7700,8200,8500,8400×2300,2400,2450×400,550,800(mm)
1329	114	总质量:	31000(Kg)
1330	114	载质量利用系数:	1.00
1331	114	整备质量:	22150(Kg)
1332	114	额定载质量:	8720,8655(Kg)
1333	114	挂车质量:	(Kg)
1334	114	半挂鞍座:	
1335	114	驾驶室:	
1336	114	前排乘客:	2,3(人)
1337	114	额定载客：	(人)
1338	114	防抱死系统：	有
1339	114	接近角/离去角：	16/12(°)
1340	114	前悬/后悬：	1525/2400(mm)
1341	114	轴荷：	6500/6500/18000(二轴组)
1342	114	轴距：	2100+4575+1400(mm)
1343	114	轴数：	4
1344	114	最高车速：	94,89(km/h)
1345	114	油耗：	36.87,37.18,36.87,36.87,37.18,37.37(L/100Km)
1346	114	弹簧片数：	14/14/12,10/10/10
1347	114	轮胎数：	12(个)
1348	114	轮胎规格：	11.00R20 18PR,12.00R20 18PR
1349	114	前轮距：	2011/2011,2036/2036,2070/2070(mm)
1350	114	后轮距：	1860/1860(mm)
1351	114	制动前：	
1352	114	制动后：	
1353	114	制操前：	
1354	114	制操后：	
1355	114	转向形式：	方向盘
1356	114	起动方式：	
1357	114	Vin车辆识别代码:	LZGCR2R6×××××××××\nLZGCR2T6×××××××××\nLZGCR2U6×××××××××\nLZGCR2N6×××××××××\nLZGCR2N6×××××××××\nLZGCR2S6×××××××××\nLZGCR2P6×××××××××
1358	115	外形尺寸:	12000×2500,2550×3750,3850,3950(mm)
1359	115	货箱尺寸:	7700,8200,8500,8400×2300,2400,2450×400,550,800(mm)
1360	115	总质量:	25000(Kg)
1361	115	载质量利用系数:	1.00,1.19
1362	115	整备质量:	17650,16600,17100(Kg)
1363	115	额定载质量:	7220,7155,8205,8270,7770,7705(Kg)
1364	115	挂车质量:	(Kg)
1365	115	半挂鞍座:	
1366	115	驾驶室:	
1367	115	前排乘客:	2,3(人)
1368	115	额定载客：	(人)
1369	115	防抱死系统：	有
1370	115	接近角/离去角：	13/10(°)
1371	115	前悬/后悬：	1500/3450(mm)
1372	115	轴荷：	7000/18000(二轴组)
1373	115	轴距：	5700+1350,4800+1350,4350+1350(mm)
1374	115	轴数：	3
1375	115	最高车速：	89(km/h)
1376	115	油耗：	31.7,31.7,31.7(L/100Km)
1377	115	弹簧片数：	3/4,3/10,9/10
1378	115	轮胎数：	10(个)
1379	115	轮胎规格：	11.00R20 18PR,295/80R22.5 18PR,12R22.5 18PR
1380	115	前轮距：	2010,2040,2060(mm)
1381	115	后轮距：	1860/1860,1880/1880(mm)
1382	115	制动前：	
1383	115	制动后：	
1384	115	制操前：	
1385	115	制操后：	
1386	115	转向形式：	方向盘
1387	115	起动方式：	
1388	115	Vin车辆识别代码:	LGAX4C45×××××××××\nLGAX4D45×××××××××\nLGAX4C44×××××××××\nLGAX4D44×××××××××
1389	116	外形尺寸:	12000×2500,2550×3750,3850,3950,3990(mm)
1390	116	货箱尺寸:	7700,7800,8200,8500,8400×2300,2400,2450×400,550,600(mm)
1391	116	总质量:	31000(Kg)
1392	116	载质量利用系数:	1.13,1.30,1.26,1.46
1393	116	整备质量:	19700,18600(Kg)
1394	116	额定载质量:	11105,11170,12205,12270(Kg)
1395	116	挂车质量:	(Kg)
1396	116	半挂鞍座:	
1397	116	驾驶室:	
1398	116	前排乘客:	2,3(人)
1399	116	额定载客：	(人)
1400	116	防抱死系统：	有
1401	116	接近角/离去角：	21/10(°)
1402	116	前悬/后悬：	1500/2700(mm)
1403	116	轴荷：	6500/6500/18000(二轴组)
1404	116	轴距：	2050+4400+1350,2150+4300+1350(mm)
1405	116	轴数：	4
1406	116	最高车速：	89(km/h)
1407	116	油耗：	37.1,36.9,36.6,36.96(L/100Km)
1408	116	弹簧片数：	8/8/10
1409	116	轮胎数：	12(个)
1410	116	轮胎规格：	11.00R20 18PR,295/80R22.5 18PR,12R22.5 18PR
1411	116	前轮距：	2010/2010,2040/2040(mm)
1412	116	后轮距：	1860/1860,1880/1880(mm)
1413	116	制动前：	
1414	116	制动后：	
1415	116	制操前：	
1416	116	制操后：	
1417	116	转向形式：	方向盘
1418	116	起动方式：	
1419	116	Vin车辆识别代码:	LGAX5D65×××××××××
1420	117	外形尺寸:	12000×2550×3750,3850,3950,3990(mm)
1421	117	货箱尺寸:	7700,7800,8200,8500,8400×2300,2400,2450×400,550,600(mm)
1422	117	总质量:	31000(Kg)
1423	117	载质量利用系数:	1.01,1.15,1.19,1.36,1.16,1.12
1424	117	整备质量:	20600,19600(Kg)
1425	117	额定载质量:	10270,11270,10205,11205(Kg)
1426	117	挂车质量:	(Kg)
1427	117	半挂鞍座:	
1428	117	驾驶室:	
1429	117	前排乘客:	2,3(人)
1430	117	额定载客：	(人)
1431	117	防抱死系统：	有
1432	117	接近角/离去角：	16/12(°)
1433	117	前悬/后悬：	1525/2400(mm)
1434	117	轴荷：	6500/6500/18000(二轴组)
1435	117	轴距：	2100+4575+1400(mm)
1436	117	轴数：	4
1437	117	最高车速：	94,89(km/h)
1438	117	油耗：	36.87,37.18,36.87,36.87,37.18,37.37(L/100Km)
1439	117	弹簧片数：	14/14/12,10/10/10
1440	117	轮胎数：	12(个)
1441	117	轮胎规格：	11.00R20 18PR,12.00R20 18PR
1442	117	前轮距：	2011/2011,2036/2036,2070/2070(mm)
1443	117	后轮距：	1860/1860(mm)
1444	117	制动前：	
1445	117	制动后：	
1446	117	制操前：	
1447	117	制操后：	
1448	117	转向形式：	方向盘
1449	117	起动方式：	
1450	117	Vin车辆识别代码:	LZGCR2R6×××××××××\nLZGCR2T6×××××××××\nLZGCR2U6×××××××××\nLZGCR2N6×××××××××\nLZGCR2N6×××××××××\nLZGCR2S6×××××××××\nLZGCR2P6×××××××××
1451	118	外形尺寸:	12000×2550,2500×3990,3950,3850,3750(mm)
1452	118	货箱尺寸:	7700,8200,8400,8500×2400,2450×400,550,800(mm)
1453	118	总质量:	31000(Kg)
1454	118	载质量利用系数:	1.00,1.19
1455	118	整备质量:	20800,22150(Kg)
1456	118	额定载质量:	10070,8720(Kg)
1457	118	挂车质量:	(Kg)
1458	118	半挂鞍座:	
1459	118	驾驶室:	
1460	118	前排乘客:	2(人)
1461	118	额定载客：	(人)
1462	118	防抱死系统：	有
1463	118	接近角/离去角：	19/11(°)
1464	118	前悬/后悬：	1525/2675(mm)
1465	118	轴荷：	6500/6500/18000(二轴组)
1466	118	轴距：	2050+4400+1350,2100+4350+1350(mm)
1467	118	轴数：	4
1468	118	最高车速：	89,80(km/h)
1469	118	油耗：	42(L/100Km)
1470	118	弹簧片数：	11/11/10,9/9/10,3/3/10,3/3/4,11/11/13
1471	118	轮胎数：	12(个)
1472	118	轮胎规格：	11.00R20 18PR,11.00-20 18PR,12R22.5 18PR
1473	118	前轮距：	2020/2020,2060/2060(mm)
1474	118	后轮距：	1860/1860,1874/1874(mm)
1475	118	制动前：	
1476	118	制动后：	
1477	118	制操前：	
1478	118	制操后：	
1479	118	转向形式：	方向盘
1480	118	起动方式：	
1481	118	Vin车辆识别代码:	LNXAEM0B×××××××××,LNXAEM0D×××××××××
1482	119	外形尺寸:	12000×2550,2500×3990,3950,3850,3750(mm)
1483	119	货箱尺寸:	7700,8200,8400,8500×2400,2450×550,800(mm)
1484	119	总质量:	31000(Kg)
1485	119	载质量利用系数:	1.24
1486	119	整备质量:	18000(Kg)
1487	119	额定载质量:	12870(Kg)
1488	119	挂车质量:	(Kg)
1489	119	半挂鞍座:	
1490	119	驾驶室:	
1491	119	前排乘客:	2(人)
1492	119	额定载客：	(人)
1493	119	防抱死系统：	有
1494	119	接近角/离去角：	19/11(°)
1495	119	前悬/后悬：	1525/2675(mm)
1496	119	轴荷：	6500/6500/18000
1497	119	轴距：	2050+4400+1350,2100+4350+1350(mm)
1498	119	轴数：	4
1499	119	最高车速：	89,80(km/h)
1500	119	油耗：	42(L/100Km)
1501	119	弹簧片数：	11/11/10,9/9/10,3/3/10,3/3/4,11/11/13
1502	119	轮胎数：	12(个)
1503	119	轮胎规格：	11.00R20 18PR,11.00-20 18PR,12R22.5 18PR
1504	119	前轮距：	2020/2020,2060/2060(mm)
1505	119	后轮距：	1860/1860,1874/1874(mm)
1506	119	制动前：	
1507	119	制动后：	
1508	119	制操前：	
1509	119	制操后：	
1510	119	转向形式：	方向盘
1511	119	起动方式：	
1512	119	Vin车辆识别代码:	LNXAEM0B×××××××××,LNXAEM0D×××××××××
1513	120	外形尺寸:	8730,9000×2550,2500×3850,3750,3650(mm)
1514	120	货箱尺寸:	5200,5500,5600,5700,5800,6100×2300,2400×550,600(mm)
1515	120	总质量:	18000(Kg)
1516	120	载质量利用系数:	1.14
1517	120	整备质量:	11700(Kg)
1518	120	额定载质量:	6170,6105(Kg)
1519	120	挂车质量:	(Kg)
1520	120	半挂鞍座:	
1521	120	驾驶室:	
1522	120	前排乘客:	2,3(人)
1523	120	额定载客：	(人)
1524	120	防抱死系统：	有
1525	120	接近角/离去角：	20/12(°)
1526	120	前悬/后悬：	1445/2455,1445/2585(mm)
1527	120	轴荷：	6500/11500
1528	120	轴距：	5100,4700,4500(mm)
1529	120	轴数：	2
1530	120	最高车速：	90(km/h)
1531	120	油耗：	25.8,25.8,25.8,25.8,(L/100Km)
1532	120	弹簧片数：	11/12+9,2/3+2,3/4+3,2/12+9,8/9+5,2/9+5,3/12+9,3/9+5,3/3+3,8/7+6,3/7+6,,8/7+3,3/7+3,3/-
1533	120	轮胎数：	6(个)
1534	120	轮胎规格：	10.00R20 18PR,275/80R22.5 18PR,295/80R22.5 18PR,295/60R22.5 18PR
1535	120	前轮距：	1916,1956,2046,2080(mm)
1536	120	后轮距：	1800,1860(mm)
1537	120	制动前：	
1538	120	制动后：	
1539	120	制操前：	
1540	120	制操后：	
1541	120	转向形式：	方向盘
1542	120	起动方式：	
1543	120	Vin车辆识别代码:	LNXAEG08×××××××××\nLNXAEG09×××××××××\nLNXAEG0A×××××××××
1544	121	外形尺寸:	12000×2500,2550×3750,3850,3950,3990(mm)
1545	121	货箱尺寸:	7500,7700,8200,8400,8500×2300,2400,2450×400,550,800(mm)
1546	121	总质量:	31000(Kg)
1547	121	载质量利用系数:	1.21,1.02,1.12,1.33
1548	121	整备质量:	19300,20600(Kg)
1549	121	额定载质量:	11570,10270,11505,10205(Kg)
1550	121	挂车质量:	(Kg)
1551	121	半挂鞍座:	
1552	121	驾驶室:	
1553	121	前排乘客:	2,3(人)
1554	121	额定载客：	(人)
1555	121	防抱死系统：	有
1556	121	接近角/离去角：	19/14(°)
1557	121	前悬/后悬：	1410/2690,1410/2890,1250/2850,1250/3050(mm)
1558	121	轴荷：	6500/6500/18000(二轴组)
1559	121	轴距：	2150+4400+1350,2250+4100+1350(mm)
1560	121	轴数：	4
1561	121	最高车速：	88(km/h)
1562	121	油耗：	37.3,37.3,36.67,37.1(L/100Km)
1563	121	弹簧片数：	9/9/13
1564	121	轮胎数：	12(个)
1565	121	轮胎规格：	11.00R20 18PR
1566	121	前轮距：	2040/2040,2050/2050,1960/1960(mm)
1567	121	后轮距：	1860/1860(mm)
1568	121	制动前：	
1569	121	制动后：	
1570	121	制操前：	
1571	121	制操后：	
1572	121	转向形式：	方向盘
1573	121	起动方式：	
1574	121	Vin车辆识别代码:	LGHXPJ6X×××××××××
1575	122	外形尺寸:	12000×2550×3990,3950,3850,3750(mm)
1576	122	货箱尺寸:	7700,8200,8500×2400,2450×400,550,600(mm)
1577	122	总质量:	31000(Kg)
1578	122	载质量利用系数:	1.16,1.02
1579	122	整备质量:	19600,20600(Kg)
1580	122	额定载质量:	11270,11205,10270,10205(Kg)
1581	122	挂车质量:	(Kg)
1582	122	半挂鞍座:	
1583	122	驾驶室:	
1584	122	前排乘客:	2,3(人)
1585	122	额定载客：	(人)
1586	122	防抱死系统：	有
1587	122	接近角/离去角：	15/11(°)
1588	122	前悬/后悬：	1400/2750(mm)
1589	122	轴荷：	6500/6500/18000(二轴组)
1590	122	轴距：	2400+4100+1350,2200+4300+1350(mm)
1591	122	轴数：	4
1592	122	最高车速：	89(km/h)
1593	122	油耗：	36.52,36.52(L/100Km)
1594	122	弹簧片数：	11/11/10,12/12/10,11/12/10,9/9/10,10/9/10
1595	122	轮胎数：	12(个)
1596	122	轮胎规格：	11.00R20,12R22.5,11R22.5
1597	122	前轮距：	1963/1963,1950/1950,2050/2050(mm)
1598	122	后轮距：	1878/1878(mm)
1599	122	制动前：	
1600	122	制动后：	
1601	122	制操前：	
1602	122	制操后：	
1603	122	转向形式：	方向盘
1604	122	起动方式：	
1605	122	Vin车辆识别代码:	LFNFVUMX×××××××××\nLFNFVUNX×××××××××\nLFNFVUPX×××××××××
1606	123	外形尺寸:	10900,12000×2500,2550×3750,3850,3950(mm)
1607	123	货箱尺寸:	7200,7500,7700,8200,8400,8500×2400,2450×400,550,800(mm)
1608	123	总质量:	25000(Kg)
1609	123	载质量利用系数:	1.38,1.11,1.46
1610	123	整备质量:	16800,18100,16460(Kg)
1611	123	额定载质量:	8070,8005,6770,6705,8410,8345(Kg)
1612	123	挂车质量:	(Kg)
1613	123	半挂鞍座:	
1614	123	驾驶室:	
1615	123	前排乘客:	2,3(人)
1616	123	额定载客：	(人)
1617	123	防抱死系统：	有
1618	123	接近角/离去角：	16/9(°)
1619	123	前悬/后悬：	1450/3350,1500/3300,1450/3300,1500/3250(mm)
1620	123	轴荷：	7000/18000(二轴组)
1621	123	轴距：	4750+1350,5850+1350,5850+1400(mm)
1622	123	轴数：	3
1623	123	最高车速：	88(km/h)
1624	123	油耗：	29.35,30.28,30.5,31.16,30.19(L/100Km)
1625	123	弹簧片数：	9/10,9/13
1626	123	轮胎数：	10(个)
1627	123	轮胎规格：	11.00R20 18PR
1628	123	前轮距：	1970,2020(mm)
1629	123	后轮距：	1860/1860,1880/1880(mm)
1630	123	制动前：	
1631	123	制动后：	
1632	123	制操前：	
1633	123	制操后：	
1634	123	转向形式：	方向盘
1635	123	起动方式：	
1636	123	Vin车辆识别代码:	LXP2GG34×××××××××\nLXP2GG35×××××××××\nLXP2GH34×××××××××\nLXP2GH35×××××××××
1637	124	外形尺寸:	11000,12000×2500,2550×3750,3850,3950,3990(mm)
1638	124	货箱尺寸:	7500,7700,8200,8500×2300,2400,2450×400,550,800(mm)
1639	124	总质量:	31000(Kg)
1640	124	载质量利用系数:	1.21,1.02
1641	124	整备质量:	19300,20600(Kg)
1642	124	额定载质量:	11505,11570,10205,10270(Kg)
1643	124	挂车质量:	(Kg)
1644	124	半挂鞍座:	
1645	124	驾驶室:	
1646	124	前排乘客:	2,3(人)
1647	124	额定载客：	(人)
1648	124	防抱死系统：	有
1649	124	接近角/离去角：	16/19,16/21,16/17(°)
1650	124	前悬/后悬：	1450/2300,1450/2250,1500/2250,1500/2200,1450/2700,1450/2650,1500/2650,1500/2600(mm)
1651	124	轴荷：	6500/6500/18000(二轴组)
1652	124	轴距：	2100+3800+1350,2100+3800+1400,2100+4400+1350,2100+4400+1400,1850+3000+1350,1850+3900+1350,1850+4100+1350,1850+5800+1350,1700+5800+1350(mm)
1653	124	轴数：	4
1654	124	最高车速：	88(km/h)
1655	124	油耗：	33.52,35.88(L/100Km)
1656	124	弹簧片数：	9/9/10,9/9/13,3/3/4
1657	124	轮胎数：	12(个)
1658	124	轮胎规格：	11.00R20 18PR
1659	124	前轮距：	1970/1970,2040/2040(mm)
1660	124	后轮距：	1860/1860,1880/1880(mm)
1661	124	制动前：	
1662	124	制动后：	
1663	124	制操前：	
1664	124	制操后：	
1665	124	转向形式：	方向盘
1666	124	起动方式：	
1667	124	Vin车辆识别代码:	LXP2HH65×××××××××\nLXP2HY65×××××××××
1668	125	外形尺寸:	12000,11200×2500,2550×3750,3850,3950,3990(mm)
1669	125	货箱尺寸:	7500,7700,8200,8400,8500×2300,2400,2450×400,550,800(mm)
1670	125	总质量:	31000(Kg)
1671	125	载质量利用系数:	1.21,1.06,1.16,1.33
1672	125	整备质量:	19300,20300(Kg)
1673	125	额定载质量:	11505,11570,10505,10570(Kg)
1674	125	挂车质量:	(Kg)
1675	125	半挂鞍座:	
1676	125	驾驶室:	
1677	125	前排乘客:	3,2(人)
1678	125	额定载客：	(人)
1679	125	防抱死系统：	有
1680	125	接近角/离去角：	19/17(°)
1681	125	前悬/后悬：	1430/2820,1430/2795,1430/2520,1430/2495(mm)
1682	125	轴荷：	6500/7000/17500(二轴组)
1683	125	轴距：	2100+4300+1350,2100+4275+1400,2100+3800+1350,2100+3775+1400,2300+4100+1350,2300+4075+1400(mm)
1684	125	轴数：	4
1685	125	最高车速：	89(km/h)
1686	125	油耗：	36.45,36.45,36.12,36.12,36.12,37.31,35.77,37.11,37.11,36.02(L/100Km)
1687	125	弹簧片数：	11/11/12,11/11/10,3/3/10,3/3/5,3/3/4,2/2/4,3/3/-,2/2/-,3/3/-/-,2/2/-/-
1688	125	轮胎数：	12(个)
1689	125	轮胎规格：	315/80R22.5 18PR,295/80R22.5,12R22.5,12.00R20 18PR,11.00R20,295/80R22.5,12R22.5 18PR,11.00R20 18PR
1690	125	前轮距：	2015/2015,2035/2035(mm)
1691	125	后轮距：	1830/1830,1850/1850(mm)
1692	125	制动前：	
1693	125	制动后：	
1694	125	制操前：	
1695	125	制操后：	
1696	125	转向形式：	方向盘
1697	125	起动方式：	
1698	125	Vin车辆识别代码:	LZZ1BXMD×××××××××\nLZZ1BXME×××××××××\nLZZ1BXMF×××××××××\nLZZ1BXND×××××××××\nLZZ1BXNE×××××××××\nLZZ1BXNF×××××××××\nLZZ1BXSD×××××××××\nLZZ1BXSE×××××××××\nLZZ1BXSF×××××××××\nLZZ1BXVD×××××××××\nLZZ1BXVE×××××××××\nLZZ1BXVF×××××××××
1699	126	外形尺寸:	12000×2500,2550×3750,3850,3950,3990(mm)
1700	126	货箱尺寸:	7500,7700,8200,8400,8500×2300,2400,2450×400,550,800(mm)
1701	126	总质量:	25000(Kg)
1702	126	载质量利用系数:	1.38,1.11
1703	126	整备质量:	16800,18100(Kg)
1704	126	额定载质量:	8070,8005,6770,6705(Kg)
1705	126	挂车质量:	(Kg)
1706	126	半挂鞍座:	
1707	126	驾驶室:	
1708	126	前排乘客:	2,3(人)
1709	126	额定载客：	(人)
1710	126	防抱死系统：	有
1711	126	接近角/离去角：	19/13(°)
1712	126	前悬/后悬：	1430/3420,1430/3395(mm)
1713	126	轴荷：	7000/18000(二轴组)
1714	126	轴距：	3200+1350,3175+1400,3800+1350,3775+1400,4100+1350,4075+1400,4300+1350,4275+1400,4600+1350,4575+1400,4900+1350,4875+1400,5200+1350,5175+1400,5800+1350,5775+1400,5740+1470,5800+1470(mm)
1715	126	轴数：	3
1716	126	最高车速：	80,89,110(km/h)
1717	126	油耗：	32.0,32.1,32.2(L/100Km)
1718	126	弹簧片数：	11/12,11/10,10/12,4/12,4/5,3/10,3/4,2/4,4/-,3/-,2/-,4/-/-,3/-/-,2/-/-
1719	126	轮胎数：	10(个)
1720	126	轮胎规格：	315/80R22.5 16PR,295/80R22.5,12R22.5,12.00R20 16PR,11.00R20
1721	126	前轮距：	2015,2035,2060(mm)
1722	126	后轮距：	1830/1830,1850/1850,1870/1870(mm)
1723	126	制动前：	
1724	126	制动后：	
1725	126	制操前：	
1726	126	制操后：	
1727	126	转向形式：	方向盘
1728	126	起动方式：	
1828	130	额定载质量:	6670,6605,5780,5715(Kg)
1829	130	挂车质量:	(Kg)
1830	130	半挂鞍座:	
1831	130	驾驶室:	
1729	126	Vin车辆识别代码:	LZZ1BLMB×××××××××\nLZZ1BLMD×××××××××\nLZZ1BLME×××××××××\nLZZ1BLMF×××××××××\nLZZ1BLMG×××××××××\nLZZ1BLMH×××××××××\nLZZ1BLMJ×××××××××\nLZZ1BLNB×××××××××\nLZZ1BLND×××××××××\nLZZ1BLNE×××××××××\nLZZ1BLNF×××××××××\nLZZ1BLNG×××××××××\nLZZ1BLNH×××××××××\nLZZ1BLNJ×××××××××\nLZZ
1730	127	外形尺寸:	12000,10800×2500,2550×3750,3850,3950(mm)
1731	127	货箱尺寸:	6500,6800,7000,7200,7400,7600,7700,8200,8400,8500×2400,2450×400,550,600,800(mm)
1732	127	总质量:	25000(Kg)
1733	127	载质量利用系数:	1.01
1734	127	整备质量:	17600(Kg)
1735	127	额定载质量:	7270,7205(Kg)
1736	127	挂车质量:	(Kg)
1737	127	半挂鞍座:	
1738	127	驾驶室:	
1739	127	前排乘客:	2,3(人)
1740	127	额定载客：	(人)
1741	127	防抱死系统：	有
1742	127	接近角/离去角：	25/8(°)
1743	127	前悬/后悬：	1450/3450,1450/3300(mm)
1744	127	轴荷：	7000/18000(二轴组)
1745	127	轴距：	5800+1300,3600+1300,3600+1350,3700+1300,3700+1350,3800+1300,3800+1350,4750+1300(mm)
1746	127	轴数：	3
1747	127	最高车速：	85(km/h)
1748	127	油耗：	31.79,32.17,30.40,30.91,31.57,31.57(L/100Km)
1749	127	弹簧片数：	9/10,10/12,12/12,10/10,9/12,3/4
1750	127	轮胎数：	10(个)
1751	127	轮胎规格：	11.00R20,11.00R20 18PR,12R22.5 18PR,12.00R20 18PR
1752	127	前轮距：	1970,1900,1940,2022(mm)
1753	127	后轮距：	1860/1860,1767/1767(mm)
1754	127	制动前：	
1755	127	制动后：	
1756	127	制操前：	
1757	127	制操后：	
1758	127	转向形式：	方向盘
1759	127	起动方式：	
1760	127	Vin车辆识别代码:	LZGCL2M4×××××××××\nLZGCL2N4×××××××××\nLZGCL2L4×××××××××
1761	128	外形尺寸:	10200,10800,10925,11000,12000×2500,2550×3650,3750,3850,3950(mm)
1762	128	货箱尺寸:	6500,6800,7200,7500,7700,8000,8200,8300,8400,8500×2400,2450×400,550,600(mm)
1763	128	总质量:	25000(Kg)
1764	128	载质量利用系数:	1.01
1765	128	整备质量:	17600(Kg)
1766	128	额定载质量:	7270,7205(Kg)
1767	128	挂车质量:	(Kg)
1768	128	半挂鞍座:	
1769	128	驾驶室:	
1770	128	前排乘客:	2,3(人)
1771	128	额定载客：	(人)
1772	128	防抱死系统：	有
1773	128	接近角/离去角：	29/12,29/11,29/10,29/9,29/8(°)
1774	128	前悬/后悬：	1475/3025,1515/2985,1540/2960,1475/3225,1515/3185,1540/3160,1475/3350,1515/3310,1540/3285,1475/2275,1515/2235,1540/2210,1475/3275,1515/3235,1540/3210(mm)
1775	128	轴荷：	7000/18000(二轴组)
1776	128	轴距：	4750+1350,5900+1350,4350+1350(mm)
1777	128	轴数：	3
1778	128	最高车速：	89(km/h)
1779	128	油耗：	31.1,30.4,31.0,31.4(L/100Km)
1780	128	弹簧片数：	9/10,9/13
1781	128	轮胎数：	10(个)
1782	128	轮胎规格：	11.00R20 18PR, 295/80R22.5 18PR
1783	128	前轮距：	1880,1960,2010(mm)
1784	128	后轮距：	1750/1750,1860/1860(mm)
1785	128	制动前：	
1786	128	制动后：	
1787	128	制操前：	
1788	128	制操后：	
1789	128	转向形式：	方向盘
1790	128	起动方式：	
1791	128	Vin车辆识别代码:	LGAX4C44×××××××××\nLGAX4C45×××××××××\nLGAX4D44×××××××××\nLGAX4D45×××××××××
1792	129	外形尺寸:	10200,10900,12000×2550,2500×3750,3850,3950(mm)
1793	129	货箱尺寸:	6500,6800,7200,7400,7700,8000,8200,8400,8500×2400,2450×550,800(mm)
1794	129	总质量:	25000(Kg)
1795	129	载质量利用系数:	1.31,1.17,1.01
1796	129	整备质量:	17200,17900,18800(Kg)
1797	129	额定载质量:	7670,7605,6970,6905,6070,6005(Kg)
1798	129	挂车质量:	(Kg)
1799	129	半挂鞍座:	
1800	129	驾驶室:	
1801	129	前排乘客:	2,3(人)
1802	129	额定载客：	(人)
1803	129	防抱死系统：	有
1804	129	接近角/离去角：	22/7,22/8(°)
1805	129	前悬/后悬：	1400/3100,1400/3350,1400/3450(mm)
1806	129	轴荷：	7000/18000(二轴组)
1807	129	轴距：	4350+1350,4800+1350,5300+1350,5800+1350(mm)
1808	129	轴数：	3
1809	129	最高车速：	89(km/h)
1810	129	油耗：	30.74,30.74,30.74,30.74,30.74,29.55,29.55,27.75,27.75,27.75,27.75,27.75,27.75,27.75,27.75(L/100Km)
1811	129	弹簧片数：	12/10,3/10,10/10
1812	129	轮胎数：	10(个)
1813	129	轮胎规格：	11.00R20,12R22.5,295/80R22.5,315/70R22.5
1814	129	前轮距：	1928,1950,1988(mm)
1815	129	后轮距：	1878/1878(mm)
1816	129	制动前：	
1817	129	制动后：	
1818	129	制操前：	
1819	129	制操后：	
1820	129	转向形式：	方向盘
1821	129	起动方式：	
1822	129	Vin车辆识别代码:	LFNDRUMP×××××××××\nLFNDRUMS×××××××××\nLFNDRUNP×××××××××\nLFNDRUNS×××××××××\nLFNDRUMV×××××××××\nLFNDRUMX×××××××××\nLFNDRUNV×××××××××\nLFNDRUNX×××××××××\nLFNDRULP×××××××××\nLFNDRULS×××××××××\nLFNDRULV×××××××××\nLFNDRULX×××××××××\nLFNDRUPP×××××××××\nLFNDRUPS×××××××××\nLFN
1823	130	外形尺寸:	8350,9000×2550,2500×3850,3750,3650(mm)
1824	130	货箱尺寸:	5000,5200,5650,5800,6080×2400,2450×550,600(mm)
1825	130	总质量:	18000(Kg)
1826	130	载质量利用系数:	1.57,1.28
1827	130	整备质量:	11200,12090(Kg)
1832	130	前排乘客:	2,3(人)
1833	130	额定载客：	(人)
1834	130	防抱死系统：	有
1835	130	接近角/离去角：	17/10(°)
1836	130	前悬/后悬：	1400/2450,1400/2600(mm)
1837	130	轴荷：	6500/11500
1838	130	轴距：	5300,5000,4700,4500,5600,5800,6000,4200,4000,3800(mm)
1839	130	轴数：	2
1840	130	最高车速：	89(km/h)
1841	130	油耗：	25.6,25.6,26.92,26.92,24.77(L/100Km)
1842	130	弹簧片数：	10/12+8,12/12+8,13/12+8,7/7+6,10/12+9,10/9+7
1843	130	轮胎数：	6(个)
1844	130	轮胎规格：	10.00R20,11.00R20,295/80R22.5,295/60R22.5,275/80R22.5,11R22.5
1845	130	前轮距：	1928,1827,1800,1950(mm)
1846	130	后轮距：	1878,1860(mm)
1847	130	制动前：	
1848	130	制动后：	
1849	130	制操前：	
1850	130	制操后：	
1851	130	转向形式：	方向盘
1852	130	起动方式：	
1853	130	Vin车辆识别代码:	LFNAHULM×××××××××\nLFNAHUKM×××××××××\nLFNAHULK×××××××××\nLFNAHUKK×××××××××\nLFNAHULJ×××××××××\nLFNAHUKJ×××××××××\nLFNAHULH×××××××××\nLFNAHUKH×××××××××\nLFNAHULP×××××××××\nLFNAHUKP×××××××××\nLFNAHULN×××××××××\nLFNAHUKN×××××××××\nLFNAHULR×××××××××\nLFNAHUKR×××××××××\nLFN
1854	131	外形尺寸:	7190,7420,7810,8120,8270×2300,2400,2500×3550,3650,3750(mm)
1855	131	货箱尺寸:	4200,4500,4800,5100×2200,2300×400,550(mm)
1856	131	总质量:	14060(Kg)
1857	131	载质量利用系数:	1.00
1858	131	整备质量:	9300(Kg)
1859	131	额定载质量:	4565(Kg)
1860	131	挂车质量:	(Kg)
1861	131	半挂鞍座:	
1862	131	驾驶室:	
1863	131	前排乘客:	3(人)
1864	131	额定载客：	(人)
1865	131	防抱死系统：	有
1866	131	接近角/离去角：	18/15,18/11(°)
1867	131	前悬/后悬：	1300/2090,1300/2170,1300/2310,1300/2420,1300/2470(mm)
1868	131	轴荷：	4860/9200
1869	131	轴距：	3800,3950,4200,4400,4500(mm)
1870	131	轴数：	2
1871	131	最高车速：	88(km/h)
1872	131	油耗：	22.5(L/100Km)
1873	131	弹簧片数：	8/10+8,9/11+8,9/10,9/11,8/11
1874	131	轮胎数：	6(个)
1875	131	轮胎规格：	9.00-20 16PR,9.00R20 16PR,8.25R20 16PR
1876	131	前轮距：	1815,1910(mm)
1877	131	后轮距：	1720,1800,1860(mm)
1878	131	制动前：	
1879	131	制动后：	
1880	131	制操前：	
1881	131	制操后：	
1882	131	转向形式：	方向盘
1883	131	起动方式：	
1884	131	Vin车辆识别代码:	LGHXED1H×××××××××\nLGHXED1K×××××××××\nLGHXED1L×××××××××\nLGHXGD1L×××××××××
1885	132	外形尺寸:	12000×2500,2550×3750,3850,3950,3990(mm)
1886	132	货箱尺寸:	7700,8200,8400,8500×2300,2400,2450×400,550,600(mm)
1887	132	总质量:	31000(Kg)
1888	132	载质量利用系数:	1.02,1.16
1889	132	整备质量:	20600,19600(Kg)
1890	132	额定载质量:	10270,10205,11270,11205(Kg)
1891	132	挂车质量:	(Kg)
1892	132	半挂鞍座:	
1893	132	驾驶室:	
1894	132	前排乘客:	2,3(人)
1895	132	额定载客：	(人)
1896	132	防抱死系统：	有
1897	132	接近角/离去角：	21/10(°)
1898	132	前悬/后悬：	1500/2700(mm)
1899	132	轴荷：	6500/6500/18000(二轴组)
1900	132	轴距：	2050+4400+1350(mm)
1901	132	轴数：	4
1902	132	最高车速：	89(km/h)
1903	132	油耗：	36.9(L/100Km)
1904	132	弹簧片数：	9/9/13
1905	132	轮胎数：	12(个)
1906	132	轮胎规格：	11.00R20 18PR
1907	132	前轮距：	2010/2010,2040/2040(mm)
1908	132	后轮距：	1860/1860,1880/1880(mm)
1909	132	制动前：	
1910	132	制动后：	
1911	132	制操前：	
1912	132	制操后：	
1913	132	转向形式：	方向盘
1914	132	起动方式：	
1915	132	Vin车辆识别代码:	LGAX5D65×××××××××
1916	133	外形尺寸:	12000×2550×3990(mm)
1917	133	货箱尺寸:	××(mm)
1918	133	总质量:	41000(Kg)
1919	133	载质量利用系数:	
1920	133	整备质量:	40870,40805(Kg)
1921	133	额定载质量:	(Kg)
1922	133	挂车质量:	(Kg)
1923	133	半挂鞍座:	
1924	133	驾驶室:	
1925	133	前排乘客:	2,3(人)
1926	133	额定载客：	(人)
1927	133	防抱死系统：	有
1928	133	接近角/离去角：	19/10(°)
1929	133	前悬/后悬：	1525/2400(mm)
1930	133	轴荷：	7500/7500/13000/13000
1931	133	轴距：	1800+3575+1400,1800+3975+1400,1800+4575+1400,2100+4375+1400,2100+4575+1400,1800+5175+1400,1950+3425+1400,1800+5575+1400(mm)
1932	133	轴数：	4
1933	133	最高车速：	89(km/h)
1934	133	油耗：	(L/100Km)
1935	133	弹簧片数：	14/14/12,3/3/5
1936	133	轮胎数：	12(个)
1937	133	轮胎规格：	12.00R20 18PR,12.00R20 20PR
1938	133	前轮距：	2036/2036,2070/2070(mm)
1939	133	后轮距：	1860/1860(mm)
1940	133	制动前：	
1941	133	制动后：	
1942	133	制操前：	
1943	133	制操后：	
1944	133	转向形式：	方向盘
1945	133	起动方式：	
1946	133	Vin车辆识别代码:	LZGCX2R6×××××××××\nLZGCX2T6×××××××××\nLZGCX2U6×××××××××\nLZGCX2N6×××××××××\nLZGCX2V6×××××××××\nLZGCX2X6×××××××××\nLZGCR2P6×××××××××\nLZGCR2S6×××××××××\nLZGCX2P6×××××××××\nLZGCX2S6×××××××××
1947	134	外形尺寸:	8060×2420,2550×2375(mm)
1948	134	货箱尺寸:	××(mm)
1949	134	总质量:	9990(Kg)
1950	134	载质量利用系数:	
1951	134	整备质量:	7250,7750(Kg)
1952	134	额定载质量:	(Kg)
1953	134	挂车质量:	(Kg)
1954	134	半挂鞍座:	
1955	134	驾驶室:	
1956	134	前排乘客:	3(人)
1957	134	额定载客：	(人)
1958	134	防抱死系统：	有
1959	134	接近角/离去角：	16/10(°)
1960	134	前悬/后悬：	1130/2730(mm)
1961	134	轴荷：	3600/6390
1962	134	轴距：	4200,3800,4500(mm)
1963	134	轴数：	2
1964	134	最高车速：	105(km/h)
1965	134	油耗：	(L/100Km)
1966	134	弹簧片数：	3/4+3,6+1/9+7,3/8+6,4/8+6
1967	134	轮胎数：	6(个)
1968	134	轮胎规格：	8.25R16LT 16PR,235/75R17.5 14PR
1969	134	前轮距：	1705,1730(mm)
1970	134	后轮距：	1680,1800,1615(mm)
1971	134	制动前：	
1972	134	制动后：	
1973	134	制操前：	
1974	134	制操后：	
1975	134	转向形式：	方向盘
1976	134	起动方式：	
1977	134	Vin车辆识别代码:	LVBV4JBB×××××××××\nLVBV4PBB×××××××××
1978	135	外形尺寸:	5995×2420,2530×2280,2400(mm)
1979	135	货箱尺寸:	××(mm)
1980	135	总质量:	4495(Kg)
1981	135	载质量利用系数:	
1982	135	整备质量:	2800,2865(Kg)
1983	135	额定载质量:	1500(Kg)
1984	135	挂车质量:	(Kg)
1985	135	半挂鞍座:	
1986	135	驾驶室:	
1987	135	前排乘客:	3,2(人)
1988	135	额定载客：	(人)
1989	135	防抱死系统：	有
1990	135	接近角/离去角：	19/13,19/16(°)
1991	135	前悬/后悬：	1120/1515,1120/1275(mm)
1992	135	轴荷：	1575/2920
1993	135	轴距：	3360,3600(mm)
1994	135	轴数：	2
1995	135	最高车速：	105(km/h)
1996	135	油耗：	(L/100Km)
1997	135	弹簧片数：	3/5+2,3/3+2,2/2+1,3+1/6+7,1/1+1,3/7+6,3/8+6,7/6+7,9/8+6,3/6+6,2/2+2,3/4+2
1998	135	轮胎数：	6(个)
1999	135	轮胎规格：	7.00R16LT 8PR,7.00R16LT 10PR
2000	135	前轮距：	1590,1720,1530,1730,1610,1575(mm)
2001	135	后轮距：	1485,1590,1800,1615,1710(mm)
2002	135	制动前：	
2003	135	制动后：	
2004	135	制操前：	
2005	135	制操后：	
2006	135	转向形式：	方向盘
2007	135	起动方式：	
2008	135	Vin车辆识别代码:	LVBV3JBB×××××××××\nLVBV3PBB×××××××××
2009	136	外形尺寸:	8675,8710,8725,8835,9005,9040,9055,9165,9660,9695,9710,9820×2500,2550×3600,3700,3800(mm)
2010	136	货箱尺寸:	××(mm)
2011	136	总质量:	18000(Kg)
2012	136	载质量利用系数:	
2013	136	整备质量:	14000,14650,15080(Kg)
2014	136	额定载质量:	(Kg)
2015	136	挂车质量:	(Kg)
2016	136	半挂鞍座:	
2017	136	驾驶室:	
2018	136	前排乘客:	2,3(人)
2019	136	额定载客：	(人)
2020	136	防抱死系统：	有
2021	136	接近角/离去角：	19/8,17/8,19/7,17/7(°)
2022	136	前悬/后悬：	1250/2925,1285/2925,1300/2925,1410/2925,1250/3055,1285/3055,1300/3055,1410/3055,1250/3310,1285/3310,1300/3310,1410/3310(mm)
2023	136	轴荷：	6500/11500
2024	136	轴距：	4500,5100,4700,5600,5800,7150,5300,4200(mm)
2025	136	轴数：	2
2026	136	最高车速：	88(km/h)
2027	136	油耗：	(L/100Km)
2028	136	弹簧片数：	9/11+8,3/4+3,9/10+8,3/3+3
2029	136	轮胎数：	6(个)
2030	136	轮胎规格：	10.00R20 18PR,295/80R22.5 16PR,295/60R22.5 18PR
2031	136	前轮距：	1960,1860,1900,1940,1920,1880(mm)
2032	136	后轮距：	1860,1820,1750(mm)
2033	136	制动前：	
2034	136	制动后：	
2035	136	制操前：	
2036	136	制操后：	
2037	136	转向形式：	方向盘
2038	136	起动方式：	
2039	136	Vin车辆识别代码:	LGHXHH1L×××××××××\nLGHXHH1P×××××××××\nLGHXHG1L×××××××××\nLGHXHG1P×××××××××\nLGHXHD1L×××××××××\nLGHXHD1P×××××××××\nLGHXHH1M×××××××××\nLGHXHH1S×××××××××\nLGHXHH1T×××××××××\nLGHXHH1X×××××××××\nLGHXHD1M×××××××××\nLGHXHD1S×××××××××\nLGHXHD1T×××××××××\nLGHXHD1X×××××××××\nLGH
2040	137	外形尺寸:	9150,9650,10100,10650×2550×3600,3700(mm)
2041	137	货箱尺寸:	××(mm)
2042	137	总质量:	18000(Kg)
2043	137	载质量利用系数:	
2044	137	整备质量:	14300,15550,15690(Kg)
2045	137	额定载质量:	(Kg)
2046	137	挂车质量:	(Kg)
2047	137	半挂鞍座:	
2048	137	驾驶室:	
2049	137	前排乘客:	2,3(人)
2050	137	额定载客：	(人)
2051	137	防抱死系统：	有
2052	137	接近角/离去角：	17/8,17/7(°)
2053	137	前悬/后悬：	1400/3050,1400/3020,1400/3250,1430/3220,1400/3400,1430/3370,1400/3450,1430/3420(mm)
2054	137	轴荷：	6500/11500
2055	137	轴距：	3800,3950,4200,4500,4700,5000,5300,5800,5600,5100(mm)
2056	137	轴数：	2
2057	137	最高车速：	89(km/h)
2058	137	油耗：	(L/100Km)
2059	137	弹簧片数：	7/9+6,8/10+8,8/9+6,11/10+8,3/10+8
2060	137	轮胎数：	6(个)
2061	137	轮胎规格：	10.00R20 18PR,275/80R22.5 18PR
2062	137	前轮距：	1876,1896,1920,1950,1914,1934,1980,2000,1815,1860(mm)
2063	137	后轮距：	1820,1860,1800,1840(mm)
2064	137	制动前：	
2065	137	制动后：	
2066	137	制操前：	
2067	137	制操后：	
2068	137	转向形式：	方向盘
2069	137	起动方式：	
2070	137	Vin车辆识别代码:	LGAX3A12×××××××××\nLGAX3B12×××××××××\nLGAX3C12×××××××××\nLGAX3A13×××××××××\nLGAX3B13×××××××××\nLGAX3C13×××××××××\nLGAX3A14×××××××××\nLGAX3B14×××××××××\nLGAX3C14×××××××××
2071	138	外形尺寸:	5998×2200×3360(mm)
2072	138	货箱尺寸:	××(mm)
2073	138	总质量:	4495(Kg)
2074	138	载质量利用系数:	
2075	138	整备质量:	4300(Kg)
2076	138	额定载质量:	(Kg)
2077	138	挂车质量:	(Kg)
2078	138	半挂鞍座:	
2079	138	驾驶室:	
2080	138	前排乘客:	3(人)
2081	138	额定载客：	(人)
2082	138	防抱死系统：	有
2083	138	接近角/离去角：	18/12(°)
2084	138	前悬/后悬：	1160/1558,1180/1538(mm)
2085	138	轴荷：	1790/2705
2086	138	轴距：	3280,3360,3300(mm)
2087	138	轴数：	2
2088	138	最高车速：	95(km/h)
2089	138	油耗：	(L/100Km)
2090	138	弹簧片数：	3/3+2,8/9+6,3/5+3,2/2+1,2/2+2,3/4+3,2/3+2,1/1+1,11/9+7,11/11+7,3/5+3,3/5+2,3/1+1,3/9+7,3/7+4,3/8+6
2091	138	轮胎数：	6(个)
2092	138	轮胎规格：	7.00R16LT 10PR,7.50R16LT 8PR,205/85R16LT 8PR,215/85R16LT 8PR,8.25R16LT 6PR
2093	138	前轮距：	1610,1640,1670,1776,1796,1815(mm)
2094	138	后轮距：	1505,1530,1560,1595,1645,1695,1795(mm)
2095	138	制动前：	
2096	138	制动后：	
2097	138	制操前：	
2098	138	制操后：	
2099	138	转向形式：	方向盘
2100	138	起动方式：	
2101	138	Vin车辆识别代码:	LZZ1BAEB×××××××××\nLZZ1BAEC×××××××××\nLZZ1BAFB×××××××××\nLZZ1BAFC×××××××××\nLZZ1BADB×××××××××\nLZZ1BADC×××××××××\nLZZ1BAGB×××××××××\nLZZ1BAGC×××××××××
2102	139	外形尺寸:	7250,6950,6400,6300×2350,2300×3200,3150,3000,2900(mm)
2103	139	货箱尺寸:	××(mm)
2104	139	总质量:	9100,8800,8550(Kg)
2105	139	载质量利用系数:	
2106	139	整备质量:	8905,8605,8355(Kg)
2107	139	额定载质量:	(Kg)
2108	139	挂车质量:	(Kg)
2109	139	半挂鞍座:	
2110	139	驾驶室:	
2111	139	前排乘客:	3(人)
2112	139	额定载客：	(人)
2113	139	防抱死系统：	有
2114	139	接近角/离去角：	21/10,21/12,21/13(°)
2115	139	前悬/后悬：	1130/2320,1130/2020,1130/2220,1130/1962,1130/1470,1130/1862(mm)
2116	139	轴荷：	3300/5800,3300/5500,3100/5450
2117	139	轴距：	3308,3800,4400,3600(mm)
2118	139	轴数：	2
2119	139	最高车速：	103(km/h)
2120	139	油耗：	(L/100Km)
2121	139	弹簧片数：	8/10+7,12/12+9,6/6+5,3/8+6,3/3+3
2122	139	轮胎数：	6(个)
2123	139	轮胎规格：	7.50R16LT 16PR,8.25R16LT 16PR
2124	139	前轮距：	1745,1760,1521,1609(mm)
2125	139	后轮距：	1586,1630,1650,1800,1494(mm)
2126	139	制动前：	
2127	139	制动后：	
2128	139	制操前：	
2129	139	制操后：	
2130	139	转向形式：	方向盘
2131	139	起动方式：	
2132	139	Vin车辆识别代码:	LGDCUA1G×××××××××\nLGDXUA1G×××××××××\nLGDCUA1L×××××××××\nLGDXUA1L×××××××××\nLGDCU91G×××××××××\nLGDCU91L×××××××××\nLGDXU91G×××××××××\nLGDXU91L×××××××××\nLGDCUA1P×××××××××\nLGDXUA1P×××××××××\nLGDCU91P×××××××××\nLGDXU91P×××××××××\nLGDCUA1J×××××××××\nLGDXUA1J×××××××××\nLGD
2133	140	外形尺寸:	8280,8200,7900,7400×2350,2200×3520,3450,3350,3250,3150,2950(mm)
2134	140	货箱尺寸:	××(mm)
2135	140	总质量:	10495,9550(Kg)
2136	140	载质量利用系数:	
2137	140	整备质量:	10300,9355(Kg)
2138	140	额定载质量:	(Kg)
2139	140	挂车质量:	(Kg)
2140	140	半挂鞍座:	
2141	140	驾驶室:	
2142	140	前排乘客:	3(人)
2143	140	额定载客：	(人)
2144	140	防抱死系统：	有
2145	140	接近角/离去角：	17/15,20/18,20/20(°)
2146	140	前悬/后悬：	1110/2695,1110/2615,1110/2315,1110/1815(mm)
2147	140	轴荷：	3500/6995,3200/6350
2148	140	轴距：	4475(mm)
2149	140	轴数：	2
2150	140	最高车速：	110(km/h)
2151	140	油耗：	(L/100Km)
2152	140	弹簧片数：	8/10+6
2153	140	轮胎数：	6(个)
2154	140	轮胎规格：	235/75R17.5 16PR,8.25R20 14PR
2155	140	前轮距：	1680(mm)
2156	140	后轮距：	1650(mm)
2157	140	制动前：	
2158	140	制动后：	
2159	140	制操前：	
2160	140	制操后：	
2161	140	转向形式：	方向盘
2162	140	起动方式：	
2163	140	Vin车辆识别代码:	LWLDAAJK×××××××××\nLWLDAANK×××××××××
2164	141	外形尺寸:	12000,11880×2550,2500×3990,3860,3750(mm)
2165	141	货箱尺寸:	××(mm)
2166	141	总质量:	31000(Kg)
2167	141	载质量利用系数:	
2168	141	整备质量:	30805,30870(Kg)
2169	141	额定载质量:	(Kg)
2170	141	挂车质量:	(Kg)
2171	141	半挂鞍座:	
2172	141	驾驶室:	
2173	141	前排乘客:	2,3(人)
2174	141	额定载客：	(人)
2175	141	防抱死系统：	有
2176	141	接近角/离去角：	21/9,21/10(°)
2177	141	前悬/后悬：	1375/2875,1375/2755(mm)
2178	141	轴荷：	6500/6500/18000(二轴组)
2179	141	轴距：	1900+4500+1350(mm)
2180	141	轴数：	4
2181	141	最高车速：	89(km/h)
2182	141	油耗：	(L/100Km)
2183	141	弹簧片数：	3/3/4,3/3/10,10/10/10
2184	141	轮胎数：	12(个)
2185	141	轮胎规格：	295/80R22.5 16PR,295/80R22.5 18PR,12R22.5 16PR,12R22.5 18PR,11.00R20 16PR,11.00R20 18PR
2186	141	前轮距：	2020/2020,2048/2048(mm)
2187	141	后轮距：	1878/1878,1900/1900(mm)
2188	141	制动前：	
2189	141	制动后：	
2190	141	制操前：	
2191	141	制操后：	
2192	141	转向形式：	方向盘
2193	141	起动方式：	
2194	141	Vin车辆识别代码:	LFNFVUPX×××××××××\nLFNFVURX×××××××××
2195	142	外形尺寸:	9995,10880,11590,11900,12000×2500,2550×3860,3900,3950,3990(mm)
2196	142	货箱尺寸:	××(mm)
2197	142	总质量:	25000(Kg)
2198	142	载质量利用系数:	
2199	142	整备质量:	24870,24805(Kg)
2200	142	额定载质量:	(Kg)
2201	142	挂车质量:	(Kg)
2202	142	半挂鞍座:	
2203	142	驾驶室:	
2204	142	前排乘客:	2,3(人)
2205	142	额定载客：	(人)
2206	142	防抱死系统：	有
2207	142	接近角/离去角：	19/10,19/9,19/8(°)
2208	142	前悬/后悬：	1430/2615,1430/2900,1430/3010,1430/3320,1430/3420(mm)
2209	142	轴荷：	7000/18000(二轴组)
2210	142	轴距：	3200+1350,3175+1400,3800+1350,3775+1400,4100+1350,4075+1400,4300+1350,4275+1400,4600+1350,4575+1400,4900+1350,4875+1400,5200+1350,5175+1400,5800+1350,5775+1400,5740+1470,5800+1470(mm)
2211	142	轴数：	3
2212	142	最高车速：	80,89,110(km/h)
2213	142	油耗：	(L/100Km)
2214	142	弹簧片数：	11/12,11/10,10/12,4/12,4/5,3/10,3/4,2/4,4/-,3/-,2/-,4/-/-,3/-/-,2/-/-
2215	142	轮胎数：	10(个)
2216	142	轮胎规格：	315/80R22.5 16PR,295/80R22.5,12R22.5,12.00R20 16PR,11.00R20
2217	142	前轮距：	2015,2035,2060(mm)
2218	142	后轮距：	1830/1830,1850/1850,1870/1870(mm)
2219	142	制动前：	
2220	142	制动后：	
2221	142	制操前：	
2222	142	制操后：	
2223	142	转向形式：	方向盘
2224	142	起动方式：	
2225	142	Vin车辆识别代码:	LZZ1BLMB×××××××××\nLZZ1BLMD×××××××××\nLZZ1BLME×××××××××\nLZZ1BLMF×××××××××\nLZZ1BLMG×××××××××\nLZZ1BLMH×××××××××\nLZZ1BLMJ×××××××××\nLZZ1BLNB×××××××××\nLZZ1BLND×××××××××\nLZZ1BLNE×××××××××\nLZZ1BLNF×××××××××\nLZZ1BLNG×××××××××\nLZZ1BLNH×××××××××\nLZZ1BLNJ×××××××××\nLZZ
2226	143	外形尺寸:	7550,8600,9000,9695×2500,2550×3350,3500,3680,3990(mm)
2227	143	货箱尺寸:	××(mm)
2228	143	总质量:	16000(Kg)
2229	143	载质量利用系数:	
2230	143	整备质量:	15870,15805(Kg)
2231	143	额定载质量:	(Kg)
2232	143	挂车质量:	(Kg)
2233	143	半挂鞍座:	
2234	143	驾驶室:	
2235	143	前排乘客:	2,3(人)
2236	143	额定载客：	(人)
2237	143	防抱死系统：	有
2238	143	接近角/离去角：	16/25,16/20,16/19,16/20(°)
2239	143	前悬/后悬：	1450/2300,1450/2450,1450/2550,1450/2445,1450/2350(mm)
2240	143	轴荷：	5760/10240
2241	143	轴距：	3600,3800,4200,4500,4700,5000,5200,5600,5800,6300,5400,6100(mm)
2242	143	轴数：	2
2243	143	最高车速：	80,89,110(km/h)
2244	143	油耗：	(L/100Km)
2245	143	弹簧片数：	3/4,2/3+2,3/3+2,3/9+8,3/7+3,3/7+6,7/7+3,7/7+6,11/9+8,3/-,3/2+-,2/2+-,2/-,11/10+7,3/3+3
2246	143	轮胎数：	6(个)
2247	143	轮胎规格：	295/80R22.5 18PR,12R22.5 18PR,11.00R20 18PR,10.00R20 18PR,275/80R22.5 18PR,295/60R22.5 18PR,315/60R22.5 18PR
2248	143	前轮距：	1900,1950,1998,2015,2035,2065(mm)
2249	143	后轮距：	1850,1880(mm)
2250	143	制动前：	
2251	143	制动后：	
2252	143	制操前：	
2253	143	制操后：	
2254	143	转向形式：	方向盘
2255	143	起动方式：	
2256	143	Vin车辆识别代码:	LZZ8BCHD×××××××××\nLZZ8BCHE×××××××××\nLZZ8BCHF×××××××××\nLZZ8BCHG×××××××××\nLZZ8BCHH×××××××××\nLZZ8BCHJ×××××××××\nLZZ8BCKD×××××××××\nLZZ8BCKE×××××××××\nLZZ8BCKF×××××××××\nLZZ8BCKG×××××××××\nLZZ8BCKH×××××××××\nLZZ8BCKJ×××××××××\nLZZ8BCMD×××××××××\nLZZ8BCME×××××××××\nLZZ
2257	144	外形尺寸:	5995,6260×2000×2490,2600,2800,2900,3100(mm)
2258	144	货箱尺寸:	××(mm)
2259	144	总质量:	4495(Kg)
2260	144	载质量利用系数:	
2261	144	整备质量:	4365,4300(Kg)
2262	144	额定载质量:	(Kg)
2263	144	挂车质量:	(Kg)
2264	144	半挂鞍座:	
2265	144	驾驶室:	
2266	144	前排乘客:	2,3(人)
2267	144	额定载客：	(人)
2268	144	防抱死系统：	有
2269	144	接近角/离去角：	28/14,28/13(°)
2270	144	前悬/后悬：	1055/1632,1055/1897(mm)
2271	144	轴荷：	2180/2315
2272	144	轴距：	2700,2950,3308,3600,3800(mm)
2273	144	轴数：	2
2274	144	最高车速：	110(km/h)
2275	144	油耗：	(L/100Km)
2276	144	弹簧片数：	6/6+5,3/3+3,5/4+3,6/4+3,6/5+2,6/3+3,3/6+5,3/3+2,2/2,3/8+6,7/10+7
2277	144	轮胎数：	6(个)
2278	144	轮胎规格：	7.00R16,7.00R16LT,7.00R16LT 14PR,7.50R16LT 16PR
2279	144	前轮距：	1525,1519,1503,1613,1540(mm)
2280	144	后轮距：	1498,1516,1586,1670,1650,1800,1546(mm)
2281	144	制动前：	
2282	144	制动后：	
2283	144	制操前：	
2284	144	制操后：	
2285	144	转向形式：	方向盘
2286	144	起动方式：	
2287	144	Vin车辆识别代码:	LGDCP91C×××××××××\nLGDCPA1C×××××××××\nLGDCP91E×××××××××\nLGDCPA1E×××××××××\nLGDCP91G×××××××××\nLGDCPA1G×××××××××\nLGDXP91C×××××××××\nLGDXPA1C×××××××××\nLGDXP91E×××××××××\nLGDXPA1E×××××××××\nLGDXP91G×××××××××\nLGDXPA1G×××××××××\nLGDCP91J×××××××××\nLGDCPA1J×××××××××\nLGD
2288	145	外形尺寸:	5995,6260×2000,2250×2600,2800,2900,3100(mm)
2289	145	货箱尺寸:	××(mm)
2290	145	总质量:	7360(Kg)
2291	145	载质量利用系数:	
2292	145	整备质量:	7165,7230(Kg)
2293	145	额定载质量:	(Kg)
2294	145	挂车质量:	(Kg)
2295	145	半挂鞍座:	
2296	145	驾驶室:	
2297	145	前排乘客:	2,3(人)
2298	145	额定载客：	(人)
2299	145	防抱死系统：	有
2300	145	接近角/离去角：	27.7/14,27.7/13(°)
2301	145	前悬/后悬：	1055/1632,1055/1897(mm)
2302	145	轴荷：	2640/4720
2303	145	轴距：	2700,2950,3308,3600,3800(mm)
2304	145	轴数：	2
2305	145	最高车速：	110(km/h)
2306	145	油耗：	(L/100Km)
2307	145	弹簧片数：	6/6+5,3/3+3,5/4+3,6/4+3,6/5+2,6/3+3,3/6+5,3/3+2,2/2,3/8+6,7/10+7
2308	145	轮胎数：	6(个)
2309	145	轮胎规格：	7.00R16,7.00R16LT,7.00R16LT 14PR,7.50R16LT 16PR
2310	145	前轮距：	1525,1519,1503,1613,1540(mm)
2311	145	后轮距：	1498,1516,1586,1670,1650,1800,1546(mm)
2312	145	制动前：	
2313	145	制动后：	
2314	145	制操前：	
2315	145	制操后：	
2316	145	转向形式：	方向盘
2317	145	起动方式：	
2318	145	Vin车辆识别代码:	LGDCP91C×××××××××\nLGDCPA1C×××××××××\nLGDCP91E×××××××××\nLGDCPA1E×××××××××\nLGDCP91G×××××××××\nLGDCPA1G×××××××××\nLGDXP91C×××××××××\nLGDXPA1C×××××××××\nLGDXP91E×××××××××\nLGDXPA1E×××××××××\nLGDXP91G×××××××××\nLGDXPA1G×××××××××\nLGDCP91J×××××××××\nLGDCPA1J×××××××××\nLGD
2319	146	外形尺寸:	7550,7960,8200,8550,8950,9300×2450,2500×3500,3800,3990,3850(mm)
2320	146	货箱尺寸:	××(mm)
2321	146	总质量:	18000,16000,14000,12495(Kg)
2322	146	载质量利用系数:	
2323	146	整备质量:	17870,17805,15870,15805,13870,13805,12365,12300(Kg)
2324	146	额定载质量:	(Kg)
2325	146	挂车质量:	(Kg)
2326	146	半挂鞍座:	
2327	146	驾驶室:	
2328	146	前排乘客:	2,3(人)
2329	146	额定载客：	(人)
2330	146	防抱死系统：	有
2331	146	接近角/离去角：	17/13,17/12,17/11(°)
2332	146	前悬/后悬：	1400/2350,1430/2320,1400/2360,1430/2330,1400/2300,1430/2270,1400/2650,1430/2620,1400/2550,1430/2520,1400/2900,1430/2870(mm)
2333	146	轴荷：	6500/11500,5760/10240,5040/8960,4500/7995
2334	146	轴距：	3800,3950,4200,4500,4700,5000,5300,5800,5600,5100(mm)
2335	146	轴数：	2
2336	146	最高车速：	89,98(km/h)
2337	146	油耗：	(L/100Km)
2338	146	弹簧片数：	7/9+6,8/10+8,8/9+6,11/10+8,3/10+8
2339	146	轮胎数：	6(个)
2340	146	轮胎规格：	10.00R20 18PR,275/80R22.5 18PR
2341	146	前轮距：	1876,1896,1920,1950,1914,1934,1980,2000,1815,1860(mm)
2342	146	后轮距：	1820,1860,1800,1840(mm)
2343	146	制动前：	
2344	146	制动后：	
2345	146	制操前：	
2346	146	制操后：	
2347	146	转向形式：	方向盘
2348	146	起动方式：	
2349	146	Vin车辆识别代码:	LGAX3A12×××××××××\nLGAX3B12×××××××××\nLGAX3C12×××××××××\nLGAX3A13×××××××××\nLGAX3B13×××××××××\nLGAX3C13×××××××××\nLGAX3A14×××××××××\nLGAX3B14×××××××××\nLGAX3C14×××××××××
2350	147	外形尺寸:	5660×1885×2000,2150(mm)
2351	147	货箱尺寸:	××(mm)
2352	147	总质量:	3295(Kg)
2353	147	载质量利用系数:	
2354	147	整备质量:	2970(Kg)
2355	147	额定载质量:	(Kg)
2356	147	挂车质量:	(Kg)
2357	147	半挂鞍座:	
2358	147	驾驶室:	
2359	147	前排乘客:	2+3(人)
2360	147	额定载客：	(人)
2361	147	防抱死系统：	有
2362	147	接近角/离去角：	33/26(°)
2363	147	前悬/后悬：	945/1309,985/1269(mm)
2364	147	轴荷：	1350/1945
2365	147	轴距：	3406(mm)
2366	147	轴数：	2
2367	147	最高车速：	140(km/h)
2368	147	油耗：	(L/100Km)
2369	147	弹簧片数：	-/5
2370	147	轮胎数：	4(个)
2371	147	轮胎规格：	245/70R17LT 10PR
2372	147	前轮距：	1570(mm)
2373	147	后轮距：	1570(mm)
2374	147	制动前：	
2375	147	制动后：	
2376	147	制操前：	
2377	147	制操后：	
2378	147	转向形式：	方向盘
2379	147	起动方式：	
2380	147	Vin车辆识别代码:	LWLTHCZH×××××××××
2381	148	外形尺寸:	6685,6830,6950,7190×1980,2010,2065×2490,2880,2990,3150(mm)
2382	148	货箱尺寸:	××(mm)
2383	148	总质量:	7020(Kg)
2384	148	载质量利用系数:	
2385	148	整备质量:	6695(Kg)
2386	148	额定载质量:	(Kg)
2387	148	挂车质量:	(Kg)
2388	148	半挂鞍座:	
2389	148	驾驶室:	
2390	148	前排乘客:	2+3(人)
2391	148	额定载客：	(人)
2392	148	防抱死系统：	有
2393	148	接近角/离去角：	24/14(°)
2394	148	前悬/后悬：	1015/1855,1015/2000,1015/2120,1015/2360(mm)
2395	148	轴荷：	2300/4720
2396	148	轴距：	3815(mm)
2397	148	轴数：	2
2398	148	最高车速：	95(km/h)
2399	148	油耗：	(L/100Km)
2400	148	弹簧片数：	8/6+5,3/3+2,3/3+3,3/4+3,3/5+2,3/5+3,6/6+6,7/6+5,7/6+4
2401	148	轮胎数：	6(个)
2402	148	轮胎规格：	7.00R16LT 14PR,7.00-16LT 14PR
2403	148	前轮距：	1504(mm)
2404	148	后轮距：	1425(mm)
2405	148	制动前：	
2406	148	制动后：	
2407	148	制操前：	
2408	148	制操后：	
2409	148	转向形式：	方向盘
2410	148	起动方式：	
2411	148	Vin车辆识别代码:	LWLDNBUH×××××××××\nLWLDNFMH×××××××××\nLWLDNMTH×××××××××
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

SELECT pg_catalog.setval('public.category_id_seq', 7, true);


--
-- Name: conf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.conf_id_seq', 4, true);


--
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.feedback_id_seq', 36, true);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.image_id_seq', 439, true);


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

SELECT pg_catalog.setval('public.node_id_seq', 148, true);


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

SELECT pg_catalog.setval('public.region_id_seq', 24, true);


--
-- Name: spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rj
--

SELECT pg_catalog.setval('public.spec_id_seq', 2411, true);


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

