# Limitations and Interpretation Guardrails

## Validation status
All preliminary numerical findings below originated from exploratory CSV calculations. They have not been reconciled against the cleaned MySQL tables or the final Power BI report. Keep them labeled **preliminary / not validated** until the validation checklist is completed.

## Known or suspected data limitations
- The exploratory analysis indicated exact duplicate rows in orders and customers; cleaning rules and effects on metrics need database confirmation.
- Some order records appeared to have missing customer/product keys.
- Some dates appeared invalid in the raw data, so time-based analysis may use a smaller population than total sales.
- Negative quantities may represent returns or corrections and should not be removed without understanding the data policy.
- A small number of rows appeared to have recorded profit different from sales minus cost.
- Product category/subcategory mapping appeared inconsistent for some records; category rankings are provisional.
- Inner joins to dimensions may exclude unmatched fact rows. Quantify the sales and profit impact.
- Discount band comparisons are observational and do not prove discounts cause lower margin.
- Regional sales alone do not establish overperformance or underperformance without market/customer context.
- Two annual observations do not establish a durable long-term trend.

## Preliminary candidate findings (not validated)
- CSV exploration suggested total sales around 29.50M, recorded profit around 6.76M and recorded margin around 22.92% after exact-row deduplication.
- CSV exploration suggested 2025 sales growth of around 0.43% versus 2024 on valid-date records.
- CSV exploration suggested recorded margin declines across increasing discount bands.
- CSV exploration flagged product P0014 as a low-margin candidate.
- CSV exploration suggested category margins from around 20.00% to 25.57%.
- CSV exploration suggested North had the highest regional sales and Central the lowest.

These are investigation prompts, not verified claims. Replace with results reproduced in MySQL and Power BI.

## Recommendations
Treat recommendations as hypotheses. Establish a baseline, test interventions where feasible, and measure incremental profit or other agreed outcomes. Do not promise a specific uplift without supporting evidence.
