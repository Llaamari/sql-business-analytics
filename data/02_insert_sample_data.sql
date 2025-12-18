INSERT INTO customers (full_name, email, country, signup_date, is_active) VALUES
('Aino Korhonen', 'aino@example.com', 'Finland', '2024-01-15', TRUE),
('Maacah Langbroek', 'maacah@example.com', 'Netherlands', '2024-02-10', TRUE),
('Saad Zaman', 'saad@example.com', 'Greece', '2024-03-05', TRUE),
('Jaagup Saar', 'jaagup@example.com', 'Estonia', '2024-03-20', TRUE),
('Ea Dalgaard',   'ea@example.com', 'Denmark',  '2024-04-02', FALSE);

INSERT INTO products (sku, product_name, category, unit_price_eur) VALUES
('SKU-1001', 'Wireless Mouse',      'Accessories', 29.90),
('SKU-1002', 'Mechanical Keyboard', 'Accessories', 119.00),
('SKU-2001', '27" Monitor',         'Displays',    249.00),
('SKU-3001', 'USB-C Hub',           'Accessories', 49.90),
('SKU-4001', 'Laptop Stand',        'Office',      39.90);

-- Orders across months, multiple channels, includes refunded/cancelled
INSERT INTO orders (customer_id, order_date, status, channel) VALUES
(1, '2024-03-01 10:15:00', 'paid',     'web'),
(1, '2024-04-12 18:40:00', 'paid',     'mobile'),
(2, '2024-04-15 09:05:00', 'paid',     'web'),
(3, '2024-05-02 12:30:00', 'refunded', 'web'),
(4, '2024-05-20 20:10:00', 'paid',     'store'),
(2, '2024-06-05 14:00:00', 'cancelled','mobile');

INSERT INTO order_items (order_id, product_id, quantity, unit_price_eur) VALUES
(1, 1, 1, 29.90),
(1, 3, 1, 249.00),

(2, 2, 1, 119.00),
(2, 4, 1, 49.90),

(3, 1, 2, 29.90),
(3, 5, 1, 39.90),

(4, 3, 1, 249.00),

(5, 4, 2, 49.90),
(5, 5, 1, 39.90),

(6, 2, 1, 119.00);
