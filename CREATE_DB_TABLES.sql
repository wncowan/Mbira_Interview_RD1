CREATE TABLE sites (
	siteid INT,
    sitename VARCHAR(100)
);

INSERT INTO sites (siteid, sitename)
VALUES (1, 'sameday'), (2, 'zzounds'), (16, 'ams'), (20, 'shure');


CREATE TABLE orders (
	orderid INT,
    siteid VARCHAR(100),
    installments_code INT,
    placedat DATETIME, 
    notifyemail VARCHAR(100),
    billfname VARCHAR(100),
    billlname VARCHAR(100),
    billaddr1 VARCHAR(100),
    billcity VARCHAR(100),
    billstate VARCHAR(100),
    billzip VARCHAR(100)
);

INSERT INTO orders (orderid , siteid , installments_code , placedat , notifyemail , billfname , billlname , billaddr1 ,billcity ,billstate ,billzip )
VALUES (5000000, 16, 4, '2021-02-06 07:30:59',  'tandalls.bolen1@yahoo.com', 'Bolen', 'Tandalls', '9797 Cram Rd S.', 'Waynes Creek', 'TX', 78584),
	(5000001, 16, 1, '2021-02-06 07:31:09',  'pabloc@ak.gov', 'Pablo', 'Culpepper', '9797 Cram Rd S.', 'Waynes Creek', 'MI', 88557),
	(5000002, 2, 8, '2021-02-06 07:32:35',  'kslant@ymail.com', 'Kristie', 'Slanton', '9797 Cram Rd S.', 'Waynes Creek', 'TX', 78585),
    (5000003, 16, 1, '2021-02-06 07:32:33',  'x_laird_x@earthlink.net', 'A. A.', 'Laird', '9797 Cram Rd S.', 'Waynes Creek', 'WY', 00700),
    (5000004, 16, 5, '2021-02-06 07:37:50',  't.jonz87@gmail.com', 'Terry', 'Jonz', '9797 Cram Rd S.', 'Waynes Creek', 'IL', 60101),
    (5000005, 2, 1, '2021-02-06 07:38:11',  'greg_email@greg.com', 'Greg', 'Sunderland', '9797 Cram Rd S.', 'Waynes Creek', 'NV', 34238),
    (5000006, 2, 7, '2021-02-06 07:39:20',  'josh_k@rhcp.com', 'Joshua', 'Kalvelage', '9797 Cram Rd S.', 'Waynes Creek', 'CA', 90210),
    (5000007, 16, 7, '2021-02-06 07:39:29',  'swimfan@coldmail.com', 'Dave', 'Coulier', '9797 Cram Rd S.', 'Waynes Creek', 'AR', 20903),
    (5000008, 2, 7, '2021-02-06 07:40:39',  'sadele@nbeera.com', 'Stu', 'Adele', '9797 Cram Rd S.', 'Waynes Creek', 'WA', 54467),
    (5000009, 2, 9, '2021-02-06 07:42:26',  'computers@dmail.com ', 'Ronny', 'Crickets', '9797 Cram Rd S.', 'Waynes Creek', 'MD', 10221),
    (5000010, 1, 1, '2021-02-06 07:44:24',  'purchasing@business.biz', 'Ricky', 'Wever', '9797 Cram Rd S.', 'Waynes Creek', 'HI', 99991);
;

CREATE TABLE orderitems (
	orderid INT,
    supplier_item_id INT,
    quantity INT,
    price DECIMAL(8,2)    
)
;
INSERT INTO orderitems(orderid, supplier_item_id, quantity, price)
VALUES (5000000, 181489, 1, 549.00),
	(5000000, 192080, 1, 25.95),
    (5000001, 1107, 2, 7.99),
    (5000002, 117949, 1, 649.00),
    (5000002, 102769, 1, 174.00),
    (5000002, 122384, 2, 33.00),
    (5000002, 224908, 2, 111.00),
    (5000003, 125866, 1, 6.95),
    (5000003, 185186, 1, 699.99),
    (5000004, 181300, 1, 299.00),
    (5000005, 28502, 1, 9.95),
    (5000006, 189840, 1, 1169.00),
    (5000007, 186670, 1, 1499.99),
    (5000008, 190201, 1, 1709.00),
    (5000009, 121405, 2, 354.95),
    (5000009, 66113, 1, 17.95),
    (5000009, 188695, 1, 418.00),
    (5000010, 57659, 2, 23.99)
;


CREATE TABLE items (
	supplier_sku VARCHAR(100),
    supplier_item_id INT,
    sell_price DECIMAL(8,2),
    cost DECIMAL(8,2)
)
;
INSERT INTO items (supplier_sku, supplier_item_id, sell_price, cost)
VALUES ('ADJ AC3PDMX5', 125866, 6.95, 4.46),
	('CBI MLC20 2PAK', 66113, 17.95, 5.42),
    ('CVT GIGBAR2', 188695, 499.99, 306.00),
    ('CVT ISPOTDUO155', 185186, 779.99, 483.59),
    ('DAD EXP10', 28502, 14.99, 8.23),
    ('FAS FASTLAPTOP', 224908, 129.99, 72.00),
    ('GEM CDMP7000', 117949, 749.99, 480.20),
    ('GIB HLPST17 EBCH1', 190201, 1709.00, 1150.65),
    ('GIB SGS17 C6CH1', 189840, 1169.00, 765.46),
    ('HOS HMIC050', 122384, 50.45, 17.64),
    ('MAT D9200 PAK', 57659, 23.99, 19.10),
    ('MUS HWSNK16450', 102769, 199.95, 88.85),
    ('MUS MS7201CH', 192080, 32.95, 11.77),
    ('NEU NL4MMX', 1107, 7.99, 3.93),
    ('NFS ELEZLX112P', 121405, 314.95, 210.56),
    ('SCE OMEN6 BLK', 109331, 399.00, 232.98),
    ('SHU BETA52A', 22634, 189.00, 111.31),
    ('SHU BLX24PG58H10', 181300, 299.00, 179.04),
    ('SHU BLX288PG58H10', 181489, 549.00, 341.27),
    ('YAM YDP163R', 186670, 1299.99, 799.68)
;


