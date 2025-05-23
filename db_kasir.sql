PGDMP  *                    }            db_kasir    17rc1    17rc1 .    $           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            %           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            &           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            '           1262    32870    db_kasir    DATABASE        CREATE DATABASE db_kasir WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE db_kasir;
                     postgres    false            �            1259    32935    logs    TABLE     �   CREATE TABLE public.logs (
    id integer NOT NULL,
    user_id integer,
    action_type character varying(50),
    description text,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.logs;
       public         heap r       postgres    false            �            1259    32934    logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.logs_id_seq;
       public               postgres    false    226            (           0    0    logs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;
          public               postgres    false    225            �            1259    32909    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(12,2) NOT NULL,
    stock integer NOT NULL
);
    DROP TABLE public.products;
       public         heap r       postgres    false            �            1259    32908    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public               postgres    false    222            )           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public               postgres    false    221            �            1259    32918    transaction_items    TABLE     �   CREATE TABLE public.transaction_items (
    id integer NOT NULL,
    transaction_id integer,
    product_id integer,
    quantity integer NOT NULL,
    price numeric(12,2) NOT NULL,
    subtotal numeric(12,2) NOT NULL
);
 %   DROP TABLE public.transaction_items;
       public         heap r       postgres    false            �            1259    32917    transaction_items_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.transaction_items_id_seq;
       public               postgres    false    224            *           0    0    transaction_items_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.transaction_items_id_seq OWNED BY public.transaction_items.id;
          public               postgres    false    223            �            1259    32884    transactions    TABLE     �   CREATE TABLE public.transactions (
    id integer NOT NULL,
    user_id integer,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total numeric(12,2),
    payment numeric(12,2),
    change numeric(12,2)
);
     DROP TABLE public.transactions;
       public         heap r       postgres    false            �            1259    32883    transactions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.transactions_id_seq;
       public               postgres    false    220            +           0    0    transactions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;
          public               postgres    false    219            �            1259    32872    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email character varying(100) NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    role character varying(20),
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['admin'::character varying, 'kasir'::character varying])::text[])))
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    32871    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    218            ,           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    217            p           2604    32938    logs id    DEFAULT     b   ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);
 6   ALTER TABLE public.logs ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    226    225    226            n           2604    32912    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            o           2604    32921    transaction_items id    DEFAULT     |   ALTER TABLE ONLY public.transaction_items ALTER COLUMN id SET DEFAULT nextval('public.transaction_items_id_seq'::regclass);
 C   ALTER TABLE public.transaction_items ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224            l           2604    32887    transactions id    DEFAULT     r   ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);
 >   ALTER TABLE public.transactions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            k           2604    32875    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            !          0    32935    logs 
   TABLE DATA           R   COPY public.logs (id, user_id, action_type, description, "timestamp") FROM stdin;
    public               postgres    false    226   6                 0    32909    products 
   TABLE DATA           @   COPY public.products (id, code, name, price, stock) FROM stdin;
    public               postgres    false    222   6                 0    32918    transaction_items 
   TABLE DATA           f   COPY public.transaction_items (id, transaction_id, product_id, quantity, price, subtotal) FROM stdin;
    public               postgres    false    224   ;6                 0    32884    transactions 
   TABLE DATA           Q   COPY public.transactions (id, user_id, date, total, payment, change) FROM stdin;
    public               postgres    false    220   X6                 0    32872    users 
   TABLE DATA           J   COPY public.users (id, name, email, username, password, role) FROM stdin;
    public               postgres    false    218   u6       -           0    0    logs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.logs_id_seq', 1, false);
          public               postgres    false    225            .           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public               postgres    false    221            /           0    0    transaction_items_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.transaction_items_id_seq', 1, false);
          public               postgres    false    223            0           0    0    transactions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.transactions_id_seq', 1, false);
          public               postgres    false    219            1           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public               postgres    false    217            �           2606    32943    logs logs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_pkey;
       public                 postgres    false    226            |           2606    32916    products products_code_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_code_key UNIQUE (code);
 D   ALTER TABLE ONLY public.products DROP CONSTRAINT products_code_key;
       public                 postgres    false    222            ~           2606    32914    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 postgres    false    222            �           2606    32923 (   transaction_items transaction_items_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.transaction_items
    ADD CONSTRAINT transaction_items_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.transaction_items DROP CONSTRAINT transaction_items_pkey;
       public                 postgres    false    224            z           2606    32890    transactions transactions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkey;
       public                 postgres    false    220            t           2606    32880    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    218            v           2606    32878    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            x           2606    32882    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public                 postgres    false    218            �           2606    32944    logs logs_user_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_user_id_fkey;
       public               postgres    false    226    4726    218            �           2606    32929 3   transaction_items transaction_items_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_items
    ADD CONSTRAINT transaction_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);
 ]   ALTER TABLE ONLY public.transaction_items DROP CONSTRAINT transaction_items_product_id_fkey;
       public               postgres    false    222    224    4734            �           2606    32924 7   transaction_items transaction_items_transaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_items
    ADD CONSTRAINT transaction_items_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transactions(id);
 a   ALTER TABLE ONLY public.transaction_items DROP CONSTRAINT transaction_items_transaction_id_fkey;
       public               postgres    false    224    4730    220            �           2606    32891 &   transactions transactions_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_user_id_fkey;
       public               postgres    false    220    4726    218            !      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     