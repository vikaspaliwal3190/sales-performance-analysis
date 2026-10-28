-- Purpose: read-only quality checks. Inspect before changing or deleting data.
USE sales_analysis;

-- A. Nulls and date range
SELECT
    COUNT(*) AS row_count,
    SUM(order_id IS NULL) AS null_order_id_rows,
    SUM(order_date IS NULL) AS null_order_date_rows,
    SUM(customer_id IS NULL) AS null_customer_id_rows,
    SUM(product_id IS NULL) AS null_product_id_rows,
    SUM(region_id IS NULL) AS null_region_id_rows,
    SUM(sales_amount IS NULL) AS null_sales_rows,
    SUM(cost_amount IS NULL) AS null_cost_rows,
    SUM(profit IS NULL) AS null_profit_rows,
    MIN(order_date) AS earliest_order_date,
    MAX(order_date) AS latest_order_date
FROM orders_clean;

-- B. Duplicate dimension keys
SELECT customer_id, COUNT(*) AS key_count
FROM customers_clean GROUP BY customer_id
HAVING customer_id IS NULL OR COUNT(*) > 1;

SELECT product_id, COUNT(*) AS key_count
FROM products_clean GROUP BY product_id
HAVING product_id IS NULL OR COUNT(*) > 1;

SELECT region_id, COUNT(*) AS key_count
FROM regions_clean GROUP BY region_id
HAVING region_id IS NULL OR COUNT(*) > 1;

-- C. Negative quantities; interpretation depends on return/correction policy
SELECT *
FROM orders_clean
WHERE quantity < 0
ORDER BY order_date;

-- D. Profit reconciliation
SELECT
    COUNT(*) AS row_count,
    SUM(profit) AS recorded_profit,
    SUM(sales_amount) - SUM(cost_amount) AS sales_less_cost,
    SUM(profit) - (SUM(sales_amount) - SUM(cost_amount)) AS reconciliation_difference
FROM orders_clean;
