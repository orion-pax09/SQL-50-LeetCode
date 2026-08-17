-- Select the ID of the current day
SELECT m.id

-- Use the Weather table and give it the alias "m"
FROM Weather AS m

-- Join the Weather table again and give it the alias "n"
-- m and n are two different copies of the same table
JOIN Weather AS n

-- Match m with n when m's date is exactly 1 day after n's date
ON DATEDIFF(m.recordDate, n.recordDate) = 1

-- Keep only the cases where today's temperature is higher
-- than the previous day's temperature
WHERE m.temperature > n.temperature;
