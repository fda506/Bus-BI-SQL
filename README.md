# Public Transport BI SQL Project

## Overview
This project demonstrates BI-focused SQL skills using a realistic public transport dataset.
The model is designed using fact and dimension tables to reflect common data warehouse
patterns used in BI and analytics teams.

## Objectives
- Analyse punctuality and service reliability
- Measure revenue performance by route
- Evaluate vehicle capacity utilisation
- Handle real-world edge cases (late running, cancellations)

## Data Model
- Fact tables: `fact_trips`, `fact_ticket_sales`
- Dimension tables: `dim_route`, `dim_vehicle`, `dim_stop`, `dim_date`

## Key Metrics
- Average departure delay (minutes)
- On-time performance
- Revenue per route
- Passenger load vs vehicle capacity

## Skills Demonstrated
- Star-schema style modelling
- Multi-table joins
- Conditional aggregation
- Date-driven analysis
- Handling NULLs and cancellations
- BI-ready KPI calculations

## Tools
- SQL (ANSI-style; compatible with MySQL / PostgreSQL / SQL Server with minor changes)

## Future Enhancements
- Add real-time feeds
- Incremental load logic
- Power BI / Tableau visualisations
