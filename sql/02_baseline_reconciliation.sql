-- Purpose: baseline totals to compare with Power BI under identical filters.
USE sales_analysis;

SELECT
    COUNT(*) AS row_count,
    COUNT(DISTINCT order_id) AS distinct_orders_including_possible_blank,
    SUM(sales_amount) AS total_sales,
    SUM(cost_amount) AS total_cost,
    SUM(profit) AS recorded_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales_amount), 0), 2) AS recorded_margin_pct,
    ROUND(SUM(profit) - SUM(sales_amount) + SUM(cost_amount), 2)
        AS profit_reconciliation_difference,
    SUM(order_id IS NULL) AS null_order_id_rows
FROM orders_clean;

-- If blank order IDs must be excluded, use this count for comparisons:
SELECT COUNT(DISTINCT order_id) AS distinct_nonblank_orders
FROM orders_clean
WHERE order_id IS NOT NULL;
