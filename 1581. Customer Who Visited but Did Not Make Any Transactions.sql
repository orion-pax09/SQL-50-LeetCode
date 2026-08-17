-- Select the customer ID and count how many matching rows each customer has
SELECT Visits.customer_id, COUNT(*) AS count_no_trans

-- Start with the Visits table
FROM Visits

-- Keep ALL visits, even if they don't have a transaction
LEFT JOIN Transactions

-- Match a visit with its transactions using visit_id
ON Visits.visit_id = Transactions.visit_id

-- Keep only visits where NO transaction was found
WHERE Transactions.transaction_id IS NULL

-- Group the remaining visits by customer
-- This lets COUNT(*) count no-transaction visits separately for each customer
GROUP BY Visits.customer_id;
