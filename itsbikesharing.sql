--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-06-12 16:52:28

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
-- TOC entry 217 (class 1259 OID 49317)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: nure
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO nure;

--
-- TOC entry 218 (class 1259 OID 49320)
-- Name: kendaraan; Type: TABLE; Schema: public; Owner: nure
--

CREATE TABLE public.kendaraan (
    kendaraan_id integer NOT NULL,
    merk character varying(50),
    tipe character varying(50),
    status character varying(50),
    stasiun_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.kendaraan OWNER TO nure;

--
-- TOC entry 219 (class 1259 OID 49323)
-- Name: kendaraan_kendaraan_id_seq; Type: SEQUENCE; Schema: public; Owner: nure
--

CREATE SEQUENCE public.kendaraan_kendaraan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kendaraan_kendaraan_id_seq OWNER TO nure;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 219
-- Name: kendaraan_kendaraan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nure
--

ALTER SEQUENCE public.kendaraan_kendaraan_id_seq OWNED BY public.kendaraan.kendaraan_id;


--
-- TOC entry 220 (class 1259 OID 49324)
-- Name: layanan; Type: TABLE; Schema: public; Owner: nure
--

CREATE TABLE public.layanan (
    layanan_id integer NOT NULL,
    nama_layanan character varying(100) NOT NULL,
    deskripsi text,
    biaya_dasar numeric(10,2),
    status boolean
);


ALTER TABLE public.layanan OWNER TO nure;

--
-- TOC entry 221 (class 1259 OID 49329)
-- Name: layanan_layanan_id_seq; Type: SEQUENCE; Schema: public; Owner: nure
--

CREATE SEQUENCE public.layanan_layanan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.layanan_layanan_id_seq OWNER TO nure;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 221
-- Name: layanan_layanan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nure
--

ALTER SEQUENCE public.layanan_layanan_id_seq OWNED BY public.layanan.layanan_id;


--
-- TOC entry 222 (class 1259 OID 49330)
-- Name: log_laporan; Type: TABLE; Schema: public; Owner: nure
--

CREATE TABLE public.log_laporan (
    log_laporan_id integer NOT NULL,
    kendaraan_id integer NOT NULL,
    tanggal_pemeliharaan timestamp without time zone,
    laporan text,
    status character varying(50),
    tanggal_laporan timestamp without time zone,
    nrp character varying(50) NOT NULL
);


ALTER TABLE public.log_laporan OWNER TO nure;

--
-- TOC entry 223 (class 1259 OID 49335)
-- Name: log_pemeliharaan_log_pemeliharaan_id_seq; Type: SEQUENCE; Schema: public; Owner: nure
--

CREATE SEQUENCE public.log_pemeliharaan_log_pemeliharaan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.log_pemeliharaan_log_pemeliharaan_id_seq OWNER TO nure;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 223
-- Name: log_pemeliharaan_log_pemeliharaan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nure
--

ALTER SEQUENCE public.log_pemeliharaan_log_pemeliharaan_id_seq OWNED BY public.log_laporan.log_laporan_id;


--
-- TOC entry 224 (class 1259 OID 49336)
-- Name: stasiun; Type: TABLE; Schema: public; Owner: nure
--

CREATE TABLE public.stasiun (
    stasiun_id integer NOT NULL,
    nama_stasiun character varying(100) NOT NULL,
    alamat character varying(255),
    status character varying(50),
    latitude integer,
    longtitude integer
);


ALTER TABLE public.stasiun OWNER TO nure;

--
-- TOC entry 225 (class 1259 OID 49339)
-- Name: stasiun_stasiun_id_seq; Type: SEQUENCE; Schema: public; Owner: nure
--

CREATE SEQUENCE public.stasiun_stasiun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stasiun_stasiun_id_seq OWNER TO nure;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 225
-- Name: stasiun_stasiun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nure
--

ALTER SEQUENCE public.stasiun_stasiun_id_seq OWNED BY public.stasiun.stasiun_id;


--
-- TOC entry 226 (class 1259 OID 49340)
-- Name: transaksi; Type: TABLE; Schema: public; Owner: nure
--

CREATE TABLE public.transaksi (
    transaksi_id integer NOT NULL,
    user_nrp character varying(50) NOT NULL,
    kendaraan_id integer,
    stasiun_ambil_id integer,
    stasiun_kembali_id integer,
    waktu_selesai timestamp without time zone,
    waktu_pembayaran timestamp without time zone,
    status_transaksi character varying(50),
    payment_gateway_ref character varying(100),
    total_biaya numeric(10,2),
    deposit_dipegang numeric(10,2),
    waktu_mulai timestamp without time zone
);


ALTER TABLE public.transaksi OWNER TO nure;

--
-- TOC entry 227 (class 1259 OID 49343)
-- Name: transaksi_layanan; Type: TABLE; Schema: public; Owner: nure
--

CREATE TABLE public.transaksi_layanan (
    transaksi_layanan_id integer NOT NULL,
    transaksi_id integer NOT NULL,
    layanan_id integer NOT NULL
);


ALTER TABLE public.transaksi_layanan OWNER TO nure;

--
-- TOC entry 228 (class 1259 OID 49346)
-- Name: transaksi_layanan_transaksi_layanan_id_seq; Type: SEQUENCE; Schema: public; Owner: nure
--

CREATE SEQUENCE public.transaksi_layanan_transaksi_layanan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaksi_layanan_transaksi_layanan_id_seq OWNER TO nure;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 228
-- Name: transaksi_layanan_transaksi_layanan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nure
--

ALTER SEQUENCE public.transaksi_layanan_transaksi_layanan_id_seq OWNED BY public.transaksi_layanan.transaksi_layanan_id;


--
-- TOC entry 229 (class 1259 OID 49347)
-- Name: transaksi_transaksi_id_seq; Type: SEQUENCE; Schema: public; Owner: nure
--

CREATE SEQUENCE public.transaksi_transaksi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaksi_transaksi_id_seq OWNER TO nure;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 229
-- Name: transaksi_transaksi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nure
--

ALTER SEQUENCE public.transaksi_transaksi_id_seq OWNED BY public.transaksi.transaksi_id;


--
-- TOC entry 230 (class 1259 OID 49348)
-- Name: user; Type: TABLE; Schema: public; Owner: nure
--

CREATE TABLE public."user" (
    nrp character varying(50) NOT NULL,
    nama character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    no_hp character varying(20),
    role character varying(50),
    created_at timestamp without time zone
);


ALTER TABLE public."user" OWNER TO nure;

--
-- TOC entry 4775 (class 2604 OID 49434)
-- Name: kendaraan kendaraan_id; Type: DEFAULT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.kendaraan ALTER COLUMN kendaraan_id SET DEFAULT nextval('public.kendaraan_kendaraan_id_seq'::regclass);


--
-- TOC entry 4776 (class 2604 OID 49435)
-- Name: layanan layanan_id; Type: DEFAULT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.layanan ALTER COLUMN layanan_id SET DEFAULT nextval('public.layanan_layanan_id_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 49436)
-- Name: log_laporan log_laporan_id; Type: DEFAULT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.log_laporan ALTER COLUMN log_laporan_id SET DEFAULT nextval('public.log_pemeliharaan_log_pemeliharaan_id_seq'::regclass);


--
-- TOC entry 4778 (class 2604 OID 49437)
-- Name: stasiun stasiun_id; Type: DEFAULT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.stasiun ALTER COLUMN stasiun_id SET DEFAULT nextval('public.stasiun_stasiun_id_seq'::regclass);


--
-- TOC entry 4779 (class 2604 OID 49438)
-- Name: transaksi transaksi_id; Type: DEFAULT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.transaksi ALTER COLUMN transaksi_id SET DEFAULT nextval('public.transaksi_transaksi_id_seq'::regclass);


--
-- TOC entry 4780 (class 2604 OID 49439)
-- Name: transaksi_layanan transaksi_layanan_id; Type: DEFAULT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.transaksi_layanan ALTER COLUMN transaksi_layanan_id SET DEFAULT nextval('public.transaksi_layanan_transaksi_layanan_id_seq'::regclass);


--
-- TOC entry 4953 (class 0 OID 49317)
-- Dependencies: 217
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: nure
--

COPY public.alembic_version (version_num) FROM stdin;
f6a3b394eac1
\.


--
-- TOC entry 4954 (class 0 OID 49320)
-- Dependencies: 218
-- Data for Name: kendaraan; Type: TABLE DATA; Schema: public; Owner: nure
--

COPY public.kendaraan (kendaraan_id, merk, tipe, status, stasiun_id, created_at) FROM stdin;
12	ITS-204	City Cruiser V1	TERSEDIA	12	2024-11-15 15:00:00
11	MBDC-106	Urban Explorer Z	TERSEDIA	11	2024-10-11 11:20:00
13	SBYU-303	Eco-Bike Lite	TERSEDIA	13	2024-11-25 18:00:00
14	MBDC-107	City Cruiser V1	DISEWA	14	2024-10-15 09:00:00
17	SBYU-304	City Cruiser V1	Dalam Perbaikan	6	2024-11-28 10:00:00
18	MBDC-109	Urban Explorer Z	Dalam Perbaikan	15	2024-10-20 22:00:00
19	ITS-206	Eco-Bike Lite	Digunakan	\N	2024-11-20 08:10:00
20	MBDC-110	City Cruiser V1	Digunakan	\N	2024-10-22 23:50:00
22	MBDC-111	City Cruiser V1	Tersedia	19	2025-01-15 11:35:00
23	ITS-207	Eco-Bike Lite	Tersedia	18	2025-02-01 14:00:00
25	SBYU-306	Urban Explorer Z	Tersedia	16	2025-02-10 16:20:00
26	MBDC-113	Eco-Bike Lite	Tersedia	14	2025-02-11 09:00:00
27	ITS-208	City Cruiser V1	Tersedia	13	2025-03-05 10:45:00
28	MBDC-114	Urban Explorer Z	Tersedia	12	2025-03-05 11:00:00
29	SBYU-307	Eco-Bike Lite	Tersedia	11	2025-03-12 13:10:00
30	MBDC-115	City Cruiser V1	Tersedia	10	2025-03-12 13:15:00
31	ITS-209	Urban Explorer Z	Tersedia	9	2025-04-01 17:00:00
32	MBDC-116	Eco-Bike Lite	Tersedia	8	2025-04-02 18:30:00
34	MBDC-117	Urban Explorer Z	Tersedia	5	2025-04-11 07:45:00
35	ITS-210	Eco-Bike Lite	Tersedia	4	2025-05-20 09:55:00
36	MBDC-118	City Cruiser V1	Dalam Perbaikan	1	2025-05-21 14:00:00
37	SBYU-309	Urban Explorer Z	Dalam Perbaikan	2	2025-05-22 15:00:00
38	MBDC-119	Eco-Bike Lite	Digunakan	\N	2025-05-25 16:30:00
39	ITS-211	City Cruiser V1	Digunakan	\N	2025-06-01 19:00:00
40	MBDC-120	Urban Explorer Z	Digunakan	\N	2025-06-10 21:00:00
33	SBYU-308	City Cruiser V1	DISEWA	7	2025-04-10 20:00:00
10	MBDC-105	Eco-Bike Lite	TERSEDIA	10	2024-10-10 13:00:00
15	ITS-205	Urban Explorer Z	TERSEDIA	16	2024-11-18 19:30:00
1	MBDC-101	City Cruiser V1	TERSEDIA	1	2024-10-05 08:00:00
16	MBDC-108	Eco-Bike Lite	TERSEDIA	17	2024-10-18 12:00:00
2	MBDC-102	City Cruiser V1	TERSEDIA	2	2024-10-05 08:05:00
8	MBDC-104	Urban Explorer Z	TERSEDIA	8	2024-10-08 16:45:00
24	MBDC-112	City Cruiser V1	TERSEDIA	17	2025-02-01 14:05:00
3	ITS-201	Eco-Bike Lite	TERSEDIA	3	2024-11-12 09:30:00
4	ITS-202	Eco-Bike Lite	TERSEDIA	3	2024-11-12 09:35:00
5	SBYU-301	Urban Explorer Z	TERSEDIA	4	2024-11-20 11:00:00
6	MBDC-103	City Cruiser V1	TERSEDIA	5	2024-10-06 14:00:00
9	SBYU-302	City Cruiser V1	TERSEDIA	9	2024-11-22 07:00:00
7	ITS-203	Eco-Bike Lite	TERSEDIA	7	2024-11-13 10:15:00
21	SBYU-305	Urban Explorer Z	TERSEDIA	20	2025-01-15 11:30:00
\.


--
-- TOC entry 4956 (class 0 OID 49324)
-- Dependencies: 220
-- Data for Name: layanan; Type: TABLE DATA; Schema: public; Owner: nure
--

COPY public.layanan (layanan_id, nama_layanan, deskripsi, biaya_dasar, status) FROM stdin;
1	Asuransi Kerusakan Ringan	Melindungi pengguna dari biaya perbaikan kerusakan kecil.	5000.00	t
2	Proteksi Kehilangan	Mengurangi denda jika sepeda hilang sesuai syarat & ketentuan.	10000.00	t
3	Paket Harian 24 Jam	Gunakan sepeda sepuasnya selama 24 jam dengan harga tetap.	75000.00	\N
\.


--
-- TOC entry 4958 (class 0 OID 49330)
-- Dependencies: 222
-- Data for Name: log_laporan; Type: TABLE DATA; Schema: public; Owner: nure
--

COPY public.log_laporan (log_laporan_id, kendaraan_id, tanggal_pemeliharaan, laporan, status, tanggal_laporan, nrp) FROM stdin;
1	5	2025-04-03 14:00:00	Rantai sepeda berisik dan sering lepas.	Selesai	2025-04-01 10:20:00	5025231005
2	11	2025-04-06 11:30:00	Rem belakang kurang pakem, perlu disetel ulang.	Selesai	2025-04-05 15:00:00	5025231006
3	22	2025-04-11 16:00:00	Lampu depan sepeda mati total.	Selesai	2025-04-10 19:45:00	5025231007
4	30	2025-04-15 17:00:00	Sadel sepeda tidak bisa diatur ketinggiannya, macet.	Selesai	2025-04-15 08:10:00	5025231008
5	8	2025-04-22 13:00:00	Standar sepeda goyang dan terasa akan copot.	Selesai	2025-04-21 11:50:00	5025231009
6	14	2025-04-30 10:00:00	Gear shifter terasa berat saat dipindahkan ke gigi yang lebih tinggi.	Selesai	2025-04-28 16:00:00	5025231010
7	3	2025-05-02 14:30:00	Ban depan kempes, sepertinya bocor halus.	Selesai	2025-05-02 09:00:00	5025231011
8	25	2025-05-06 09:00:00	Bel sepeda tidak berbunyi.	Selesai	2025-05-05 12:30:00	5025231012
9	33	2025-05-11 11:00:00	Pedal sebelah kanan terasa longgar.	Selesai	2025-05-10 18:20:00	5025231013
10	1	2025-05-14 15:00:00	Ada suara decitan aneh dari roda belakang saat digowes kencang.	Selesai	2025-05-12 14:00:00	5025231014
11	23	2025-05-17 10:30:00	Kunci sepeda kadang macet saat akan dikunci manual.	Selesai	2025-05-15 20:00:00	5025231015
12	10	2025-05-19 13:45:00	Stang sepeda terasa sedikit miring ke kiri.	Selesai	2025-05-18 11:00:00	5025231016
13	17	\N	Rem depan blong total, sangat berbahaya untuk digunakan.	Dalam Pengerjaan	2025-05-25 08:00:00	5025231017
14	18	\N	Frame sepeda terlihat ada retakan kecil di dekat sambungan sadel.	Dalam Pengerjaan	2025-05-28 17:30:00	5025231018
15	36	\N	Roda depan goyang parah (oblak), sepertinya bearing perlu diganti.	Dalam Pengerjaan	2025-06-01 10:00:00	5025231019
16	37	\N	Sistem GPS pada sepeda tidak akurat, lokasinya sering loncat-loncat.	Dalam Pengerjaan	2025-06-03 13:15:00	5025231020
17	2	\N	Ban belakang gundul, sudah tidak aman untuk jalan basah.	Dilaporkan	2025-06-08 16:00:00	5025231005
18	26	\N	Saat digowes ada bunyi "krek krek" dari bagian gear tengah.	Dilaporkan	2025-06-09 11:25:00	5025231008
19	4	\N	Cat di beberapa bagian body sepeda sudah mengelupas parah.	Dilaporkan	2025-06-10 09:00:00	5025231011
20	28	\N	Pegangan stang (handgrip) sebelah kanan sobek dan licin.	Dilaporkan	2025-06-11 19:30:00	5025231014
21	13	\N	2222	Dilaporkan	2025-06-12 03:31:32.577995	111
22	10	\N	2e22	Dilaporkan	2025-06-12 03:48:52.673304	111
\.


--
-- TOC entry 4960 (class 0 OID 49336)
-- Dependencies: 224
-- Data for Name: stasiun; Type: TABLE DATA; Schema: public; Owner: nure
--

COPY public.stasiun (stasiun_id, nama_stasiun, alamat, status, latitude, longtitude) FROM stdin;
1	Stasiun Balai Kota Surabaya	Jl. Taman Surya No.1, Surabaya	Aktif	-7	\N
2	Stasiun Tunjungan Plaza	Jl. Basuki Rahmat No. 8-12, Surabaya	Aktif	-7	\N
3	Stasiun ITS (Teknik Informatika)	Gedung Teknik Informatika ITS, Surabaya	Aktif	-7	\N
4	Stasiun Taman Bungkul	Jl. Taman Bungkul, Darmo, Surabaya	Aktif	-7	\N
5	Stasiun Galaxy Mall 3	Jl. Dr. Ir. H. Soekarno No. 178, Surabaya	Aktif	-7	\N
6	Stasiun Universitas Airlangga (Kampus C)	Jl. Mulyorejo, Surabaya	Dalam Perbaikan	-7	\N
7	Stasiun Stasiun Gubeng	Jl. Stasiun Gubeng, Pacar Keling, Surabaya	Aktif	-7	\N
8	Stasiun Ciputra World	Jl. Mayjend Sungkono No. 89, Surabaya	Aktif	-7	\N
9	Stasiun Monumen Kapal Selam	Jl. Pemuda No. 39, Surabaya	Aktif	-7	\N
10	Stasiun Kebun Binatang Surabaya	Jl. Setail No. 1, Darmo, Surabaya	Aktif	-7	\N
11	Stasiun Royal Plaza	Jl. Ahmad Yani No. 16-18, Surabaya	Aktif	-7	\N
12	Stasiun Universitas Surabaya (UBAYA)	Jl. Raya Kalirungkut, Surabaya	Aktif	-7	\N
13	Stasiun Food Junction Grand Pakuwon	Jl. Grand Banjar Boulevard, Tandes, Surabaya	Aktif	-7	\N
14	Stasiun Jembatan Merah Plaza	Jl. Taman Jayengrono No. 2-4, Surabaya	Aktif	-7	\N
15	Stasiun Balai Pemuda	Jl. Gubernur Suryo No. 15, Surabaya	Dalam Perbaikan	-7	\N
16	Stasiun Pakuwon Mall	Jl. Mayjend Yono Soewoyo No. 2, Surabaya	Aktif	-7	\N
17	Stasiun Masjid Nasional Al-Akbar	Jl. Masjid Al-Akbar Timur No. 1, Surabaya	Aktif	-7	\N
18	Stasiun Kenjeran Park	Jl. Sukolilo No. 100, Surabaya	Aktif	-7	\N
19	Stasiun Terminal Bungurasih	Jl. Letjend Sutoyo, Bungurasih, Sidoarjo	Aktif	-7	\N
20	Stasiun Universitas Negeri Surabaya (UNESA)	Jl. Lidah Wetan, Surabaya	Aktif	-7	\N
\.


--
-- TOC entry 4962 (class 0 OID 49340)
-- Dependencies: 226
-- Data for Name: transaksi; Type: TABLE DATA; Schema: public; Owner: nure
--

COPY public.transaksi (transaksi_id, user_nrp, kendaraan_id, stasiun_ambil_id, stasiun_kembali_id, waktu_selesai, waktu_pembayaran, status_transaksi, payment_gateway_ref, total_biaya, deposit_dipegang, waktu_mulai) FROM stdin;
61	5025231010	21	1	10	2025-06-07 08:35:00	2025-06-07 08:35:04	COMPLETED	chg_5a5a5a	5000.00	50000.00	2025-06-07 08:10:00
1	5025231005	1	1	4	2025-05-10 08:28:00	2025-05-10 08:28:05	COMPLETED	chg_1a1a1a	5000.00	50000.00	2025-05-10 08:00:00
2	5025231006	2	2	9	2025-05-10 09:44:00	2025-05-10 09:44:02	COMPLETED	chg_1b1b1b	5000.00	50000.00	2025-05-10 09:15:00
3	5025231007	3	3	7	2025-05-11 10:31:00	2025-05-11 10:31:01	COMPLETED	chg_1c1c1c	7500.00	50000.00	2025-05-11 10:00:00
4	5025231008	4	3	1	2025-05-11 12:32:00	2025-05-11 12:32:05	COMPLETED	chg_1d1d1d	12500.00	50000.00	2025-05-11 11:30:00
5	5025231009	5	4	10	2025-05-12 13:59:00	2025-05-12 13:59:03	COMPLETED	chg_1e1e1e	10000.00	50000.00	2025-05-12 13:00:00
6	5025231010	6	5	2	2025-05-12 15:18:00	2025-05-12 15:18:01	COMPLETED	chg_1f1f1f	10000.00	50000.00	2025-05-12 14:20:00
7	5025231011	7	7	3	2025-05-13 17:55:00	2025-05-13 17:55:04	COMPLETED	chg_1g1g1g	20000.00	50000.00	2025-05-13 16:00:00
8	5025231012	8	8	11	2025-05-13 19:40:00	2025-05-13 19:40:02	COMPLETED	chg_1h1h1h	15000.00	50000.00	2025-05-13 18:10:00
9	5025231013	9	9	14	2025-05-14 07:55:00	2025-05-14 07:55:01	COMPLETED	chg_1i1i1i	5000.00	50000.00	2025-05-14 07:30:00
10	5025231014	10	10	5	2025-05-14 09:50:00	2025-05-14 09:50:03	COMPLETED	chg_1j1j1j	12500.00	50000.00	2025-05-14 08:45:00
11	5025231015	11	11	1	2025-05-15 11:14:00	2025-05-15 11:14:01	COMPLETED	chg_1k1k1k	2500.00	50000.00	2025-05-15 11:00:00
12	5025231016	12	12	20	2025-05-15 12:40:00	2025-05-15 12:40:05	COMPLETED	chg_1l1l1l	7500.00	50000.00	2025-05-15 12:00:00
13	5025231017	13	13	19	2025-05-16 16:30:00	2025-05-16 16:30:02	COMPLETED	chg_1m1m1m	20000.00	50000.00	2025-05-16 14:30:00
14	5025231018	14	14	1	2025-05-16 17:25:00	2025-05-16 17:25:01	COMPLETED	chg_1n1n1n	5000.00	50000.00	2025-05-16 17:00:00
15	5025231019	15	16	12	2025-05-17 19:29:00	2025-05-17 19:29:03	COMPLETED	chg_1o1o1o	5000.00	50000.00	2025-05-17 19:00:00
16	5025231020	16	17	10	2025-05-17 21:05:00	2025-05-17 21:05:01	COMPLETED	chg_1p1p1p	10000.00	50000.00	2025-05-17 20:10:00
17	5025231005	21	20	15	2025-05-18 09:58:00	2025-05-18 09:58:02	COMPLETED	chg_1q1q1q	5000.00	50000.00	2025-05-18 09:30:00
18	5025231006	22	19	13	2025-05-18 10:46:00	2025-05-18 10:46:01	COMPLETED	chg_1r1r1r	7500.00	50000.00	2025-05-18 10:15:00
19	5025231007	23	18	1	2025-05-19 12:22:00	2025-05-19 12:22:04	COMPLETED	chg_1s1s1s	12500.00	50000.00	2025-05-19 11:20:00
20	5025231008	24	17	2	2025-05-19 13:59:00	2025-05-19 13:59:02	COMPLETED	chg_1t1t1t	10000.00	50000.00	2025-05-19 13:00:00
21	5025231009	25	16	4	2025-05-20 15:08:00	2025-05-20 15:08:01	COMPLETED	chg_1u1u1u	10000.00	50000.00	2025-05-20 14:10:00
22	5025231010	26	14	5	2025-05-20 17:55:00	2025-05-20 17:55:03	COMPLETED	chg_1v1v1v	20000.00	50000.00	2025-05-20 16:00:00
23	5025231011	27	13	7	2025-05-21 19:30:00	2025-05-21 19:30:01	COMPLETED	chg_1w1w1w	15000.00	50000.00	2025-05-21 18:00:00
24	5025231012	28	12	8	2025-05-21 08:10:00	2025-05-21 08:10:02	COMPLETED	chg_1x1x1x	5000.00	50000.00	2025-05-21 07:45:00
25	5025231013	29	11	9	2025-05-22 09:55:00	2025-05-22 09:55:01	COMPLETED	chg_1y1y1y	12500.00	50000.00	2025-05-22 08:50:00
26	5025231014	30	10	11	2025-05-22 11:29:00	2025-05-22 11:29:03	COMPLETED	chg_1z1z1z	2500.00	50000.00	2025-05-22 11:15:00
27	5025231015	31	9	12	2025-05-23 13:10:00	2025-05-23 13:10:01	COMPLETED	chg_2a2a2a	7500.00	50000.00	2025-05-23 12:30:00
28	5025231016	32	8	13	2025-05-23 16:00:00	2025-05-23 16:00:04	COMPLETED	chg_2b2b2b	20000.00	50000.00	2025-05-23 14:00:00
29	5025231017	33	7	14	2025-05-24 17:55:00	2025-05-24 17:55:01	COMPLETED	chg_2c2c2c	5000.00	50000.00	2025-05-24 17:30:00
30	5025231018	34	5	16	2025-05-24 19:29:00	2025-05-24 19:29:02	COMPLETED	chg_2d2d2d	5000.00	50000.00	2025-05-24 19:00:00
31	5025231019	35	4	17	2025-05-25 21:00:00	2025-05-25 21:00:01	COMPLETED	chg_2e2e2e	10000.00	50000.00	2025-05-25 20:00:00
32	5025231020	1	1	18	2025-05-25 09:28:00	2025-05-25 09:28:05	COMPLETED	chg_2f2f2f	5000.00	50000.00	2025-05-25 09:00:00
33	5025231005	2	2	19	2025-05-26 10:44:00	2025-05-26 10:44:02	COMPLETED	chg_2g2g2g	5000.00	50000.00	2025-05-26 10:15:00
34	5025231006	3	3	20	2025-05-26 11:31:00	2025-05-26 11:31:01	COMPLETED	chg_2h2h2h	7500.00	50000.00	2025-05-26 11:00:00
35	5025231007	4	3	1	2025-05-27 13:32:00	2025-05-27 13:32:05	COMPLETED	chg_2i2i2i	12500.00	50000.00	2025-05-27 12:30:00
36	5025231008	5	4	2	2025-05-27 14:59:00	2025-05-27 14:59:03	COMPLETED	chg_2j2j2j	10000.00	50000.00	2025-05-27 14:00:00
37	5025231009	6	5	3	2025-05-28 16:18:00	2025-05-28 16:18:01	COMPLETED	chg_2k2k2k	10000.00	50000.00	2025-05-28 15:20:00
38	5025231010	7	7	4	2025-05-28 18:55:00	2025-05-28 18:55:04	COMPLETED	chg_2l2l2l	20000.00	50000.00	2025-05-28 17:00:00
39	5025231011	8	8	5	2025-05-29 20:40:00	2025-05-29 20:40:02	COMPLETED	chg_2m2m2m	15000.00	50000.00	2025-05-29 19:10:00
40	5025231012	9	9	6	2025-05-29 08:55:00	2025-05-29 08:55:01	COMPLETED	chg_2n2n2n	5000.00	50000.00	2025-05-29 08:30:00
41	5025231013	10	10	7	2025-05-30 10:50:00	2025-05-30 10:50:03	COMPLETED	chg_2o2o2o	12500.00	50000.00	2025-05-30 09:45:00
42	5025231014	11	11	8	2025-05-30 12:14:00	2025-05-30 12:14:01	COMPLETED	chg_2p2p2p	2500.00	50000.00	2025-05-30 12:00:00
43	5025231015	12	12	9	2025-05-31 13:40:00	2025-05-31 13:40:05	COMPLETED	chg_2q2q2q	7500.00	50000.00	2025-05-31 13:00:00
44	5025231016	13	13	10	2025-06-01 17:30:00	2025-06-01 17:30:02	COMPLETED	chg_2r2r2r	20000.00	50000.00	2025-06-01 15:30:00
45	5025231017	14	14	11	2025-06-01 18:25:00	2025-06-01 18:25:01	COMPLETED	chg_2s2s2s	5000.00	50000.00	2025-06-01 18:00:00
46	5025231018	19	3	\N	\N	\N	ONGOING	chg_3a3a3a	\N	50000.00	2025-06-11 19:00:00
47	5025231019	20	4	\N	\N	\N	ONGOING	chg_3b3b3b	\N	50000.00	2025-06-11 20:15:00
48	5025231020	38	10	\N	\N	\N	ONGOING	chg_3c3c3c	\N	50000.00	2025-06-11 21:30:00
49	5025231005	39	12	\N	\N	\N	ONGOING	chg_3d3d3d	\N	50000.00	2025-06-11 22:45:00
50	5025231006	40	1	\N	\N	\N	ONGOING	chg_3e3e3e	\N	50000.00	2025-06-11 23:05:00
51	5025231007	15	16	12	2025-06-02 09:29:00	\N	PAYMENT_FAILED	chg_4a4a4a	5000.00	50000.00	2025-06-02 09:00:00
52	5025231008	16	17	10	2025-06-02 11:05:00	\N	PAYMENT_FAILED	chg_4b4b4b	10000.00	50000.00	2025-06-02 10:10:00
53	5025231009	21	20	15	\N	\N	CANCELED	chg_4c4c4c	0.00	50000.00	2025-06-03 11:30:00
54	5025231010	22	19	13	\N	\N	CANCELED	chg_4d4d4d	0.00	50000.00	2025-06-03 12:15:00
55	5025231011	23	18	1	2025-06-04 14:22:00	\N	PAYMENT_FAILED	chg_4e4e4e	12500.00	50000.00	2025-06-04 13:20:00
56	5025231012	24	17	2	\N	\N	CANCELED	chg_4f4f4f	0.00	50000.00	2025-06-04 15:00:00
57	5025231013	25	16	4	2025-06-05 17:08:00	\N	PAYMENT_FAILED	chg_4g4g4g	10000.00	50000.00	2025-06-05 16:10:00
58	5025231014	26	14	5	\N	\N	CANCELED	chg_4h4h4h	0.00	50000.00	2025-06-05 18:00:00
59	5025231015	27	13	7	2025-06-06 20:30:00	\N	PAYMENT_FAILED	chg_4i4i4i	15000.00	50000.00	2025-06-06 19:00:00
60	5025231016	28	12	8	\N	\N	CANCELED	chg_4j4j4j	0.00	50000.00	2025-06-06 07:45:00
62	5025231011	22	2	11	2025-06-07 09:55:00	2025-06-07 09:55:02	COMPLETED	chg_5b5b5b	10000.00	50000.00	2025-06-07 09:00:00
63	5025231012	23	3	12	2025-06-07 10:59:00	2025-06-07 10:59:01	COMPLETED	chg_5c5c5c	5000.00	50000.00	2025-06-07 10:30:00
64	5025231013	24	4	13	2025-06-07 12:10:00	2025-06-07 12:10:03	COMPLETED	chg_5d5d5d	10000.00	50000.00	2025-06-07 11:15:00
65	5025231014	25	5	14	2025-06-07 13:20:00	2025-06-07 13:20:01	COMPLETED	chg_5e5e5e	5000.00	50000.00	2025-06-07 13:00:00
66	5025231015	26	6	15	2025-06-07 16:00:00	2025-06-07 16:00:05	COMPLETED	chg_5f5f5f	12500.00	50000.00	2025-06-07 14:45:00
67	5025231016	27	7	16	2025-06-07 17:12:00	2025-06-07 17:12:02	COMPLETED	chg_5g5g5g	2500.00	50000.00	2025-06-07 17:00:00
68	5025231017	28	8	17	2025-06-07 18:55:00	2025-06-07 18:55:01	COMPLETED	chg_5h5h5h	7500.00	50000.00	2025-06-07 18:20:00
69	5025231018	29	9	18	2025-06-07 21:30:00	2025-06-07 21:30:03	COMPLETED	chg_5i5i5i	20000.00	50000.00	2025-06-07 19:30:00
70	5025231019	30	10	19	2025-06-07 22:40:00	2025-06-07 22:40:01	COMPLETED	chg_5j5j5j	7500.00	50000.00	2025-06-07 22:00:00
71	5025231020	31	11	20	2025-06-08 08:44:00	2025-06-08 08:44:02	COMPLETED	chg_5k5k5k	2500.00	50000.00	2025-06-08 08:30:00
72	5025231005	32	12	1	2025-06-08 10:15:00	2025-06-08 10:15:01	COMPLETED	chg_5l5l5l	12500.00	50000.00	2025-06-08 09:10:00
73	5025231006	33	13	2	2025-06-08 11:25:00	2025-06-08 11:25:04	COMPLETED	chg_5m5m5m	5000.00	50000.00	2025-06-08 11:00:00
74	5025231007	34	14	3	2025-06-08 13:40:00	2025-06-08 13:40:01	COMPLETED	chg_5n5n5n	10000.00	50000.00	2025-06-08 12:40:00
75	5025231008	35	15	4	2025-06-08 14:29:00	2025-06-08 14:29:02	COMPLETED	chg_5o5o5o	5000.00	50000.00	2025-06-08 14:00:00
76	5025231009	1	1	5	2025-06-08 16:20:00	2025-06-08 16:20:01	COMPLETED	chg_5p5p5p	15000.00	50000.00	2025-06-08 15:00:00
77	5025231010	2	2	6	2025-06-08 17:50:00	2025-06-08 17:50:03	COMPLETED	chg_5q5q5q	5000.00	50000.00	2025-06-08 17:30:00
78	5025231011	3	3	7	2025-06-08 18:40:00	2025-06-08 18:40:01	COMPLETED	chg_5r5r5r	7500.00	50000.00	2025-06-08 18:00:00
79	5025231012	4	4	8	2025-06-08 22:00:00	2025-06-08 22:00:05	COMPLETED	chg_5s5s5s	22500.00	50000.00	2025-06-08 19:50:00
80	5025231013	5	5	9	2025-06-08 22:55:00	2025-06-08 22:55:01	COMPLETED	chg_5t5t5t	7500.00	50000.00	2025-06-08 22:10:00
81	5025231014	6	6	10	2025-06-09 09:18:00	2025-06-09 09:18:02	COMPLETED	chg_5u5u5u	2500.00	50000.00	2025-06-09 09:05:00
82	5025231015	7	7	11	2025-06-09 11:05:00	2025-06-09 11:05:01	COMPLETED	chg_5v5v5v	12500.00	50000.00	2025-06-09 10:00:00
83	5025231016	8	8	12	2025-06-09 12:40:00	2025-06-09 12:40:03	COMPLETED	chg_5w5w5w	5000.00	50000.00	2025-06-09 12:15:00
84	5025231017	9	9	13	2025-06-09 14:20:00	2025-06-09 14:20:01	COMPLETED	chg_5x5x5x	10000.00	50000.00	2025-06-09 13:20:00
85	5025231018	10	10	14	2025-06-09 15:24:00	2025-06-09 15:24:02	COMPLETED	chg_5y5y5y	5000.00	50000.00	2025-06-09 15:00:00
86	5025231019	11	11	15	2025-06-09 17:50:00	2025-06-09 17:50:01	COMPLETED	chg_5z5z5z	15000.00	50000.00	2025-06-09 16:30:00
87	5025231020	12	12	16	2025-06-09 18:11:00	2025-06-09 18:11:04	COMPLETED	chg_6a6a6a	2500.00	50000.00	2025-06-09 18:00:00
88	5025231005	13	13	17	2025-06-09 19:59:00	2025-06-09 19:59:01	COMPLETED	chg_6b6b6b	7500.00	50000.00	2025-06-09 19:25:00
89	5025231006	14	14	18	2025-06-09 23:30:00	2025-06-09 23:30:03	COMPLETED	chg_6c6c6c	30000.00	50000.00	2025-06-09 20:30:00
90	5025231007	15	15	19	2025-06-10 00:25:00	2025-06-10 00:25:01	COMPLETED	chg_6d6d6d	7500.00	50000.00	2025-06-09 23:45:00
91	5025231008	16	16	20	2025-06-10 08:14:00	2025-06-10 08:14:02	COMPLETED	chg_6e6e6e	2500.00	50000.00	2025-06-10 08:00:00
92	5025231009	21	1	2	2025-06-10 10:15:00	2025-06-10 10:15:01	COMPLETED	chg_6f6f6f	12500.00	50000.00	2025-06-10 09:10:00
93	5025231010	22	2	3	2025-06-10 11:55:00	2025-06-10 11:55:04	COMPLETED	chg_6g6g6g	5000.00	50000.00	2025-06-10 11:30:00
94	5025231011	23	3	4	2025-06-10 13:00:00	2025-06-10 13:00:01	COMPLETED	chg_6h6h6h	10000.00	50000.00	2025-06-10 12:00:00
95	5025231012	24	4	5	2025-06-10 14:28:00	2025-06-10 14:28:02	COMPLETED	chg_6i6i6i	5000.00	50000.00	2025-06-10 14:05:00
96	5025231013	25	5	6	2025-06-10 16:35:00	2025-06-10 16:35:01	COMPLETED	chg_6j6j6j	15000.00	50000.00	2025-06-10 15:15:00
97	5025231014	26	7	8	2025-06-10 17:10:00	2025-06-10 17:10:03	COMPLETED	chg_6k6k6k	2500.00	50000.00	2025-06-10 17:00:00
98	5025231015	27	9	10	2025-06-10 19:15:00	2025-06-10 19:15:01	COMPLETED	chg_6l6l6l	7500.00	50000.00	2025-06-10 18:40:00
99	5025231016	28	11	12	2025-06-10 23:00:00	2025-06-10 23:00:05	COMPLETED	chg_6m6m6m	30000.00	50000.00	2025-06-10 20:00:00
100	5025231017	29	13	14	2025-06-11 00:05:00	2025-06-11 00:05:01	COMPLETED	chg_6n6n6n	10000.00	50000.00	2025-06-10 23:15:00
101	111	1	1	18	2025-06-11 20:45:37.268382	\N	SELESAI	b8717800-19b5-4c91-bad2-99497188694e	5000.00	\N	2025-06-11 20:45:19.11785
102	111	2	2	18	2025-06-11 21:10:52.677822	\N	SELESAI	a00c71f4-db59-4fab-9993-dea3e78892c3	5000.00	5000.00	2025-06-11 21:10:36.822684
103	111	8	8	13	2025-06-12 02:04:09.350304	\N	SELESAI	fc4c06f0-09da-4802-a5f0-5fc2dcb5e498	23306.40	50000.00	2025-06-11 21:24:28.740802
104	111	24	17	17	2025-06-12 02:04:57.289837	\N	SELESAI	052e5618-97df-4c1b-8178-1269a922fdf0	5000.00	50000.00	2025-06-12 02:04:46.531276
105	111	3	3	15	2025-06-12 02:05:52.683319	\N	SELESAI	12a250d9-6f9b-455e-9f78-3e4216ce873d	5000.00	334343.00	2025-06-12 02:05:47.000191
106	111	4	3	14	2025-06-12 02:08:29.31744	\N	SELESAI	d439e901-d01c-48c1-9618-995049b84573	5000.00	232323.00	2025-06-12 02:08:23.194922
107	111	5	4	16	2025-06-12 03:23:44.526227	\N	SELESAI	1e834a91-9b59-469f-81b3-3f684cf42240	6050.88	50000.00	2025-06-12 02:11:07.890994
108	111	6	5	15	2025-06-12 03:23:50.790717	\N	SELESAI	60d34f0f-a8fc-4854-be52-a186adcf4d27	5000.00	5000.00	2025-06-12 03:18:57.404901
109	111	9	9	14	2025-06-12 03:23:54.447427	\N	SELESAI	0e3f28b1-8e3e-4b0d-a362-5af3b18af911	5000.00	2223232.00	2025-06-12 03:20:03.139314
110	111	7	7	15	2025-06-12 03:24:00.545796	\N	SELESAI	0ae8a672-3ef7-44dd-9155-4698dd5f4eac	5000.00	42424.00	2025-06-12 03:20:55.213739
112	111	12	12	18	2025-06-12 03:32:13.599126	\N	SELESAI	3a3ba644-a15b-433a-bc96-a6c71bf409c1	5000.00	22323.00	2025-06-12 03:25:29.341758
113	111	11	11	18	2025-06-12 03:32:19.450252	\N	SELESAI	65a63333-d7e3-4d2b-ae9a-b7ee42ea90e4	5000.00	222.00	2025-06-12 03:25:48.07388
114	111	13	13	14	2025-06-12 03:32:25.217365	\N	SELESAI	aaa3c321-6ccc-42a4-9f14-72792d92ead1	5000.00	23232.00	2025-06-12 03:28:07.710482
115	111	14	14	\N	\N	\N	ONGOING	800db686-4908-4db4-abca-6964dd752053	30000.00	2222.00	2025-06-12 03:32:32.141779
118	111	33	7	\N	\N	\N	ONGOING	9e19b810-722e-406a-84e8-126b285e6356	0.00	50000.00	2025-06-12 04:03:43.119885
111	111	10	10	11	2025-06-12 04:03:56.714582	\N	SELESAI	ecce0e3b-2708-442b-9499-d9863914f3c4	5000.00	35353.00	2025-06-12 03:23:35.033251
116	111	15	16	11	2025-06-12 04:04:05.511897	\N	SELESAI	5f2f9d8b-9f1d-4c1f-8c6a-ea6b19922318	5000.00	22222.00	2025-06-12 03:47:27.556084
117	111	16	17	11	2025-06-12 04:04:09.908046	\N	SELESAI	290b2d58-b037-4344-99d0-d8a2893c99a8	5000.00	2222.00	2025-06-12 03:47:39.916837
119	111	21	20	1	2025-06-12 08:30:59.726474	\N	SELESAI	c6769214-1fa4-4ae1-a87d-491a5fff9e6b	5000.00	3242.00	2025-06-12 08:30:26.325855
\.


--
-- TOC entry 4963 (class 0 OID 49343)
-- Dependencies: 227
-- Data for Name: transaksi_layanan; Type: TABLE DATA; Schema: public; Owner: nure
--

COPY public.transaksi_layanan (transaksi_layanan_id, transaksi_id, layanan_id) FROM stdin;
1	1	1
2	2	2
3	4	1
4	5	1
5	6	2
6	8	1
7	10	2
8	11	1
9	12	1
10	13	2
11	15	1
12	16	1
13	17	2
14	19	1
15	20	1
16	21	2
17	22	1
18	24	2
19	25	1
20	26	1
21	28	2
22	30	1
23	31	2
24	33	1
25	34	1
26	35	2
27	36	1
28	38	1
29	39	2
30	41	1
31	42	1
32	43	2
33	44	1
34	46	1
35	47	2
36	61	1
37	62	2
38	63	1
39	64	1
40	65	2
41	70	1
42	70	2
43	72	1
44	72	2
45	75	1
46	75	2
47	78	1
48	78	2
49	81	1
50	81	2
51	85	1
52	85	2
53	88	1
54	88	2
55	90	1
56	90	2
57	95	1
58	95	2
59	100	1
60	100	2
61	115	1
62	111	1
63	115	1
64	115	2
65	115	2
66	119	2
\.


--
-- TOC entry 4966 (class 0 OID 49348)
-- Dependencies: 230
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: nure
--

COPY public."user" (nrp, nama, email, password, no_hp, role, created_at) FROM stdin;
5025231001	Admin Utama	admin.utama@example.com	$2y$10$w4g.bV7.gG5gYqJ6.fT4g.rF2E5tY3wI8nU7O6P5qS2vB1aC0dE2	081200000001	Admin	2025-06-11 23:21:51.545401
5025231002	Operator Pagi	operator.pagi@example.com	$2y$10$eF1gH2iJ3kL4mN5oP6qR7sT8uV9wX0yZ1aB2c.D3eF4gH5iJ6kL7	087800000002	Operator	2025-06-11 23:21:51.545401
5025231003	Operator Siang	operator.siang@example.com	$2y$10$oP6qR7sT8uV9wX0yZ1aB2c.D3eF4gH5iJ6kL7mN5o.P6qR7sT8uV9	087800000003	Operator	2025-06-11 23:21:51.545401
5025231004	Operator Malam	operator.malam@example.com	$2y$10$z1aB2c.D3eF4gH5iJ6kL7mN5oP6qR7sT8uV9wX0y.Z1aB2c.D3eF4	087800000004	Operator	2025-06-11 23:21:51.545401
5025231005	Budi Santoso	budi.santoso@example.com	$2y$10$hI8jK9lM0nO1pQ2rS3tU4vW5xY6z.A7bC8d.E9fG0hI1jK2lM3nO4	081212340005	Customer	2025-06-11 23:21:51.545401
5025231006	Ani Wijaya	ani.wijaya@example.com	$2y$10$mN5oP6qR7sT8uV9wX0yZ1aB2c.D3eF4gH5i.J6kL7mN5oP6qR7sT8	081312340006	Customer	2025-06-11 23:21:51.545401
5025231007	Charlie Dharmawan	charlie.d@example.com	$2y$10$rS3tU4vW5xY6z.A7bC8d.E9fG0hI1jK2lM3nO4p.Q2rS3tU4vW5xY	085712340007	Customer	2025-06-11 23:21:51.545401
5025231008	Dewi Lestari	dewi.lestari@example.com	$2y$10$wX0yZ1aB2c.D3eF4gH5iJ6kL7mN5oP6qR7s.T8uV9wX0yZ1aB2c.D	081212340008	Customer	2025-06-11 23:21:51.545401
5025231009	Eko Prasetyo	eko.prasetyo@example.com	$2y$10$E9fG0hI1jK2lM3nO4pQ2rS3tU4vW5xY6z.A7.bC8d.E9fG0hI1jK2	087712340009	Customer	2025-06-11 23:21:51.545401
5025231010	Fita Anggraini	fita.anggraini@example.com	$2y$10$jK2lM3nO4pQ2rS3tU4vW5xY6z.A7bC8d.E9f.G0hI1jK2lM3nO4	081312340010	Customer	2025-06-11 23:21:51.545401
5025231011	Gilang Ramadhan	gilang.r@example.com	$2y$10$qR7sT8uV9wX0yZ1aB2c.D3eF4gH5iJ6kL7m.N5oP6qR7sT8uV9w	085812340011	Customer	2025-06-11 23:21:51.545401
5025231012	Hana Yuliana	hana.yuliana@example.com	$2y$10$A7bC8d.E9fG0hI1jK2lM3nO4pQ2rS3tU4v.W5xY6z.A7bC8d.E9	081212340012	Customer	2025-06-11 23:21:51.545401
5025231013	Irfan Hakim	irfan.hakim@example.com	$2y$10$sT8uV9wX0yZ1aB2c.D3eF4gH5iJ6kL7mN5o.P6qR7sT8uV9wX0y	087812340013	Customer	2025-06-11 23:21:51.545401
5025231014	Jihan Audia	jihan.audia@example.com	$2y$10$pQ2rS3tU4vW5xY6z.A7bC8d.E9fG0hI1jK.2lM3nO4pQ2rS3tU4	081312340014	Customer	2025-06-11 23:21:51.545401
5025231015	Krisna Murti	krisna.murti@example.com	$2y$10$yZ1aB2c.D3eF4gH5iJ6kL7mN5oP6qR7sT8.uV9wX0yZ1aB2c.D3	085712340015	Customer	2025-06-11 23:21:51.545401
5025231016	Lina Marlina	lina.marlina@example.com	$2y$10$hI1jK2lM3nO4pQ2rS3tU4vW5xY6z.A7bC8.d.E9fG0hI1jK2lM3	081212340016	Customer	2025-06-11 23:21:51.545401
5025231017	Mega Chandra	mega.chandra@example.com	$2y$10$uV9wX0yZ1aB2c.D3eF4gH5iJ6kL7mN5oP6.qR7sT8uV9wX0yZ1a	087712340017	Customer	2025-06-11 23:21:51.545401
5025231018	Nino Fernandez	nino.fernandez@example.com	$2y$10$tU4vW5xY6z.A7bC8d.E9fG0hI1jK2lM3nO4.pQ2rS3tU4vW5xY6	081312340018	Customer	2025-06-11 23:21:51.545401
5025231019	Olivia Jensen	olivia.jensen@example.com	$2y$10$iJ6kL7mN5oP6qR7sT8uV9wX0yZ1aB2c.D3.eF4gH5iJ6kL7mN5	085812340019	Customer	2025-06-11 23:21:51.545401
5025231020	Putra Siregar	putra.siregar@example.com	$2y$10$C8d.E9fG0hI1jK2lM3nO4pQ2rS3tU4vW5.xY6z.A7bC8d.E9fG0	081212340020	Customer	2025-06-11 23:21:51.545401
1111	1111	1111@gmail.com	scrypt:32768:8:1$BSEYnYW0kcsZw2o3$ee72888b4907df43581434636f617292a9fd356ccb1cb59e52c9d9a2a9168db42e8a246f378e168515830b5e26819de838a2696ae08affce293c7d2ccdf20abb	1111	user	2025-06-11 18:27:17.034025
111	111	111@gmail.com	scrypt:32768:8:1$PzSNy7FoHwt9lKNt$3f960c8ace1b9998bcccf3d13a7bcefd7ce4f0557f17025f52284a89cbbac61555385d5f4981697b360a72647ea4036239e8ee1983181203cb704723f5919b1d	111	Admin	2025-06-11 18:19:59.75331
\.


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 219
-- Name: kendaraan_kendaraan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nure
--

SELECT pg_catalog.setval('public.kendaraan_kendaraan_id_seq', 1, false);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 221
-- Name: layanan_layanan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nure
--

SELECT pg_catalog.setval('public.layanan_layanan_id_seq', 2, true);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 223
-- Name: log_pemeliharaan_log_pemeliharaan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nure
--

SELECT pg_catalog.setval('public.log_pemeliharaan_log_pemeliharaan_id_seq', 22, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 225
-- Name: stasiun_stasiun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nure
--

SELECT pg_catalog.setval('public.stasiun_stasiun_id_seq', 1, false);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 228
-- Name: transaksi_layanan_transaksi_layanan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nure
--

SELECT pg_catalog.setval('public.transaksi_layanan_transaksi_layanan_id_seq', 66, true);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 229
-- Name: transaksi_transaksi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nure
--

SELECT pg_catalog.setval('public.transaksi_transaksi_id_seq', 119, true);


--
-- TOC entry 4782 (class 2606 OID 49360)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 4784 (class 2606 OID 49362)
-- Name: kendaraan kendaraan_pkey; Type: CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.kendaraan
    ADD CONSTRAINT kendaraan_pkey PRIMARY KEY (kendaraan_id);


--
-- TOC entry 4786 (class 2606 OID 49364)
-- Name: layanan layanan_pkey; Type: CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (layanan_id);


--
-- TOC entry 4788 (class 2606 OID 49366)
-- Name: log_laporan log_pemeliharaan_pkey; Type: CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.log_laporan
    ADD CONSTRAINT log_pemeliharaan_pkey PRIMARY KEY (log_laporan_id);


--
-- TOC entry 4790 (class 2606 OID 49368)
-- Name: stasiun stasiun_pkey; Type: CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.stasiun
    ADD CONSTRAINT stasiun_pkey PRIMARY KEY (stasiun_id);


--
-- TOC entry 4794 (class 2606 OID 49370)
-- Name: transaksi_layanan transaksi_layanan_pkey; Type: CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.transaksi_layanan
    ADD CONSTRAINT transaksi_layanan_pkey PRIMARY KEY (transaksi_layanan_id);


--
-- TOC entry 4792 (class 2606 OID 49372)
-- Name: transaksi transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_pkey PRIMARY KEY (transaksi_id);


--
-- TOC entry 4796 (class 2606 OID 49374)
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 4798 (class 2606 OID 49376)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (nrp);


--
-- TOC entry 4799 (class 2606 OID 49377)
-- Name: kendaraan kendaraan_stasiun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.kendaraan
    ADD CONSTRAINT kendaraan_stasiun_id_fkey FOREIGN KEY (stasiun_id) REFERENCES public.stasiun(stasiun_id);


--
-- TOC entry 4800 (class 2606 OID 49382)
-- Name: log_laporan log_laporan_nrp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.log_laporan
    ADD CONSTRAINT log_laporan_nrp_fkey FOREIGN KEY (nrp) REFERENCES public."user"(nrp);


--
-- TOC entry 4801 (class 2606 OID 49387)
-- Name: log_laporan log_pemeliharaan_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.log_laporan
    ADD CONSTRAINT log_pemeliharaan_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraan(kendaraan_id);


--
-- TOC entry 4802 (class 2606 OID 49392)
-- Name: transaksi transaksi_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraan(kendaraan_id);


--
-- TOC entry 4806 (class 2606 OID 49397)
-- Name: transaksi_layanan transaksi_layanan_layanan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.transaksi_layanan
    ADD CONSTRAINT transaksi_layanan_layanan_id_fkey FOREIGN KEY (layanan_id) REFERENCES public.layanan(layanan_id);


--
-- TOC entry 4807 (class 2606 OID 49402)
-- Name: transaksi_layanan transaksi_layanan_transaksi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.transaksi_layanan
    ADD CONSTRAINT transaksi_layanan_transaksi_id_fkey FOREIGN KEY (transaksi_id) REFERENCES public.transaksi(transaksi_id);


--
-- TOC entry 4803 (class 2606 OID 49407)
-- Name: transaksi transaksi_stasiun_ambil_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_stasiun_ambil_id_fkey FOREIGN KEY (stasiun_ambil_id) REFERENCES public.stasiun(stasiun_id);


--
-- TOC entry 4804 (class 2606 OID 49412)
-- Name: transaksi transaksi_stasiun_kembali_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_stasiun_kembali_id_fkey FOREIGN KEY (stasiun_kembali_id) REFERENCES public.stasiun(stasiun_id);


--
-- TOC entry 4805 (class 2606 OID 49417)
-- Name: transaksi transaksi_user_nrp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nure
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_user_nrp_fkey FOREIGN KEY (user_nrp) REFERENCES public."user"(nrp);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO nure;


-- Completed on 2025-06-12 16:52:28

--
-- PostgreSQL database dump complete
--

