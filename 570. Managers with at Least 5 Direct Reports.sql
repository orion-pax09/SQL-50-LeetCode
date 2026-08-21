-- Select the manager's name
SELECT a.name

-- Use the Employee table twice
-- 'a' represents the manager
-- 'e' represents the employee/direct report
FROM Employee AS a

-- Match the manager's ID with the employee's managerId
-- Example: John has id = 101
--          Dan has managerId = 101
-- So John and Dan are matched
JOIN Employee AS e
    ON a.id = e.managerId

-- Group all employees who have the same manager
-- a.id identifies the manager
-- a.name gives us the manager's name
GROUP BY a.id, a.name

-- Keep only managers who have 5 or more direct reports
-- COUNT(a.id) counts how many joined rows belong to the manager
HAVING COUNT(a.id) >= 5;
