-- =========================================
-- GAME STORE DATABASE (MySQL)
-- =========================================

USE game_testing;

-- =========================================
-- USEFUL QUERIES
-- =========================================

-- Current inventory
SELECT
    i.inventory_id,
    p.prod_name,
    i.stock_quantity,
    i.min_stock,
    i.max_stock,
    i.unit_cost,
    i.warehouse_section
FROM inventory i
JOIN products p
    ON i.prod_id = p.prod_id;

-- Low stock products
SELECT
    p.prod_name,
    i.stock_quantity
FROM inventory i
JOIN products p
    ON i.prod_id = p.prod_id;

-- Inventory total value
SELECT
    SUM(i.stock_quantity * i.unit_cost) AS total_inventory_value
FROM inventory i;

-- =========================================
-- SAMPLE TEST QUERIES
-- =========================================

-- Total sales per month
SELECT
    DATE_FORMAT(purchase_date, '%Y-%m') AS month,
    SUM(import) AS total_sales
FROM sales
GROUP BY month;

-- Top selling products
SELECT
    p.prod_name,
    SUM(s.prod_num) AS total_units
FROM sales s
JOIN products p ON s.prod_id = p.prod_id
GROUP BY p.prod_name
ORDER BY total_units DESC;

-- Purchases by client
SELECT
    c.first_name,
    c.last_name,
    COUNT(s.purchase_id) AS purchases
FROM clients c
JOIN sales s ON c.id_client = s.id_client
GROUP BY c.id_client
ORDER BY purchases DESC;