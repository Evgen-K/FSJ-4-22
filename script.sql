PGDMP     3                    {            Shop    15.1    15.1 (    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    57903    Shop    DATABASE     z   CREATE DATABASE "Shop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Shop";
                postgres    false            �            1259    57905    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    57904    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    215            9           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    214            �            1259    57912    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    57911    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    217            :           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    216            �            1259    65988    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    65987    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    225            ;           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    224            �            1259    57919    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    57918    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    219            <           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    218            �            1259    57928    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    65971    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    65970    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    223            =           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    222            �            1259    57927    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    221            >           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    220            ~           2604    57908    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                       2604    57915    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    65991 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    57922 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    57931 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    65974    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            (          0    57905    category 
   TABLE DATA           ,   COPY public.category (id, name) FROM stdin;
    public          postgres    false    215   @)       *          0    57912    image 
   TABLE DATA           :   COPY public.image (id, file_name, product_id) FROM stdin;
    public          postgres    false    217   �)       2          0    65988    orders 
   TABLE DATA           d   COPY public.orders (id, count, date_time, number, price, status, person_id, product_id) FROM stdin;
    public          postgres    false    225   �6       ,          0    57919    person 
   TABLE DATA           ;   COPY public.person (id, login, password, role) FROM stdin;
    public          postgres    false    219   %8       .          0    57928    product 
   TABLE DATA           k   COPY public.product (id, date_time, description, price, seller, title, warehouse, category_id) FROM stdin;
    public          postgres    false    221   9       0          0    65971    product_cart 
   TABLE DATA           A   COPY public.product_cart (id, person_id, product_id) FROM stdin;
    public          postgres    false    223   ?�       ?           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    214            @           0    0    image_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.image_id_seq', 235, true);
          public          postgres    false    216            A           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 20, true);
          public          postgres    false    224            B           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 3, true);
          public          postgres    false    218            C           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 50, true);
          public          postgres    false    222            D           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 47, true);
          public          postgres    false    220            (   H   x�3�0����x��.#��.lr��\Ɯ&^��ta߅M6\�W 2�^l������1z\\\ u'�      *   E  x�]���%9�Ee�W�X#���Hڿ��u�����>�����J"��k���.���Y��ֽզ��m���W�k����h������������g|��bZ�%F�m(eۤ���k�=�1F�y:��]M�9����E�Fʶ���6WglS�:~�j��U�;�c�U���:���ŹƅN����Lޫ�=�;+G`]M��霪�����&�1Sf��m�*����[��.����t���Ԣ>��mtsڔ�����ѹ��ۅ�/:�>T{��Φզͷk_��c�"��X�s_x2�˜+��6^��2�ʬ��ʈ7��b�>g�5���pVkY�zN��H׼���lt�9�06����i�d�⺛y��ϝ��\��).���
_�>�6Ҋk���}k>}��l�!��s%���V��;�P��\�ݮ^�p5��Z(6����LV�4;K��j���[����reD���j���g��V�3k8�x��N��ԡӧ!��LK�ԒS�����9:�)��(q12v�ͰU
iQ��5R��O�х�G�4H>�δ�ļiv79�4GxM�|��,8�*��7��b������4I>����_��G����Z���l��v�h��"�/<z��T��$��{�����*����9��S��W玳��{�;ٶ��V���,���/��q�c��3�K�t@+vW)5�݆��*����&%O>�2M;W{Mv�&]�ԽX2��Wg�#K
M����)t��~a��Ȓ��7�~�ޔ% �f���V��3���2���ɗ��tm�6&·y(>����
��.��t!���Ѭ+Uo�u������F��,ӧ�_8]Jns;�9�r��BESO\v_���JD�F�����m�^���s�zSe�_x6si��V�	����[���-����՟ZL���j�"��3�:�ٱh��|-�>�\��j�h"�W~����7]s�8�o���g��լ*��m�wv��v�y�{ɂ\����ՙTG��;�e���y�c���|�|�_�73{�=�&�rﮢ���G��Y��럣�f�%r�;;N~�pl]��(�k�3J7�~ᑞ�.^6���3��|f>��{�����Js���x����1l��KS�m�́��Ŭ�!;߭��N�![��=�]K�w�U��gӓO��t��{��تx�U�[R!�}u������b�O���S�@}�����t�|�/���%�Z曉F�8>��I�c-�}t5�j�Q�&Ǎ.�}�X-����c	��6���{�`jlg��x���Rv��W����>�޸���w#ANߍ_�����Ҹ��?�&x
s\P��*�2Id�M�Y
d�L�2(��[ �T�^�8�y|�ڬ`�n.K|��۞�G�dZ�cxH��a	���)X��\֫@y3f߮��+��q�ؔ�F���Wz��ل�F��"�;̃��0O�E�\lzO���O(&�o��Or#܂+��wD�뾛�G�(P��}Gq���D���0�8�rQ��U�?
�!|`j�a(�f��x�T�S׆��÷�w�hFB��C\�BH�N��;���Q�-!���=vlO:��U�y���y��))@'..y���OX=]H!�0�r?t�Z9�G:���l[h� �atȈ����Q�WyH��
U��s#!0��ؼ}�z��ƔĴ]����t	�i����g�/��ʣ@6�ڻ��dw���Vӌ>�tɫ�?
����"�Վy�zD4�CTNؿ���CĚ6-��ѡ��4�Zu-�1�|�B��tb���
|@R��ῄ�li������:1�o��z/B�۵Oh�&t��vG"�3�;qey��[p���f�i�R����a�8� 䞀��Y�"$����h'�o��~���K���`������K��ʉ��)��U�?
��'��;�a$��-�E��G�N��G8���ԏ��ӡ��v�^�1^�Z��I a����[Q/��h�X+c�V߯[(�Y�(0R.�xw�7N�)�HG`���=C���Q��DƯ0Q)���Ɣ���������)�-���y�"Nlz���+�0Zrs�|B�W��[t
Dg��.�6�t��������'�c�[�,8Ge�sh�B�������1�OC����/��6Z�\v'@�IB�iۥ�.��q�~4nOz:)mY�큦�]�Tŗ��d03:SƓC��:�� -=���p:0faBʙ�PtQ=�B�ʽ���g�G�1�s�y:�D�=�呙Q�{��W�D���!ֻ���h%t�B�&�B��o|x�i}�!,��B3��<�	S�Òo||��0�K��'�:����cJ!�~���`������9��|��ŷB.�6�������	$q�TY��N�����0�GW����<����"�T�WQ�C #S5z���|�w��<(�FȒ~$�'^�IY9���<�h��������'�%��j�G珣:x�x������7 ;t�γ����*J�7�?�����w��ס/u�#�9����Cc��?��L�����i�đo�n�PȮw�~�`~��쓷;���y�r�<���4Os���^9?�g���{�WSԧ�cmk��!����x!�����F	�����W���2���7�'�z�9��%X�@���ϫL��#X���g��I)f8:���G�'#-�?	�����/|5l����r��D+����F@���x5[�Λ����O��-C����Ɨ/>;�K�%w��ߡ^]=C�
`��l����#�p�x��-?&�C�D5����׍������d=z�iYݍ������l	5`�~�����Il1���l�y��r<�n{��E��O�#skM�D�*ڵg�W����]��x�ם�A�*��<��3�b�%m�A8����g��(r�����=�$ #���1��Zϓ�@���O��$֕M�g:�Ͽ�O����i�������Z�5�Y�0]��E~�j&x:�$0�ud2��C*�:҂�>���B�U�rnކ]"�=v��Rv!P�5�5~�������S�y�Ŋ��x�>w�n��<LD���'_弄�� �����H,����O�� {���'�<�aAJ���������t�N��Rɕ�)�<$���̙,��?�bf� �>��	���1C�fbH�{�5<��8̇�U�<��8Y���?]a�1���~����"�;}9��2N��vǍ�J*������W����q:A��?��̭�.�2��?9�(�4�k�cVa�p�H��3��uy���8�2�>^?aX�9Ѷu�?��9�W�S��������o      2   (  x����i1D�oMN���~I�X�3���b��Yp��.(¢�N��ѵ��tC	_y_k�_dp��tO���qC��.RD��[;�̴p��W����X)�e^�*�hs�Oۓw���?A5�h���ѡg�@v�GEД�Z���"ֺ0¯(��/P�����v�&�!�+��L�iȞ��s���1VK��C>���.�儺���|�B��렆�45�;���ٜ�@�*�p��X�����ks�����~����e�h�d�C��{��I�gg��q_����      ,   �   x�M��n�0  �3�΄�I��W���-d�b��jZ\����`��}������v\�w�����[�:ߊ�{1	x���{����g=�xX�,!��eTf�i�|%�Zo@�p;�БM�\��nd�j1	��:0�;�B����N����-�e`!�%ߏ�ݑ g������*�{$m�TuD-=�U}�>R�ܦ��A�:��IN-<C����  ?��I�      .      x��}[�\�q�s�W0B"�g8��s��)B%^�$ejz�ȑ�	(H�k�i.  ��D[!Q��^{���3=s0g�6��A�d����ʪsz ���]K��R���/���;�������Bo��l��[���k��˫���r�ٮ�rv�p��t'n�����������&���g7f���C��(��p�;)����V�7��?��ˌfw�oݑ���ݩ;�_,�'�k�������nP�G������_��U��������V�������1���U����6����g��p������Ux��wZ�˅O���v��4�=�����.���+����х��G��wܸp���xX�qx�p�ݢ��OC��ǯCx����p+�Q��{7<��c�45-ݯ�7���=�������k�*��#�jXZ�=�0a������X��v=�sV�M�V��e��½K7�+��_�ڬw���{~}$���v)�s�_�����r�W���������,��q�7�
݉�u�Dw.���M?n<�M/���X{�ߘ6B��wv+܍.�X�?�����K�v�����_��$I^��E����ǵ�fxѡ���6���VzD/rdw�?��c�w��1Ĕ>�5/8�a����?1�Q���u�M�ÿ��Έ������m<vX)�V�B�X�J����X^� KB��xD"~�?q��?0�Ufz�����C�Cz(�ǔ�����2,����7'7<�`�MR��5�Yi�����:�^/�'
��H�&~�������bv��֯��#K}��/Ï�yGU��g��_q�I�Ixd4|r���a킆(�Q�����Mi-F�͎�q��P]�I��=�;@j[^���ov��.��g�Q�jA�xe��6i���=?�� �}���tO�ߗ�j�2��2ձr�ҸHr�g�����V�[@��B��G�H�����f�!��7����s�U������0�eE��8�S\�<
K"�zLO��((/i��1�Pz�3R��C�s:sIei�-���8�+������a�h���%=�(��>I1�����\��[��9���B�?�*��ëIV�#ߦ=d��,�Q�7�J������E<Z���vM<���/�uK�;Rq]��Y�cZ�U�B�w��E����\���:Vw$iQ������X���N��2��~K��Ș�ovzO-�2�ki}kuu����lt��Tl熩�������rS����޻��^�J�oN����n�M�-�F��W�����~~ƪy�ا��0H\�� n������;�{�wX����l?�Kdh���?�PM,\d{O��2C"=b�S���)�R�ք�;�j0>��Y�����f�����wIM��26bK_���� ��< 1�Pt�}v�^A��(h���St�Ho��!��]ڲ=�d���Ft��� ������D3����
�]pM�S@jt��_�pۿ�=�A�q��r�V��������
G���H,"A؋}r�&�����f߀��`J��2����Jr )�Z����qP��l�jr�����TA���p���d���҃�݇N�'5��7�V�ɘ��m�>� Q����JH2�~#8��Û�F�]�<��m4Ɋ�qRaavp�V���P�@kǮI��!x�wt�3!'��F!ĮJ��݋ �v7���_����\���9���7t��ll��D��ȩB�U��0$��F��F_v���к`�ͻ?����g���z��k�Z]E
̰�py����w��`�g�H{���s�g�[��r(Rmc8b��'m��s����/�����<4,O�:�Oj��~�|�e��䰐�5�z���}�V�����_6�Ͽoge��ٹ��?{o������߹�7�����6������֗����y�i�W�Z^��oy���������?ѩإس�
*�����#6�nH�ny����w��]|��7{K�//��,X��pHP�2&��#w�C�����:��>���/ș�y�m����]ʃ�X,R�w[������_���#B�G��W����7z�����o�o)2r�!���$�f�]Sr�bG�M���/_�\�=�ZEە8y�f�?
�9�p�!��Y"��3�9�SJp�}���w��S]CN<ٙ�r׸�#���_J2	SM�<$�*4Ę��7ۓ�J�@�K�GZ��&�W!K�N���b3�H���tS�
]I;1,;���K�FR`�&�߂-ܣ8��  +��IȄ���2h�5�ҟ�X�n��_sBamȿ-��$�߽�Hl7�5� ��N����y�ŗ^x��k��x����g�Q��ǿ��u�Q��^�6������WW6�V�;�~��������q鹗�����_=��7������B������;�(cZ<�6h��-r�Õ���3Dsp6%&�m.�S���{d����dk�ל��Y	[�-/��/3�NQ���%8p�~�GW��`�����/]za�����E�;���ēg�~J4�4V��@��Gjm8	�������KWr��[�ݢ�܉~x'r^T�Qz��=NL
�Ṉ?�!��ʧ������C)Z%$P�Tݤ�ڍ�1� P$�ܾ	�a!�!��ˉrn�]+:�.���3&I��JOJ�	��xQ��/j(�"�<�91�?��!M|zҠ^A�`����%��K��ƥ���__p��'����R�@��͜������7V��Y��{�k��~t�+��)^�~��펏jJ�+SQ����}��0���]�q<6�����ׯo_~J�Uͭ�j���������j��w�d"�Qާ�AA]�����]�_s^��R��BH`�<�A���Y�4%�O�pQ�!������sF�/2�$�x��?���{�W�*����z[8�h�V�SL(�����rvXpQ��"����R�|�����C��]2���9�A�tJ�1q���6�Wp�+����m�CV�u�:W泦��?�^����[]�;C� y7]$���N�e��)�@x웨�H:�i-�]���e�}G�/�!��ަrdI��"Z����Np3P9������[��F.���r�Y�(<�����H�o����c�5��q7��V���1�퇦DF���̬��P�7%�NT6��%��8;�C�,љ��P�
��O� S�8�v�ݩi��:p1�Ciu,�>�x�矤	
M�"V�7����<�HP�Y,Д��.� �r��j*Cy�$HjP4���ܣ���Ɉ	��R�9���q��ӓ�ލɓoV�]��XY[�'^.۳��2ת��r}��荵��ʊ�[I(��~�T��m��Y�v�N�b�f7zry!+��M��{�]�I�¦`�8�w!��T醢"�Aɳ�m�zj��1�C٠W��,���OQp��Y�J�����sRlS���7}X���4`���4�C(�S�PҐșh�M�Z8R5�S�P�&J�!UIUF^@yp�-��B������I#�v����R�>�k�����$Mm���?��Cƶş�&	V La	� �%���~�S~�&���h�8���m�-�B�'�>��~u,Z�ӌŦ���NS�hEP�����N��.|%'���/<�	Y|����D�?D>4�+7�r
N6!Ի�#Q"1��M$~���I~C�qԒd�<��������R��7��x����BI��PǺ��a�Ɋ��mJ^K�~�`��t���?Þ���E0}�T��#��
]>�h�5�Iֆ���:�C�!���QMZ; �
Z�q�("�@e����r��*f3ۋ_F~����s���ƺUC�*��VZ��H�
� ��6M)@���x&�ʪY�O�w�����0TdTmȔ��i#~��f��P42���O�I5�#��1��)�u��"|������w5�4�!�[�[��� ���gw.õ�ʢEߏ���Ö&��Qҁ؏�0���]X�<�g�ny�c�;��)�ya����q��YIz��`A֖�����    ���b�)�Ì�� �hQ3^���:�ht��VB�����T
PmAo��{�\�՜=�����1���'rF���mE;6e<#��Jr�0%>}��<�x���O�D%bN8i!��R�pn%���:Y��Hj�X�s���\��*�Ø�'�GUexh������ϐ�pae)<׈^R����Ig#K\�>FL(AEe�J����՞N"�C�Q
e���EF���5�5
+�X���m��Y��qJ	�J��p��K!�����/�����l��Bk��bji�k+�ƞD���A"��}���C����*\���`EҚ���Y�����g���|�}��*(�n����V��	ւ�S/l �M V�!�t���H�z��{�`�P?D��[�]��K*d��U���xHT#��T4����>VR4��:�pn� ������"�0�9K α�?�G�i�#�8����ȼv����/d�N��S�~Y��l�B)��.�!��q�E�T�U%���F�
�X�7 �\�bHiS/��'Q��G	�ɻ�C�h]{��7�]���\���1��N����?�t>.�w�[�Y�a����_��o�u������[��Ͻ�¥�^��f(��U��d��D!ԍlB����A�� j�HH|ߋݴq|�.�UP`��[�����^���هt���|��,�{�R\���	F���/��}�^����n�BM���A��ʢ�dx�*������^�!�ݙ8��g�zNY�/�����	r�]��O\u+ �������.��U�5�(���y�����t��qeh�w� i�'�zЈ��$}&�9$'��<�,���hܽ�OM�~0�pE'd����P,�	��E�=�S�@/��]pJ�H8!�,V��Q��.�s���(�pF
�?ջPɟ_ޠ��z.2 ^��p���av�|�Cr��zv�R���yO��<j|��	 ��ĭ��_X��d�ll�I�OhHm�GEߖM7�O��oC�Bu&*/�e�v�pm�3b��75+}� �橻��J�Au����!m�7'�sB3���Hτ� �t��,Q�@�^���>EVk��D�N���9VZ	F�ᝢ�N5�JW��A��؃Rf�)�E�����@HCYd���%������.v�U��i�(���+� ø��C��[=�@������fTbZ�Sre9�V�� : Ɍ��p��
iG\��'u����Li9�u����i�&x0,`!p(�)N�[m��7ل
�*hD��Eй;d��ȀH_���Cy5�u���J�83B�~�~�!tiπ�Mʿ�oewDw�H.GwS���˴F��N�ք����g���$rrx?)�%�\ں	�:�&�)E�&�BʊҲy�[��Uk}�f�^I<�R�<)�be�*�d�yiӗ��

