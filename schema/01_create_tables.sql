-- Business Analytics SQL Project (PostgreSQL)
-- Schema: customers, products, orders, order_items

CREATE TABLE customers (
  customer_id      BIGSERIAL PRIMARY KEY,
  full_name        TEXT NOT NULL,
  email            TEXT UNIQUE NOT NULL,
  country          TEXT NOT NULL,
  signup_date      DATE NOT NULL,
  is_active        BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE products (
  product_id       BIGSERIAL PRIMARY KEY,
  sku              TEXT UNIQUE NOT NULL,
  product_name     TEXT NOT NULL,
  category         TEXT NOT NULL,
  unit_price_eur   NUMERIC(10,2) NOT NULL CHECK (unit_price_eur >= 0)
);

CREATE TABLE orders (
  order_id         BIGSERIAL PRIMARY KEY,
  customer_id      BIGINT NOT NULL REFERENCES customers(customer_id),
  order_date       TIMESTAMP NOT NULL,
  status           TEXT NOT NULL CHECK (status IN ('paid','refunded','cancelled')),
  channel          TEXT NOT NULL CHECK (channel IN ('web','mobile','store'))
);

CREATE TABLE order_items (
  order_id         BIGINT NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
  product_id       BIGINT NOT NULL REFERENCES products(product_id),
  quantity         INTEGER NOT NULL CHECK (quantity > 0),
  unit_price_eur   NUMERIC(10,2) NOT NULL CHECK (unit_price_eur >= 0),
  PRIMARY KEY (order_id, product_id)
);

-- Useful indexes for analytics queries
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_products_category ON products(category);
