# Data Quality Log

> Fill in this log from executed checks. Do not convert exploratory observations into verified results without evidence.

| Issue | Preliminary observation | Validation method | Actual result | Decision / resolution | Status |
|---|---|---|---|---|---|
| Exact duplicate order rows | CSV exploration suggested 50 exact duplicate rows | Compare staging and cleaned row-level records | Not yet recorded | Document deduplication rule and affected totals | Investigating |
| Exact duplicate customer rows | CSV exploration suggested 10 exact duplicate rows | Compare customer keys and full rows | Not yet recorded | Resolve according to key/business rules | Investigating |
| Missing customer IDs | CSV exploration suggested 60 order rows with missing customer IDs | Null-key query and sales impact | Not yet recorded | Unknown member, correction, or documented exclusion | Investigating |
| Missing product IDs | CSV exploration suggested 35 order rows with missing product IDs | Null-key query and sales impact | Not yet recorded | Correct mapping or document unknown category | Investigating |
| Invalid order dates | CSV exploration suggested 10 invalid dates | Compare staging text values to cleaned dates | Not yet recorded | Document exclusions from date analysis | Investigating |
| Negative quantity rows | CSV exploration suggested 15 negative quantity rows | Query negative quantities and inspect transaction policy | Not yet recorded | Confirm returns/corrections policy | Investigating |
| Profit discrepancies | CSV exploration suggested 15 row-level discrepancies beyond tolerance | Compare recorded profit with sales minus cost | Not yet recorded | Investigate; do not overwrite silently | Investigating |
| Product taxonomy | Some product names appeared inconsistent with category/subcategory | Review product master and business definitions | Not yet recorded | Correct with traceable rules or document limitations | Investigating |

The counts in the “Preliminary observation” column come from exploratory CSV work and are not MySQL-validated.
