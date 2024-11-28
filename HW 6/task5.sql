-- 1. Which waiters have taken 2 or more bills on a single date? 
-- List the waiter names and surnames, the dates and the number of bills they have taken.
SELECT s.first_name, s.surname, b.bill_date, COUNT(*) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(*) >= 2;

-- 2. List the rooms with tables that can serve more than 6 people and how many of such tables they have.
SELECT t.room_name, COUNT(*) AS num_tables
FROM restRest_table t
WHERE t.no_of_seats > 6
GROUP BY t.room_name;

-- 3. List the names of the rooms and the total amount of bills in each room.
SELECT t.room_name, SUM(b.bill_total) AS total_bill_amount
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
GROUP BY t.room_name;

-- 4. List the headwaiter’s name and surname and the total bill amount their waiters have taken.
-- Order the list by total bill amount, largest first.
SELECT hw.first_name AS headwaiter_first_name, hw.surname AS headwaiter_surname, SUM(b.bill_total) AS total_bill_amount
FROM restStaff w
JOIN restBill b ON w.staff_no = b.waiter_no
JOIN restStaff hw ON w.headwaiter = hw.staff_no
GROUP BY hw.first_name, hw.surname
ORDER BY total_bill_amount DESC;

-- 5. List any customers who have spent more than £400 on average.
SELECT b.cust_name, AVG(b.bill_total) AS avg_spent
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6. Which waiters have taken 3 or more bills on a single date? 
-- List the waiter names, surnames, and the number of bills they have taken.
SELECT s.first_name, s.surname, b.bill_date, COUNT(*) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(*) >= 3;
