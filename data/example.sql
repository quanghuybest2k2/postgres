-- Drop if exists
DROP TABLE IF EXISTS payments, order_items, orders, products, users CASCADE;

-- Users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0
);

-- Orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Order Items
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id INT NOT NULL REFERENCES products(id),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Payments
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    method VARCHAR(50) NOT NULL
);

-- Insert Users
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com'),
('Eva', 'eva@example.com'),
('Frank', 'frank@example.com'),
('Grace', 'grace@example.com'),
('Hank', 'hank@example.com'),
('Ivy', 'ivy@example.com'),
('Jack', 'jack@example.com');

-- Insert Products
INSERT INTO products (name, price, stock) VALUES
('Laptop', 1200.00, 10),
('Phone', 800.00, 20),
('Tablet', 500.00, 15),
('Monitor', 300.00, 12),
('Keyboard', 50.00, 30),
('Mouse', 25.00, 50),
('Printer', 200.00, 8),
('Headphones', 100.00, 25),
('Webcam', 70.00, 18),
('Chair', 150.00, 10);

-- Insert Orders
INSERT INTO orders (user_id) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

-- Insert Order Items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1,1,1,1200.00),
(2,2,1,800.00),
(3,3,2,1000.00),
(4,4,1,300.00),
(5,5,3,150.00),
(6,6,2,50.00),
(7,7,1,200.00),
(8,8,2,200.00),
(9,9,1,70.00),
(10,10,1,150.00);

-- Insert Payments
INSERT INTO payments (order_id, amount, method) VALUES
(1,1200.00,'Credit Card'),
(2,800.00,'PayPal'),
(3,1000.00,'Bank Transfer'),
(4,300.00,'Credit Card'),
(5,150.00,'Cash'),
(6,100.00,'PayPal'),
(7,200.00,'Bank Transfer'),
(8,200.00,'Credit Card'),
(9,70.00,'Cash'),
(10,150.00,'PayPal');
