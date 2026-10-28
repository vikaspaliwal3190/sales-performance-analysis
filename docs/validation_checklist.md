# Validation Checklist

> **Status: not executed in this repository.** Check items only after you run the tests and record evidence.

## Database and data quality
- [ ] Confirm `sales_analysis` and all cleaned tables exist.
- [ ] Confirm actual table columns and types match SQL scripts.
- [ ] Record row count, distinct nonblank orders, sales, cost, recorded profit, margin.
- [ ] Check null keys, null measures, invalid dates, negative quantities.
- [ ] Check exact duplicate rows and understand repeated order IDs.
- [ ] Verify dimension key uniqueness.
- [ ] Quantify missing/unmatched customer, product and region keys and their sales impact.
- [ ] Investigate profit reconciliation difference without silently changing recorded profit.

## Business metric reconciliation
- [ ] Yearly sales, profit, margin and YoY growth match Power BI.
- [ ] Discount band boundaries and discount scale match Power BI.
- [ ] Product totals and margin rankings match Power BI.
- [ ] Category totals match after taxonomy review.
- [ ] Regional totals match after key mapping review.
- [ ] All comparisons use identical date ranges, filters, null handling and order definitions.

## Evidence log
For each check, record:
- Query/script name and execution date.
- MySQL output or screenshot stored locally.
- Corresponding Power BI visual or measure.
- Difference and tolerance.
- Root cause and resolution.
- Status: Pass / Fail / Investigating / Not applicable.

Do not commit customer-level outputs, credentials, connection strings, or sensitive screenshots.
