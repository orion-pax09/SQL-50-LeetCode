-- Select the user's ID and calculate their confirmation rate
SELECT
    s.user_id,

    -- Count confirmed requests, divide by total requests,
    -- replace NULL with 0, and round the result to 2 decimal places
    ROUND(
        COALESCE(
            SUM(c.action = "confirmed") / COUNT(c.action),
            0
        ),
        2
    ) AS confirmation_rate

-- Start with the Signups table
FROM Signups AS s

-- Keep every user, even if they have no confirmation requests
LEFT JOIN Confirmations AS c
    ON s.user_id = c.user_id

-- Calculate the confirmation rate separately for each user
GROUP BY s.user_id;
