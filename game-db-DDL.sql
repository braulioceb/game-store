-- =========================================
-- GAME STORE DATABASE (MySQL)
-- =========================================

CREATE DATABASE IF NOT EXISTS game_testing;
USE game_testing;

-- =========================================
-- 1. CLIENT TABLE
-- =========================================

CREATE TABLE clients (
    id_client INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    date_born DATE
);

-- =========================================
-- 2. PRODUCTS TABLE
-- =========================================

CREATE TABLE products (
    prod_id INT PRIMARY KEY,
    prod_name VARCHAR(100),
    prod_import DECIMAL(10,2),
    prod_desc VARCHAR(255)
);

-- =========================================
-- 3. SALES TABLE
-- =========================================

CREATE TABLE sales (
    purchase_id INT PRIMARY KEY,
    id_client INT,
    prod_id INT,
    purchase_date DATE,
    prod_num INT,
    import DECIMAL(10,2),

    FOREIGN KEY (id_client) REFERENCES clients(id_client),
    FOREIGN KEY (prod_id) REFERENCES products(prod_id)
);

-- =========================================
-- 4. Inventory TABLE
-- =========================================

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    prod_id INT NOT NULL,
    stock_quantity INT NOT NULL,
    min_stock INT NOT NULL,
    max_stock INT NOT NULL,
    unit_cost DECIMAL(10,2) NOT NULL,
    warehouse_section VARCHAR(50),
    supplier_name VARCHAR(100),
    last_restock DATE,

    FOREIGN KEY (prod_id)
        REFERENCES products(prod_id)
);