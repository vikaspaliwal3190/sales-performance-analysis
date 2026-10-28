-- Purpose: annual performance and YoY growth. NULL dates are excluded.
USE sales_analysis;

WITH yearly AS (
    SELECT
        YEAR(order_date) AS sales_year,
        COUNT(DISTINCT order_id) AS distinct_orders,
        SUM(sales_amount) AS total_sales,
        SUM(profit) AS recorded_profit
    FROM orders_clean
    WHERE order_date IS NOT NULL
    GROUP BY YEAR(order_date)
),
with_previous AS (
    SELECT
        sales_year,
        distinct_orders,
        total_sales,
        recorded_profit,
        LAG(total_sales) OVER (ORDER BY sales_year) AS prior_year_sales
    FROM yearly
)
SELECT
    sales_year,
    distinct_orders,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(recorded_profit, 2) AS recorded_profit,
    ROUND(100 * recorded_profit / NULLIF(total_sales, 0), 2) AS margin_pct,
    ROUND(total_sales - prior_year_sales, 2) AS sales_change,
    ROUND(100 * (total_sales - prior_year_sales) / NULLIF(prior_year_sales, 0), 2)
        AS yoy_growth_pct
FROM with_previous
ORDER BY sales_year;
