# Financial Analytics dbt Project

A PostgreSQL + dbt project that transforms raw financial transaction data into a tested, documented Star Schema. Implements SCD Type 2 to track historical changes in customer risk ratings, supporting accurate point-in-time analysis and audit use cases.

## What this project does

- Loads 5 years of historical S&P 500 stock price data into PostgreSQL
- Implements a Star Schema with a `transactions` fact table and a `customers` dimension table
- Tracks customer risk rating changes over time using **SCD Type 2**, preserving full history instead of overwriting it
- Transforms raw data through a layered **dbt** pipeline: Staging → Intermediate → Mart
- Includes automated data quality tests (uniqueness, not-null, referential integrity)
- Auto-generates browsable documentation with a full lineage graph

## Tech stack

- PostgreSQL
- dbt-core (+ dbt-postgres adapter)
- SQL: window functions, CTEs, star schema design, SCD Type 2

## Project structure

    financial_risk_mart/
    ├── models/
    │   ├── staging/       # Light cleanup of raw tables
    │   ├── intermediate/  # Joins and business logic
    │   └── mart/          # Final, business-ready tables
    ├── tests/
    └── dbt_project.yml

## Key concepts demonstrated

**Star Schema** — a central `transactions` fact table linked to a `customers` dimension table via a surrogate key (`customer_sk`), keeping historical context accurate without data duplication.

**SCD Type 2** — when a customer's risk rating changes, the old record is preserved with a closed date range (`valid_from`, `valid_to`, `is_current`), and a new row is inserted for the current state. This means every transaction can be correctly linked to the risk rating that was true *at the time*, not just the customer's current status.

**dbt lineage** — the full data flow (raw sources → staging → intermediate → mart) is documented and auto-generated via `dbt docs generate`.