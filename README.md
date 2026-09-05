Apple Retail Sales Analytics # Apple Retail Sales Analytics 

An analytics project on Apple's retail sales data (2020–2024) using SQL for analysis, Power BI for interactive visualization, and Microsoft Excel for sales forecasting.

Problem Statement

Apple operates retail stores across multiple countries, selling a wide range of products. With over a million transactions spanning five years, this project builds a consolidated analytics solution — SQL for data cleaning and business-question analysis, Power BI for interactive dashboards, and Excel for forward-looking revenue forecasting — to help stakeholders understand sales trends, store performance, product/category dynamics, product reliability (via warranty claims), and expected future performance.

Tools Used
SQL (My SQL) · Power BI · DAX ·  Microsoft Excel (forecasting)

 📊 Dashboard Preview
<!-- Add screenshots after exporting from Power BI: File → Export → PDF/Image, or just screenshot each page -->
![Dashboard Overview]<img width="1150" height="677" alt="image" src="https://github.com/user-attachments/assets/1620865a-946a-41d0-aa59-e500cf9de70b" />

![Store Performance]<img width="1116" height="625" alt="image" src="https://github.com/user-attachments/assets/0f0d3430-4f95-4bb9-a857-40eb68183d52" />


Dataset
[Apple Retail Sales dataset on Kaggle](https://www.kaggle.com/datasets/amangarg08/apple-retail-sales-dataset) — 5 relational tables:
- `sales` — 1,040,200 transactions (2020-01-01 to 2024-11-12)
- `stores` — 75 stores across 19 countries
- `products` — 89 products
- `category` — 10 product categories
- `warranty` — 30,000 warranty claims

 Key Insights

Revenue
- Total revenue across the full period: **$6.17B**
- Revenue was essentially flat from 2020–2023 (~$1.26–1.27B/year) — a mature, saturated sales base rather than a growth story. 2024 shows a -12.7% YoY figure, but that reflects a partial year (data ends Nov 12, 2024), not a real decline.

Categories
- **Tablet** (15.5%) and **Accessories** (15.0%) are the top two revenue-contributing categories.
- Accessories lead in *unit volume* (899K units) despite Tablets generating more revenue — two distinct performance levers (price vs. volume).
- Smart Speaker (1.6%) and Streaming Device (3.1%) are the smallest revenue drivers.

Stores
- Top performer: **Apple Chadstone, Australia** ($165.2M)
- Bottom performer: **Apple Antara, Mexico** ($80.3M)
- ~2x spread between best and worst-performing stores — a clear target for operational investigation.



Forecast
<!-- Fill in with your actual Excel forecast results -->
<img width="1621" height="668" alt="image" src="https://github.com/user-attachments/assets/2ef812ba-e806-4606-a39e-8f9222fc410d" />

Split the 4 years of monthly revenue into:
Training data: first 3 years
Holdout/test data: final 12 months
Built a forecast using Excel's FORECAST.ETS (exponential smoothing with automatic seasonality detection)
Forecasted 12 months forward and compared predictions against actual holdout values



