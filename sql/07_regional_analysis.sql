-- Purpose: regional aggregation. Quantify unmatched region keys separately.
USE sales_analysis;

SELECT
    r.region,
    COUNT(*) AS row_count,
    COUNT(DISTINCT o.order_id) AS distinct_orders,
    ROUND(SUM(o.sales_amount), 2) AS total_sales,
    ROUND(SUM(o.profit), 2) AS recorded_profit,
    ROUND(100 * SUM(o.profit) / NULLIF(SUM(o.sales_amount), 0), 2) AS margin_pct
FROM orders_clean o
JOIN regions_clean r ON o.region_id = r.region_id
GROUP BY r.region
ORDER BY total_sales DESC;
