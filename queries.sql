-- ============================================================
-- Yemeksepeti-like Online Food Ordering System
-- 10 Essential Analytical Queries (PostgreSQL)
-- Authors: Samet Güner (240316001), Egemen Darılmaz (220316063)
-- ============================================================

-- 1. List all users
SELECT * FROM users;

-- 2. List all restaurants
SELECT * FROM restaurants;

-- 3. Show all menu items grouped by restaurant
SELECT r.name, m.item_name, m.price
FROM restaurants r
JOIN menus m ON r.restaurant_id = m.restaurant_id;

-- 4. List orders placed by each user
SELECT u.name, o.order_id, o.order_date
FROM users u
JOIN orders o ON u.user_id = o.user_id;

-- 5. Show detailed contents of each order
SELECT o.order_id, m.item_name, d.quantity
FROM orders o
JOIN order_details d ON o.order_id = d.order_id
JOIN menus m ON d.menu_id = m.menu_id;

-- 6. Calculate total amount per order
SELECT o.order_id, SUM(m.price * d.quantity) AS total_amount
FROM orders o
JOIN order_details d ON o.order_id = d.order_id
JOIN menus m ON d.menu_id = m.menu_id
GROUP BY o.order_id;

-- 7. Find the most expensive menu item overall
SELECT * FROM menus
ORDER BY price DESC
LIMIT 1;

-- 8. Count how many orders each restaurant received
SELECT restaurant_id, COUNT(*) AS order_count
FROM orders
GROUP BY restaurant_id;

-- 9. Summarize orders by payment type
SELECT payment_type, COUNT(*) AS payment_count
FROM payments
GROUP BY payment_type;

-- 10. Find the most ordered menu item (by total quantity)
SELECT m.item_name, SUM(d.quantity) AS total_quantity
FROM order_details d
JOIN menus m ON d.menu_id = m.menu_id
GROUP BY m.item_name
ORDER BY SUM(d.quantity) DESC
LIMIT 1;
