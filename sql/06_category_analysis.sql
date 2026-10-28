-- Purpose: normalized category aggregation.
-- Check product taxonomy and unmatched product IDs before interpreting rankings.
USE sales_analysis;

SELECT
    UPPER(TRIM(p.category)) AS category,
    COUNT(*) AS row_count,
    COUNT(DISTINCT o.order_id) AS distinct_orders,
    ROUND(SUM(o.sales_amount), 2) AS total_sales,
    ROUND(SUM(o.profit), 2) AS recorded_profit,
    ROUND(100 * SUM(o.profit) / NULLIF(SUM(o.sales_amount), 0), 2) AS margin_pct
FROM orders_clean o
JOIN products_clean p ON o.product_id = p.product_id
GROUP BY UPPER(TRIM(p.category))
ORDER BY margin_pct DESC;
