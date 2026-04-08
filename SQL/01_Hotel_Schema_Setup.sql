-- Create tables

CREATE TABLE users (
    user_id VARCHAR(50),
    name VARCHAR(100),
    phone_number VARCHAR(20),
    mail_id VARCHAR(100),
    billing_address TEXT
);

CREATE TABLE bookings (
    booking_id VARCHAR(50),
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50)
);

CREATE TABLE items (
    item_id VARCHAR(50),
    item_name VARCHAR(100),
    item_rate INT
);

CREATE TABLE booking_commercials (
    id VARCHAR(50),
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity FLOAT
);

-- Insert sample data

INSERT INTO users VALUES
('u1','John','9999999999','john@gmail.com','Address1'),
('u2','Sam','8888888888','sam@gmail.com','Address2');

INSERT INTO bookings VALUES
('bk1','2021-11-10 10:00:00','rm1','u1'),
('bk2','2021-11-15 12:00:00','rm2','u1'),
('bk3','2021-10-10 09:00:00','rm3','u2');

INSERT INTO items VALUES
('i1','Paratha',20),
('i2','Veg Curry',100);

INSERT INTO booking_commercials VALUES
('1','bk1','bill1','2021-11-10 12:00:00','i1',2),
('2','bk1','bill1','2021-11-10 12:00:00','i2',1),
('3','bk2','bill2','2021-11-15 13:00:00','i2',5),
('4','bk3','bill3','2021-10-10 10:00:00','i1',10);
