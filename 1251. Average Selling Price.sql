-- Show the product ID
SELECT s.product_id,

    -- Average selling price:
    -- total revenue (price × units) / total units sold
    -- ROUND to 2 decimal places
    -- If there are no sales, return 0 instead of NULL
    COALESCE(
        ROUND(
            SUM(s.price * u.units) / SUM(u.units),
            2
        ),
        0
    ) AS average_price

-- Start with the Prices table
FROM Prices AS s

-- Keep all products even if they have no sales
LEFT JOIN UnitsSold AS u

    -- Match the same product
    ON s.product_id = u.product_id

    -- Match the sale only with the price active
    -- on the purchase date
    AND u.purchase_date BETWEEN s.start_date AND s.end_date

-- Calculate the average separately for each product
GROUP BY s.product_id;
