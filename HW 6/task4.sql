-- 1. List the names of customers who spent more than 450.00 on a single bill on occasions when ‘Charles’ was their Headwaiter.
SELECT DISTINCT b.cust_name
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management rm ON t.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE b.bill_total > 450.00 AND s.first_name = 'Charles';

-- 2. A customer called Nerida has complained that a waiter was rude to her when she dined at the restaurant on the 11th January 2016. 
-- What is the name and surname of the Headwaiter who will have to deal with the matter?
SELECT DISTINCT s.first_name, s.surname
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE rm.room_name = (
    SELECT t.room_name
    FROM restBill b
    JOIN restRest_table t ON b.table_no = t.table_no
    WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111
)
AND rm.room_date = 160111;

-- 3. What are the names of customers with the smallest bill?
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4. List the names of any waiters who have not taken any bills.
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (SELECT DISTINCT b.waiter_no FROM restBill b);

-- 5. Which customers had the largest single bill? 
-- List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.
SELECT b.cust_name, h.first_name AS headwaiter_first_name, h.surname AS headwaiter_surname, t.room_name
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management rm ON t.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff h ON rm.headwaiter = h.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);
