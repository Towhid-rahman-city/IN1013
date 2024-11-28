-- 1. List the names of the waiters who have served the customer Tanya Singh.
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh';

-- 2. On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room?
SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND rm.room_name = 'Green'
      AND rm.room_date BETWEEN 160201 AND 160229;

-- 3. List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4. List the customer name, the amount they spent, and the waiter’s name for all bills. Order by the amount spent, highest bill first.
SELECT b.cust_name, b.bill_total, s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5. List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017.
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b1 ON s.staff_no = b1.waiter_no
WHERE b1.table_no IN (
    SELECT DISTINCT b2.table_no
    FROM restBill b2
    WHERE b2.bill_no IN (14, 17)
);

-- 6. List the names and surnames of the waiters in the team (including the headwaiter) that served the Blue room on 160312.
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT b.waiter_no
    FROM restBill b
    JOIN restRest_table t ON b.table_no = t.table_no
    WHERE t.room_name = 'Blue' AND b.bill_date = 160312
    UNION
    SELECT rm.headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
);
