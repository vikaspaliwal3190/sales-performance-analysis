# Sales Performance Analysis — Data Analyst Portfolio Project

## Project summary

This portfolio project demonstrates an end-to-end sales analytics workflow using **MySQL 8.0+**, **Power BI**, and **DAX**. It is designed to answer business questions about sales performance, recorded profitability, year-over-year movement, discount bands, product/category differences, and regional contribution.

The workflow covers:

1. Data profiling and data-quality assessment.
2. Cleaning and documenting data issues in MySQL.
3. Building a star-schema model for Power BI.
4. Creating reusable KPI and time-intelligence measures.
5. Validating SQL outputs against Power BI.
6. Translating analytical patterns into cautious, measurable recommendations.
7. Communicating results through a dashboard and presentation.

## Business questions

* How do sales, recorded profit, and margin change over time?
* Which products or categories deserve a profitability review?
* How do recorded margins differ across discount bands?
* How does sales contribution vary by region?
* Which data-quality limitations affect confidence in these comparisons?

## Tools and skills

* **MySQL 8.0+** — SQL profiling, cleaning checks, aggregation, joins, window functions, reconciliation.
* **Power BI** — data model, report design, slicers, navigation, accessibility, QA page.
* **DAX** — sales, recorded profit, margin, distinct orders, and time-intelligence measures.
* **Data analysis** — KPI definitions, exploratory analysis, interpretation, caveats, and recommendations.
* **Documentation** — data dictionary, validation record, README, and presentation.

## Repository structure

```text
sales-performance-analysis/
├── README.md
├── .gitignore
├── sql/
│   ├── 00\_database\_and\_schema\_checks.sql
│   ├── 01\_data\_quality\_checks.sql
│   ├── 02\_baseline\_reconciliation.sql
│   ├── 03\_yearly\_performance.sql
│   ├── 04\_discount\_analysis.sql
│   ├── 05\_product\_profitability.sql
│   ├── 06\_category\_analysis.sql
│   └── 07\_regional\_analysis.sql
├── docs/
│   ├── data\_dictionary.csv
│   ├── validation\_checklist.md
│   ├── data\_quality\_log.md
│   ├── metric\_definitions.md
│   └── limitations.md
├── power\_bi/
│   └── README.md
├── screenshots/
│   └── README.md
└── data/
    └── README.md
```

Do not commit raw customer-level data, credentials, connection strings, or confidential files. Add the `.pbix` only if you have permission to share it and it contains no sensitive data. Large files may be better shared through an approved release or portfolio link.

## Data model

Recommended star schema:

* **FactSales** — transaction/order-line measures and keys from `orders\_clean`.
* **DimCustomer** — customer attributes from `customers\_clean`.
* **DimProduct** — product attributes from `products\_clean`.
* **DimRegion** — geography attributes from `regions\_clean`.
* **DimDate** — continuous calendar table related to the fact date.

Use unique dimension keys, one-to-many relationships from dimensions to the fact table, and single-direction filtering by default. Confirm the true grain of `orders\_clean` before documenting it as order-level or line-level data.

## KPI definitions

|KPI|Definition|
|-|-|
|Total Sales|Sum of `sales\_amount`|
|Total Cost|Sum of `cost\_amount`|
|Total Recorded Profit|Sum of recorded `profit`|
|Recorded Profit Margin|Total recorded profit ÷ total sales|
|Total Orders|Distinct nonblank `order\_id` count, if that is the agreed definition|
|Average Order Value|Total sales ÷ distinct orders|
|YoY Sales Growth|(Current-year sales − prior-year sales) ÷ prior-year sales|
|Profit Reconciliation Difference|Recorded profit − (sales − cost)|

Recorded profit is not assumed to equal sales less cost. Investigate differences rather than silently rewriting source values.

## Key findings

* Total sales approximately **29.50M**, recorded profit approximately **6.76M**, and recorded margin approximately **22.92%**, after exact-row deduplication in the CSV analysis.
* Sales growth from 2024 to 2025 approximately **0.43%** on valid-date records.
* Recorded margin appeared lower in higher discount bands: approximately **26.94%** with no discount, **21.44%** up to 10%, and **13.02%** above 10%.
* Product `P0014` appeared to have a low recorded margin of approximately **7.39%**.
* Category margins appeared to range from approximately **20.00% to 25.57%**, but product taxonomy needs review.
* North appeared to have the highest regional sales and Central the lowest.

## Recommendations framework

Do not state a guaranteed financial uplift. Use the analysis to prioritize tests and monitor outcomes:

* **Growth:** decompose sales into order volume, average order value, and product mix.
* **Discounts:** compare like-for-like products and evaluate incremental profit, not sales alone.
* **Products:** investigate costs, discounting, returns, and master-data mapping for low-margin outliers.
* **Categories:** validate category taxonomy before ranking profitability.
* **Regions:** normalize sales using active customers, market size, and mix before judging performance.

## How to run

1. Create/use the `sales\_analysis` database and load your cleaned tables.
2. Open the scripts in `sql/` in numerical order.
3. Run read-only checks first; save outputs in a local validation log (do not commit sensitive data).
4. Open the Power BI report and review the measures, filters, and visualizations.
5. Keep the data-quality log and project documentation up to date.

Scripts are designed as analysis and validation templates. Review them against your actual schema before running; they do not create or clean your database automatically.

## Portfolio presentation

Include:

* A short problem statement and scope.
* A readable dashboard screenshot.
* One example SQL query and one DAX measure.
* Three to five validated findings with evidence, caveats, and actions.
* A short section on data quality and what remains uncertain.
* A statement of what you personally implemented.

## Author

**Name:** `Vikas Paliwal`  
**Portfolio / LinkedIn:** `\[Add link]`  
**Project status:** Completed

