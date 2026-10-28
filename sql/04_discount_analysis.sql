-- Assumption: discount is stored as a decimal fraction (0.10 = 10%).
-- Confirm the source scale before using this categorization.
USE sales_analysis;

SELECT
    CASE
        WHEN discount IS NULL THEN 'Unknown'
        WHEN discount <= 0 THEN 'No discount'
        WHEN discount <= 0.10 THEN 'Up to 10%'
        ELSE 'Above 10%'
    END AS discount_band,
    COUNT(*) AS row_count,
    ROUND(SUM(sales_amount), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS recorded_profit,
    ROUND(100 * SUM(profit) / NULLIF(SUM(sales_amount), 0), 2) AS margin_pct
FROM orders_clean
GROUP BY
    CASE
        WHEN discount IS NULL THEN 'Unknown'
        WHEN discount <= 0 THEN 'No discount'
        WHEN discount <= 0.10 THEN 'Up to 10%'
        ELSE 'Above 10%'
    END
ORDER BY discount_band;
