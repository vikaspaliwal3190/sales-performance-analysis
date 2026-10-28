# Power BI Deliverables

Keep the `.pbix` file here only if it is safe and permitted to publish. The repository `.gitignore` excludes `.pbix` by default.

Recommended final report pages:
1. Executive Overview
2. Product & Profitability
3. Discount & Sales Drivers
4. Regional & Customer Analysis
5. Optional internal QA - Reconciliation page (can be hidden before publishing)

Recommended model: FactSales + DimCustomer + DimProduct + DimRegion + DimDate.

Before screenshots or publishing, reconcile all key measures to MySQL under identical filters and date rules. Document refresh date and any remaining limitations.
