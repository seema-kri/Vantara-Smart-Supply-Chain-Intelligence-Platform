CREATE TABLE dim_customers (
    customer_id         INT PRIMARY KEY,
    customer_segment    VARCHAR(50),
    customer_city       VARCHAR(100),
    customer_state      VARCHAR(100),
    customer_country    VARCHAR(100)
);

CREATE TABLE dim_products (
    product_id          INT PRIMARY KEY,
    category_name        VARCHAR(100),
    department_name       VARCHAR(100),
    product_name         VARCHAR(150),
    product_price        NUMERIC(10,2)
);

CREATE TABLE dim_location (
    location_id          INT PRIMARY KEY,
    order_city            VARCHAR(100),
    order_country         VARCHAR(100),
    market                VARCHAR(50),
    order_region           VARCHAR(50),
    order_state             VARCHAR(100)
);

CREATE TABLE dim_date (
    date            DATE PRIMARY KEY,
    year            INT,
    month           INT,
    month_name      VARCHAR(10),
    quarter         INT,
    day_of_week     VARCHAR(15)
);

CREATE TABLE fact_orders (
    order_id                  INT,
    order_item_id             INT PRIMARY KEY,
    order_date                DATE,
    shipping_date             DATE,
    fulfilment_time_days      INT,
    customer_id               INT REFERENCES dim_customers(customer_id),
    product_id                INT REFERENCES dim_products(product_id),
    location_id               INT REFERENCES dim_location(location_id),
    sales                     NUMERIC(10,2),
    order_item_total          NUMERIC(10,2),
    order_profit_per_order    NUMERIC(10,2),
    order_item_discount       NUMERIC(10,2),
    order_item_discount_rate  NUMERIC(5,2),
    order_item_quantity       INT,
    order_item_profit_ratio   NUMERIC(6,3),
    shipping_mode             VARCHAR(50),
    delivery_status           VARCHAR(50),
    late_delivery_risk        INT,
    order_status              VARCHAR(50),
    payment_type              VARCHAR(50)
);