# Metric Definitions

These definitions should be used consistently in SQL and Power BI. Confirm them with the business context before publication.

| Metric | Definition | Notes |
|---|---|---|
| Total Sales | SUM(sales_amount) | Confirm currency, returns and null policy |
| Total Cost | SUM(cost_amount) | Transaction cost, not necessarily product-master cost |
| Total Recorded Profit | SUM(profit) | Preserves source recorded profit |
| Recorded Profit Margin | SUM(profit) / SUM(sales_amount) | Do not average row-level margins |
| Distinct Orders | COUNT(DISTINCT order_id), excluding blank if agreed | Fact grain may be line-level |
| Average Order Value | Total sales / distinct orders | Definition depends on sales and order-count rules |
| YoY Sales Growth | (current-year sales - prior-year sales) / prior-year sales | Align date exclusions and date context |
| Profit Reconciliation Difference | SUM(profit) - (SUM(sales_amount) - SUM(cost_amount)) | Zero expected only if source definitions and completeness support equality |
| Discount Band | No discount; up to 10%; above 10%; unknown | SQL template assumes decimal fraction, e.g. 0.10 = 10% |
