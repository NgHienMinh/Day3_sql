vCREATE TABLE K (
    Channel VARCHAR(10),
    Category VARCHAR(10),
    GMV NUMERIC(5,1)
);
INSERT INTO K (Channel, Category, GMV) VALUES
('Horeca', 'Vegetable', 69.3),
('Horeca', 'Fruit', 25.3),
('Horeca', 'Non-veggie', 73),
('Horeca', 'Meat', 22.8),
('MT', 'Vegetable', 10.9),
('MT', 'Fruit', 1.1),
('MT', 'Non-veggie', 0.9),
('MT', 'Meat', 0.4),
('KA', 'Vegetable', 14.6),
('KA', 'Fruit', 0.6),
('KA', 'Non-veggie', 8),
('KA', 'Meat', 2.2),
('3rd Party', 'Vegetable', 0.8),
('3rd Party', 'Fruit', 0.6),
('3rd Party', 'Non-veggie', 1.2),
('3rd Party', 'Meat', 0);

--a. Write a SQL query to find the best category in each channel (in GMV)
WITH ranked_categories AS (
    SELECT 
        Channel,
        Category,
        GMV,
        RANK() OVER (PARTITION BY Channel ORDER BY GMV DESC) as rank
    FROM K
)
SELECT 
    Channel,
    Category,
    GMV
FROM ranked_categories
WHERE rank = 1
ORDER BY GMV DESC;

--b. Write a SQL query to find how many percentages each category is higher or lower between Horeca and MT channel.
WITH horeca_data AS (
    SELECT 
        Category,
        GMV as GMV_horeca
    FROM K
    WHERE Channel = 'Horeca'
),
mt_data AS (
    SELECT 
        Category,
        GMV as GMV_mt
    FROM K
    WHERE Channel = 'MT'
)
SELECT 
    'Horeca' as Channel_1,
    'MT' as Channel_2,
    h.Category,
    h.GMV_horeca as GMV_1,
    m.GMV_mt as GMV_2,
    ROUND((h.GMV_horeca / m.GMV_mt) -1 , 2) as Comparision
FROM horeca_data h
JOIN mt_data m ON h.Category = m.Category
ORDER BY Comparision DESC;
