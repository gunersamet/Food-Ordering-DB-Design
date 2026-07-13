-- ============================================================
-- Yemeksepeti-like Online Food Ordering System
-- Database Schema (PostgreSQL)
-- Authors: Samet Güner (240316001), Egemen Darılmaz (220316063)
-- ============================================================

-- Users placing orders
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Restaurants listed on the platform
CREATE TABLE restaurants (
    restaurant_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    address TEXT
);

-- Menu items offered by each restaurant
CREATE TABLE menus (
    menu_id SERIAL PRIMARY KEY,
    restaurant_id INT REFERENCES restaurants(restaurant_id),
    item_name VARCHAR(100),
    price NUMERIC(6,2)
);

-- Orders placed by users at a specific restaurant
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    restaurant_id INT REFERENCES restaurants(restaurant_id),
    order_date TIMESTAMP
);

-- Line items belonging to an order (many-to-many between orders and menus)
CREATE TABLE order_details (
    detail_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    menu_id INT REFERENCES menus(menu_id),
    quantity INT
);

-- Payment record for each order
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    amount NUMERIC(8,2),
    payment_type VARCHAR(30)
);
