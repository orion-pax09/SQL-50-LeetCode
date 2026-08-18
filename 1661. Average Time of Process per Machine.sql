-- Select the machine ID
SELECT e.machine_id,

       -- Calculate the average time:
       -- end timestamp - start timestamp
       -- ROUND(..., 3) keeps 3 decimal places
       ROUND(AVG(e.timestamp - a.timestamp), 3) AS processing_time

-- Use Activity twice:
-- a = start rows
-- e = end rows
FROM Activity AS a
JOIN Activity AS e

-- Match each start row with its corresponding end row
ON a.machine_id = e.machine_id
AND a.process_id = e.process_id

-- Keep only the START row from table a
WHERE a.activity_type = 'start'

-- Keep only the END row from table e
AND e.activity_type = 'end'

-- Calculate the average separately for each machine
GROUP BY a.machine_id;
