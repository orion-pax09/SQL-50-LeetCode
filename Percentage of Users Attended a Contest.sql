-- Select the contest ID
SELECT r.contest_id,

-- Count users registered in this contest,
-- divide by total users, multiply by 100,
-- and round the result to 2 decimal places
ROUND(
    (COUNT(r.user_id) / (SELECT COUNT(user_id) FROM Users)) * 100,
    2
) AS percentage

-- Get contest registrations from the Register table
FROM Register AS r

-- Make a separate group for every contest
-- so COUNT() counts users for each contest individually
GROUP BY r.contest_id

-- First sort by percentage from highest to lowest.
-- If percentages are equal, sort by contest_id
-- from smallest to largest
ORDER BY percentage DESC, r.contest_id ASC;
