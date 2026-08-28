-- Select the project ID and calculate the average experience
-- of employees working on each project
SELECT p.project_id,

       -- Calculate the average experience years
       -- and round the result to 2 decimal places
       ROUND(AVG(e.experience_years), 2) AS average_years

-- Get data from the Project table and give it the alias "p"
FROM Project AS p

-- Join the Employee table because it contains experience_years
JOIN Employee AS e

    -- Connect both tables using employee_id
    ON p.employee_id = e.employee_id

-- Create separate groups for each project
-- so AVG() calculates an average for every project individually
GROUP BY p.project_id;
