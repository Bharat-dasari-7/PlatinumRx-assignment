CREATE TABLE clinics (
    cid VARCHAR(50),
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE customer (
    uid VARCHAR(50),
    name VARCHAR(100),
    mobile VARCHAR(20)
);

CREATE TABLE clinic_sales (
    oid VARCHAR(50),
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount INT,
    datetime DATETIME,
    sales_channel VARCHAR(50)
);

CREATE TABLE expenses (
    eid VARCHAR(50),
    cid VARCHAR(50),
    description TEXT,
    amount INT,
    datetime DATETIME
);

-- Sample data

INSERT INTO clinics VALUES
('c1','Clinic1','Hyderabad','Telangana','India'),
('c2','Clinic2','Bangalore','Karnataka','India');

INSERT INTO clinic_sales VALUES
('o1','u1','c1',1000,'2021-09-10','online'),
('o2','u2','c2',2000,'2021-09-12','offline');

INSERT INTO expenses VALUES
('e1','c1','supplies',500,'2021-09-11'),
('e2','c2','rent',800,'2021-09-12');
