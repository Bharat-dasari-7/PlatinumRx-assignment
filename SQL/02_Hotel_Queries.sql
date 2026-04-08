-- Q1: Last booked room per user
SELECT b.user_id, b.room_no
FROM bookings b
JOIN (
    SELECT user_id, MAX(booking_date) AS last_booking
    FROM bookings
    GROUP BY user_id
) t
ON b.user_id = t.user_id AND b.booking_date = t.last_booking;


-- Q2: Total billing (Nov 2021)
SELECT bc.booking_id,
       SUM(i.item_rate * bc.item_quantity) AS total_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE YEAR(bc.bill_date)=2021 AND MONTH(bc.bill_date)=11
GROUP BY bc.booking_id;


-- Q3: Bills >1000 (Oct 2021)
SELECT bc.bill_id,
       SUM(i.item_rate * bc.item_quantity) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE YEAR(bc.bill_date)=2021 AND MONTH(bc.bill_date)=10
GROUP BY bc.bill_id
HAVING bill_amount > 1000;


-- Q4: Most & least ordered item per month
WITH item_data AS (
    SELECT MONTH(bill_date) AS month,
           item_id,
           SUM(item_quantity) AS total_qty,
           RANK() OVER (PARTITION BY MONTH(bill_date) ORDER BY SUM(item_quantity) DESC) rnk_desc,
           RANK() OVER (PARTITION BY MONTH(bill_date) ORDER BY SUM(item_quantity)) rnk_asc
    FROM booking_commercials
    WHERE YEAR(bill_date)=2021
    GROUP BY MONTH(bill_date), item_id
)
SELECT * FROM item_data
WHERE rnk_desc=1 OR rnk_asc=1;


-- Q5: Second highest bill per month
WITH bill_data AS (
    SELECT MONTH(bc.bill_date) AS month,
           b.user_id,
           bc.bill_id,
           SUM(i.item_rate * bc.item_quantity) AS total_amount,
           RANK() OVER (
               PARTITION BY MONTH(bc.bill_date)
               ORDER BY SUM(i.item_rate * bc.item_quantity) DESC
           ) rnk
    FROM booking_commercials bc
    JOIN bookings b ON bc.booking_id = b.booking_id
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date)=2021
    GROUP BY MONTH(bc.bill_date), bc.bill_id, b.user_id
)
SELECT * FROM bill_data WHERE rnk=2;