�0���<	m����.�E��qjA�9P����*�=t��Ӝ�DBR�#R8�gE�>��8��Q�����W��1���ǳ��gCt��Y�2S*Mb%*��9�]+ٹ�봷W45���Pݗ�!%_�����PFB�Uىi����Uoв>��z���]^Y�X꯯�K"%��j�G��Rr�$����#q��{tHk�?8��@xT�#I�glRDҟ�:��BA�z����̺��QĔ̡�?V+z$��e�A���������^X�E,�s�"�*���3]�iiAB0ީl��<Ɛ��z��L�I�8[��*ci�Sk�:K�n#E���3S	VH�j^��Z�ӂ1�S�%�e�8uR�c�e���t�X0Ԡ�n#'�!�f{�V޵�c5����c�:��QK�����>��~?�5\`1�8w0�1��F-Bw9�Q��➇h�T�me�� U'��!O:����RG�����4K1�Əgy�d����@��)����10�p�frcr��~��|g���<}���_Z\]]]^^�p�<̪t����)V�O�
r�Bi���~/�0�g%�0i /�� ���L�t������&(������|1��'�B����Z���R��lnj.��W_�T�ե׾ ������CA�o"�4��C2�g��$��hat�%cƱ��8���pʳ���t�=�,zKK������^�N���y��߹��O� d���P�p�B �O�ʱ!O���@GRKｯ2�M���rG���	J81��w~�1![�U�Ѡg
$���>��m	1a���\a�9mX�N��7�&����$OQ��H�	�Y>�
���N�,��]4�A�q�>��]Ӈ�ZT ��������\�20�*:%�1��ЧB��Āʙ�eHn�C}��R���%�t��=m�� qIP�(DH�-u��{e��\-�R��J�#&�u~���/M,hh~�sI��-?�5��v.�����>w���Xr4B�%e��>p�ɿ8�8��\��a�a�$�L��Rk	���IG7�w[��0>כ7%���=Po�w�S������1�-��D {�]�叞!F�CrubM_��M5;B�y� ���w�p��ԯ�8�A���U��1�G]��#ɰ�����&�"�>�9!6*$G�w	�Zl��L�5�\l�{dg�ҿ�z�c6-�
�Z$	%�]Z�{x�6�pO��W����d����%�rb(�j�1%�*K����B~�"Y"�'�����M�M��oɹ�Cj(���	�P��I(�X2*����L���hq�BJ^z���2 �^��~8ɾ#,��"8S�(��z}n�G���wJjm�Ue�f���R(�-��-+��ۨ�"��0A:�]���6��-��'ܬj��G>_��(Cq3rQ j�]�E���-	�)"�سJ��c��p%�%!8���Hfm�#��ә�4�U��p��N��8���!S�@��<q���`�j� ?3�jw��W�K�7H�K���4;��v�}��,XC��6�m}kyi��_��dl��_���SqYN�����Y#2����+j&�8�F[mm>L�6�%�I����
�r�ИB3�|���ǰ_�/d�s3젺�՚����T�F֋N�8���[���.���56������j^*�N£�����
�;/㻛�I�Z��9��na���aK�Ǿj��I@i���>����C�ꫂN�D{#���-Iج;%ңL���|U�VCt�y2��4彤�k�vY��U�w�5�M�T�>��Xyq��%��(��R}�Mv����J���eY���xE�&9c6�:���9l���\|�(����P�0Q���<�UY(Ű{��Ʊ���9�� ��r���	ׅS�!g�l�SJ�$��Eq�>f��)�L�(J{�2�2#T�|�;H���M��ۊ�~�v���BB�k���#��2�h��
g+��� M�����[� �$����AZ�C$>jd��+Ն�,��B@�m���0 }(Rٱ"�8�G3��ҫ�{x6�J�Ж�e�c�N�����5�!h�Ū٥�7���������S���8�7"�TPz���҈$���DVVC�@�XηI	�DHh�xE�Ц?������D��N����G�8�������E�3NHX�{�zℏ�b�C���I>�kue3�RZo� �t9�υ���qQ02�!ɓ����/����yxq�X_������%��@�'$�3p2�&�׃�Ȭ����g��*� ��n��T�/��F-[K-V��GH�������v�պ�hoj�7��N�f/�_%���f�hN�mݟ����Y�j$�6n5�'�9n�G��b~G�Jc縐����tg����g��h�6���Em�mBg�#�Ӣ�w�93�L�]�O���Vz��g�h�@�qZí9��2�&�=2.�ʡ`y;ɘ�)i?�:3�GSu$@�qjy�4X��`nI-_���^�x�;".�t�C���8ȳ�[��t�ng��s":���3w7��t�r�rJaC����z���8&
`�'�m�    9��i+���ܴ���]���5H�5�,'�y�b�ѲS��Ss�|'ӖٸykNI�JVG��s��ku���4����	�t#��z���p�s�¦�CIn�����h/(Eh�����$'���'�2�6^D8�/JqM�-D�]�$b!��aK�:lH���3��",͚�h���Fl�ꐛ�����n*X��i��j�m)O�v���d�s�P[�Lè-:�=����>�T��:�U���	��$ס�L��9��)ՏmT20�`Pc4��H�R��,�W�0~7� ��`��	�y����	hiC:H
{6*ؒy����9�~�0$"d�Y9Z�u��/OK�-Z 2�B�~��'Ϛ���Y��Iʩn d3ܪ�]�Ӏ�0�8��''���&���pv�%�(��rPR��G�s� �ǥ���R�R�]y�9�_���ECN�$�����6��4�S��Vt6ߐ^&��!C	t�hUj�OA��CP}c0�Y���;c�5KH�Z(�c�#���PO^O8?ަ��Ǆu�v�B	����ؚ4Mi�z�J�aN�c,��wE5~� � ��<b��A����B�ì#y�\�,�'��h��5�ޛ�z3��-����L!�G,�����#�����U���V��L1�I�r��O��P�u9fiCT�iQ��֔�F�D�M6>�G����q�t�iiV�։MJ㣤�T~Jod��QpK��D(["B�-��ɖ�;9Tn^����w��,՟a.�o��?W�'���8��rd%�a%�`�*0pe�O,O�S��<�m�iq3)�Ւ�xl�1)˂��_y 
�T]Z��0h��Z���b�z1�;3�"����f�Om��,�Ԫ0�W0^�v�/
Gk��!֞,��ȩϽ`}��Qޭ�y���mY������:�x&	�,�7ǌ��*��XVsCr A�����E��%٨i5Uu�!�V�G1���P�����Y	l������/=���������t�(�i�^,?�[�A@[+���rum�� �u�� �U����pEj�����/^*���w_y��k�r�x�ҫ�7_��_��7^}����\��h�u2#v��n��Ph��ՙBmekn�+���qY�����S�P)Cq�����Oi3ji�<If�D�}�L���2�6sXP�7��SINQ��=;�Icc���#��@���X�����fsZ,�z飙N��Zp��;���W�lpbp���ɴ'y�2�����8�PolHBS�}����։%�cq�-3��B�uӖB7��C��T �F!�J�b^# �ܑ8��);����^t5�(��i�h��O.4&��SvP(~��h:��ٞ��+6���A�=�<���	�3�&mI��P,�
�X��?Dܨ���N�6e8�� ���,R�2W��e���V�bWp5�"�y�.*<��]�͂�Ʀ�	E�B��i�dAl%\�6t�l/PK[2��"R�+wls����Ŧik�ܚZYY,��!���Av��L�m��&`�js�ίM�W#�
��Ꜷ�1�4�Fb6l�D/����V� \w����U����Ѫ�@��ɖ�+Q=���0��T-���C`U�A�K��D� ���Ͽ����[�,/�6�:<#���	��������+4��7��0߽F'�k�Z٦DUǶz;˹���������_	t�_Xx�/���#I�LF��9����x	���"�O��/��#�?A�"vj�4+�+N�F���e��9fM05�`����-&[%��I��(g1�LKj�0z�����ւ+H�ǤQ�28)u(� �<������|��5QB[E0�nJ]"� �NP���Ռ�	K6�����B�x W.D2<�ٞ�"z"}��	����J�RUZ���C�r$�$���!��;E�iR�/�Fސ�<-�8!^����`��/>K�I�i.�,G�Gd���o9Q>�6$��4h	p�	}��OK�޻�*K�ր�2�@�!&�"�[�$���H��gf)�#L�-r$Q��L �Ѯ�I� 3��U�hy#��<i������k��Ο�������s��ut��@��G�n'ⳗ&��D^��ۻI�f�R=[�m�@�@������1��JV�'��h@�$�KX��:��1���қT��I��K-�H����������(7sF�P��;V��|֚il�}�j�`�����+f��� �M�V�FϷ�����$I���"{����!��,�"�zi��g�4�+�f2#IX,�}�vojwz�6�Ɔ7WfNj�k֚%�nvY��Y7:�RT�.�L<�p������ڮ)G�g��Q������9xdЅ�;���%���h��C�E"�$���a�f�'��O� �^�V�6./�l���6�.�?��B�vn��e�	Y�� ~Ė�[d�YbF�����	L�{�Shv�eq��}��*8C�wY���9�5p�H�ۮN��]l���j���-	'���f9�˺|&�9���*�	*)2�H>��s���6VKy_*��5�|�[�R]&��}��s���cE9�/�՗���jocee��h��Qc8�S�[2����Ɵ>�ٻM�:�au��(����nj�7򀤍8|� �T�J<2Y�2Eʨ"$#����&�[,Y���݂���$Ѩ�� -#�ٗ2D���n�������"I�^
ϐ�HH/�B�����~ns����.Ԅ�f{��*p��f��,�~L�57�5a� ������eX�����J0�(_;E�S�.4%w��>�M��>hfÐ���g���T`Z���Qf��ia���B<	�ܩo<Y��p��J�AFt(��t�Y�~m�ȁ�7�!x���+�27��1�w�� �X�5��61PI�d��!h�JN������8�
�����5#A��ӹ&+}�X�vU��z��8��ɯ�KZWʜ̄0*��%�DMuW�M��(�q�JE��x�r����GFBC�� w��ęNt,��,d�����(f�e��<@9kE�QxQl�I���AR�@�j��[���k���L������ѳO�j�΍�4�f������<p/���)��������,��LU�t�1�Tf���>�+[��UR�%nh)pk����<�)��8��r��*�bbI)
N:�c� =0��̢�P���y�򕷯u[k�������5���#��p�5�?sio��D�B���d��Z6͗J`2LA<¶i&m�}����!_�r(�|��j��i&xPQ�v���%��rgRݦ�֘*d�ѧ�s</џN�;7M�Hc��(�c���ٹ�B���0���Rl��,
��e�(Ԅ���t��rf��1D�$�A�[��@�8�J�_�����m�&|�(����${�Ǖ����sʒ-9h�&JƊ�.\��?�����q�y����wR��GIq={�3پ'8C52��8P���^�������mMsL�t/:K=ȫI�P����KJ�p{��VRt��0[6E}�,�أ��T�r@�l�)���5�S�)C@@�Н��f6$Lݻ�u���V|]�Av����6ߎ�����x�As�L���;��k������)"�����̇rA�1�6D��ib����se����Vg��r�ɟ	�N�SؽNf�%c�²����|D@bQ�x��v,P�"i����i<���l
=w��1�}fP!6�阱ӗ�Ihl�#_��8��>*���]�Ze�Z��w�C�@���ܔ7qP*���3?�`vw��)���W���;�S�1"�	8�G�>KTh�pF"aN��;�	 %|fZ�'��۾|���t���(� 06_B��IH#����	'd�|�ͮN`[�|�d����AeL^G�[e�sF[S�3��Xk��2�IG�#��mu�N����	��E�2�Aݬ�Ǜ��M�>�r@���ѕ��_(�rN@|D�����\��ﶉ�4L�Z9��Y����ʻ��t&c�	��嵦�P�s���;�_�y�8A�#9�8W8���� 	o�GP#]��Dx��z�x��{?��    ���"i���Q�\:i��
����X&bphy��-s�*��yҰc����B{/�f���Ӹı���s�w%�ڗ0����
���T"i
�;�$�������+W���U�h������|��:�|7��5���c�U�����R|�3{��S�d��Vr.�~Í��m�ۊ�I��ҤD�:+�~ ���&
�,��!>\�P�Y|���_�:�ƌ��:�%���;��z+y�`ekisq}}i}c��d�%�O:>#��r�P���X��8���4I&�4(�pɏ�YE�ͼR��d�8)�!ej���A=Pe�bk<կ��?���c����Π[�e��2oș "�ȷ��3=�\�w���2��Жe�R �y�)`��$�b���ӻ�I�JЪ	�^Ջ|��}r��sr̈�T`e�R7KGNp��o���72>� ��+�e,���E�v���fڥ�FZ�S�O�8&�ĵ�f�_ٵh����1(�l-Z���3OɵX�֢�z�J"]F����l�� ������6�W��b��|���2	p�k��}�sRI���a�
i�ܡ�4�h<Lx}�"ɑ�b�2E��ɜ�J���@�s22����̗��^��R��Ni��y���on����W��J��w����o����v��L_ub�i��_����Jq����m$��툓��|�v?���K	\G�d@����O��_��͍j9r#	è}�s��}��o;��x��v�0��()�O̜�M���7jY�<v�gi�Myc�(��1sf`"]H�奥�Ϙ�5?&���安	��X:j9�'@	��R�+��)c��;�������qÎ��$����1h�է�1l���4��Y�U{"��H �]E��S\��c�ȩQ�޳M:�����q�s@p(�cOB7���>�Kf�1}�';�6�	ƢS*���	�+�qb���tR�1�\{�����OtFYӫ��h�+m��J�x���Z��?�DA�ș��,��R��U�%Ya�-:��N���2>a�K/�%-4����5M����IC��v��b�mB��9�_
��ݬ���'�&�Y2�#��	&�PU'��ɚ=�_SP��sF�O��6d��lWN�z�� ��T��`>�
.�-��T� ����j.�S�h.̓L�'��Y�w��&b5�9EF�̍�/��n���ȏ<�2k<�U�6�nnck��2�}L�
�G�1��O�Kl�&U8�9c�~��J���i+��F|6�2�#|Y�D,���"��:1��Y4�N΄PIԇ�:Q~#���U���)1�쑼F�1���L�v�O���F!%��R��{����ܾ[���C:C���dÔ�0D0y�ؕ��N��LɁ��9�N��fj�<��O7�~���f|��9J�-ٖf��@��H�nH��m�O�����6�aS�ͪQ*��~vM��� 5��~��QF���^��9%�Ngm�=)����s2S�gf�1RW��vOM��jo��	\r�����c���>w��O��<��׿u�7^|�g�������~��#��<B[�Z]]\]�l�t�+������!�N}��h+����9xZi��-���#���-I�$0x��CyDM��1���G�~G�nBV+��n}�,�1[B���M������є{T��U���tq�Ç��<�o/Z6���>GF���F�c���<AF�hQu���CA�H����W�zĮit��Q�-
\@�Ө����\hBI��Y�ıQ��NxwOi���Z�EP�pM�!���&r���Mhd������
�H��ʒ�p&=t�e�f�:6��t(4��)0�ߜ�I}���1��A�^� ;���۝� j
\������G����`!�=�h;��+���Ǉ�uO�ʢu���q%�\�I����ⲗ�v�~��J�W{��~q߸��_|���������~�KO��"j���Q������V˱-�f��\G��ŵ�������Ge�ϒÐN�l�7�g/��)��S��~��{ۗ�m�,�;�>˂�"��w�ȣ�@���+bJ�A�dͿt������c��"=��9��d�����!�ah%���Ə�t\K$M���hy֊*�;�3V,���ص8�Y�h��)��[�됉�~��4-��}�a2ҳ4.27�?b��>�Z��|�3U�a�?�8��e��L�7��dԑ���L�0I�G��V��}#I����w�d����C��@�Hrҍ6H�1'�L�6l8��f�
,pd�#��Ԥ�d�ԟv>����:����'���T�3�U:ܤ���Q��9�i�t_��`��� I���T�2;�qr��rp\�����7Xf�_���f�C�K�-�o�r�P˦Q6"ͰD�(b!r:{9�3���ے���� �#�B��M��Xt��^�\a�ꏍ���eˈDT�b���<s�0�v�w�(�v`�L=�I�\��$�1�OR�6��1m��D����ҹj��U���oY�册�iqh��2�,�,�G�)d����č'$)ںI�B>�'
4iv2���g���Ģ����{��ŀI��'3ndo���y�,K,�P_8�T��"g[L�����kW��v&BVU�|��X���W�"�Nf8fQs�ϼjJ�!ev�r�9ӗ�ΙQ�DlX\2ŧY| n�sf��]��l��-�rr緯������,�l�^���Ng����dNM�%w�E�+���t2L̒F��%ߴ'�&*r�3z�a�"0�P���̔ϩ~��w.=��G�B*-�Z{���;P��7 ��;�qK��س���-X(�vqZF�4��#�,}�������x�r�b�:�����՟m��
c�����w�uޜNNo='m���	gXC�y��ie��TBd��$u��7�%B��F|���--�W�6�7;��I&%�)ū��J���͆��u�����v9��I����g�V�ha̫]	�� �uxYÛ��D-���-<��c��]7(�[ȩ׸����5]��q��L�K�Ff�T�X�"���#ovl�9k����J��ٚ�P�mr|�hJu�Gw��e�t�a@�Y�8eى��6�������U�N�Q[v��٩dx��ԍ�7R��2�n7�1R��L3�h��@*�R�Pv��j�Z�*3��a��t�9@�H��c�����3�-��dC����q���94�i�.ѿ����&]�-��@��2��ň�TT�-�kizC�r5�� H5�
"�O���ڕ��]��~�
�d-[9ݫ��1�]&��Dh7�ф��^\��yj�����%=��*�U�u���&�x�>v��f�E���������)0���>|X�q:L勵�gdQy�</pϾ!��wׁ#���-wEQ�D�B3�9�V���������dp�+|��PL��������3���Y?�\�]-2{��c{9�A}A��sL������t�ݔ)AuQ��0�V��^�"��'Ov���I�������g%0���Y�\�w�`⿃/�9=����k�.��h��z�k3w�ֶ�����+= 9�!�8�[ToUc)e$Al��f����-�O0Vu.#� ��b0���M��9G4jmПߚ/�])2ܣ��t���"�9���.�9t�d	?K��i�{qp��vӦ7��ǥ7�*W�8��#��7�a)�g��U�#�83��r)��!�.��5|��Ls�՘�&�K_���H$��m����P	uS#�"x2%!z���C��xb0��BE�7���a�]K�j�굋ZW}l�ꢦ�5�svEf�lv���!fLZ�����DǬ����ιSlaMZk��Z���Ju�*�J��FP�0a|�,�������4���4G���MH&���i���f���Q������r-c{��bʒ��Q[P��P�"����ʾn%�����a��ۆ5�ϵ��Z�$3�������3�85/W�ڔ���Ù���    ebϪ\���{V	қ|�EJ�6��fţ%hN$S�F�ae��Bie�]Ndz�R�Ɓ8!8 0���"�2ml>��y+������2��/)��_S�4���V�Ae� 1�NW�����;Hŀ���_qE��\4���k?�I
e�j��j��ٹt�zY��f�
�s���g�+����g��Y���܉[�8��͞��7���_yW�� �����߄K|b�����;��	Y�). ��핶]a8��2�6�/H��!P\-�*扛px1��Pd}��ɶ;�䴎���
�\�:d#�>�G��W���p�?o
����.���c��bj��)DR��踀��a�ҵ�IB\H�ς6��;�I9b�V����<qxeJ-S�34�~p���0�4.�f
a9�J�HPř,�?;)��؍y��af<$�t.K�.�^l��	P���l	�;�L<�T]�{*<��_Y��͓���J��'_F�e����>2�g*?�O�J��ee�����]PP�1��"il2��)�%Rj�6b�DR�{�������嫈3P�U¶�쨥���ysULvS�6�^;B�F��a���=�m�#�,I�;��	:��Pr��R���ԯl����Ml�TG�(ej�Rq綔�b>^�]�fbO�b��2	�G/��:1�-A��N��5�)f��%��������\�3��K�,o��76�+Z�,�J�g���,�9O[Z�jZ�����6����؀!�gW��?G�!o�#6w��l���Z�),���#F�m6�~��*a�:5dOѢ"v�d�E�R�$/�&��Bj�,������S�U6�"��=M����4%��hgl����V��&|��p��,�^m�7D�X��:1��HM�oH�̹5���!�Ӈ0�n`�,�xV�V��8N��󹒖�툅��/͒]�7�նȇ�(����M��с1lKڳī j�C
ܥi�ud�b㰶���uAU;��,�/���0_�-�'� �C&�9X�L�J�� �����"�H�j�0��,W_�h���>�k!3�_L���THjV5��@�A����Ge�7L���[��.��<���'6x��K-�k>��6�"ʖ���?��Y�\_���K/<��^��zGݒ�4g�uI�t��I��K²խ���������Z��h��숏��7��g{6��ke��eڧ�T�3i�$�I�U��e��緿y�����Iۼ������չl+sO�("�
��k����[3f�%��[�M�:h�ZV�`�"��jql�R��7~��^e�E�u��u�<g��h��������L{���^<��$Ѥ��w�ˎ���T��<�W�?�u�K���5]�ůN����:�+1�q2��ר��i�r�'O@�`K^�4�>��:���"�D��x�����r��VT7�8�dF�'6�F�Vf�� W�2�'�a�U<��6�b�7^J�O�+��]B�3�V%�d.�&�X8�`=Ֆ3!M4mg�:����>��se�X�F��}v*'2+E�N�]�Ӎ��2�JF=��k%�0�H-N}��L�'���e�5Un�4�j:b��.��� �ͺq����'�J��W#�F�)<��M�y�֍|��|s�|���@��(�b�Z~1qJ�&I��l?n)��냿���O��=�[�P�cU;k�����2��}�y~����?�rϔc�����J��n����뛛��d<	}AB�'��\ѝZ���"Ǧ�
�6�Ђt��Ya/�PNK��{ ٫5M�fB��I�^�&�@�d1�U8H¾��EV]䴣H�Ȱ/�WӰ k����fo,`>��u���J�7�O��NAwPwoRb�tLf6`��9��^S�)� %�^�1�K~�V3�����n,�%mH-vLS����6�q�D?���L:V#P�mWC��Z�j�v٠.���G�z�0/��(b<w3h*K��� ����n܋bК���D��UL��
�j�z�`��{T���R�2+9�;�SB�#��r�='�N��%ݵ$�s���&uв�]C|�.����B:@f{�Ʋ�㮵q4�������i^�#�r��h9�-!z�����KfE�(�Cwh%P[຺d�h�@C;�C\��0{,�*� Ym'E�b�8@q�a�ܕ�j�*�If�e%)�LQ3{X38_s��
c&i*��T�z� �#iE1��k��QF�wo
+6:�HF����b.�RYb�t��j+1�p��������$ F}/�z�3�n"��A	���B�){��Ȍ���O�[ƿv�p��Ǉ��*�"cvZ��y�1���F�<�6[ Nv-S���p��4uᲥBQ��S��(�A�/���I%�ˌ8��&�2�K`�� q(j�D6�����Ώ������+�)p�k
63��e�3~�4XxL�qH�0�A��m^�(Z�$�Z�֡jI��Zc���yLN�ZJFXEm����C���E�)=q���%C�.4�a�N�ڧ� ����
J-��!뤴C-N'�3S(%x~����D�6��.��zV�l{�!�D�F�8)�M[������;-zK�*�U�ҳ	X��U���ı<&Y�L��H'�J���'�g|�(g�ͮ������e[�rUeQ'ۊ�����ć9`��w((�{�Y����
ø���6��S�f�^���d�� �Ƒ���̵L��qȉ/����$�g����#R?�
r?f�FI�E�H�#v_�YP���i��iö��q�a�̄���K���X;CZ:�����\v�������h��ɂg����#��π\�U/˖	�χ&�<#KU��E)�Mǀ;F���9������\iH�~�E.�&Ä�Y?�U�nI2f��̩Z�C�c�8�t��'�c#�5hJ�5e9:�n<���[N�iE!&A�����N��"1�Y��BZ{'���;B~I3�C��3EN��B�U�jT�[��H���j��09���wn�Q:m4w�s�x�1���~�C�LL���0s��$Z��9Py#��<C�m���*V�"�h]�yc��$�ފ`�`[�L�4ש���*Nre�v��L84'��0��%'�)�Ī�]/��3���J�$���RI�nbфdd��8���]��!}o;z�W�H��|M,*Q�Y��+�:����<�
ㆴ���!w���d̉��L�Hf�s7���0	F�5��{�f6����ᩫO0%J��%�D5��3K�gD:�S�혻��})�C�S����H�"��LtR�&�"��iB��R��U�jc��Dh�}0�)����<��3TB�-ߗ��ݘ��E��Gb��ZX�緷�n���O;�I���A�J��U"MC�$�J�SFZ�־9t<T�{r���"k���o�oi�7���8��7�k��r������o`N�e�.5w"�H+M��#p9y���YYY[��9��	��|n�	9"�m���j-_������������z�c�	s�,^�.^��o��������aX�"?/)9ja+l���2��N������
��s#�h��?�����U�,��t�q--՜��	2�'RT���2>G:��Y*�9-���`��KN%P��1��g�W���	����HX��ú �k�MR�'��D�gӄ�غ�ՒI�v�Kl�!�H�T!n�{I������8V�mKs�.�Dk<��lcʹB@^ŗ.g���$�C�p	�?�	�I"t$��$� ���A�(��Mi��E=+�j[E��ZP����^���~��
ȡf�6\-	�V�&��P�n����n��kR�k������R`4������c��q��d�źiDt��g��]#1@=2�*� ��0�;�w�߅��Ic٩�zO�9�O1�Lޝ���|��̕2�4��TJ����&�xf2ƜUy�V�]OR?����wZzB~��_��\}����Nq���N�8����Ts�X��E2�ִ�+O�lt~�J'@��h�l�Ԥ̚���[`&_��P�(������P   iĚ�(EB|g(<�Fk�G��8�T�-ڈ��"��L�}�j�ˍ�ZV�t��4�𒀵�'�A�/�{���"�_�
WH�����_+8�s�ޙzr
�K�Ҕ��p�)U	"�;kP�IZ�L^/�]<�b�����Z&e��DC����`�
�����T��J-4)�;K��}�C��5bh�W�1#i�8���60���X�=�Mᄝ'�N�����x��~x�����D<i�/7��;���:4BA�ێ�SSa>��@)V6�n�c�_�f��u�^�g< �G-���ڽQ��i�����5��8�6΋��Ԡ-t)NpϨJP ��DW2K m)~��H
�F�`h�wQ�N�0j6����D��.����9 ͷ�P>m��	��M�<��05��͙Z�M�������qb�}�� �H����פ�,�W���o'N�m��	�<��?x�'W��y�M�v?���R����B�(�\R&/�{��鸙�EY��
�J%ڑ��I]=���J�s�	'?���p'Y�r����t/��k����o��z���{��y<�����c��g��ro������ V�O�~q
x�!�g�uU��Y���߿~��f�K����xU�w��Km��dv�ȡ�+Y#��rhn�(z���r��@�!�F�"-ʃ��a����!%�,�C���P�X�Vlr�+��:��	��-hz�3.f�,�A3�0��²[\�k���P��y�k��
�*ʭ$E����yٛ�����ǒ<�Ȏz��e�2�*��޷�_�Iķ�c�?�B���I�CsQ��zj��cݦz�g�\:��\�}�c]A)T�����'�J�[�1��W�a�\�<�ޜ����U�C��,%�H�"D�k�S�hv��1e~�AV ��T�r�R���\���;��q�� �Hp�R<le~iT�Z��
m#��{�z�zJ%�qPD�ў���N�y�����@S���>����Ed��H�n��;�b6V��k�5��s]���V�Rp��P(�ԝTU`�0n5-4�	��+�BH�	�D�8
^h�J詯fJ�?������6�S���цW&���IR�$�!rM��m�a��W&�0f�HP�-���%��8Z.2�cR��Ln�&�^��sO_22$WA�U�%����i�H�0y���ԝ[lf̖?O���~�pE���>wa$]��F\�/t�S ���eG*�@"VT�_����VX1��$s<Љ�s��,jy�n�dɮ�&ғ��|�yk�K�<_J�S�\�A��{��O�t��H�/c'����Mr�[2ܣ�̗�0&D>���L��a}<p��b1�d�C��"�'s��*��%����3�[�H�������G������T����7qD �!�I�YX�e�!�ԕ�b"�J����_G�RC�"@49劃e��2yA}6�f�/��	�3�}��L��y�m�O�b���u�4 QxQ���r0�CO5]���g����(���N@VQa�)�ƟԈF�5�y��T��2>^�Q�Nxm�ԝ�/���,�[���#�	@D����Kj����rD*3�7c��i4�Nx��y���ϣ��3�,//u�(� �>������s=��`n���c6�K[����nك�����HI��w����5��9�V�bD���|�,6�.i�ጩdښ-�Tِ�Hڃ���W��%Gւ[�W�؜8%��/;eCiPN�&𹰐���Fo����o�x�z��kW�;߻r�ڻWBRc~�g̃��Yi�v�$���VF���SO=� �h�      0      x�3��4�42������ ��     