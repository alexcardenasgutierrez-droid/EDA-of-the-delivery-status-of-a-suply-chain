# EDA of the Delivery Status of a Supply Chain

**Project Description:** An Exploratory Data Analysis (EDA) and SQL project aimed at analyzing the factors that affect the delivery status of a supply chain, specifically focusing on the impact of market origin and order item quantity.

## Dataset Description
The data for this project is sourced from Kaggle: [DataCo Supply Chain Dataset](https://www.kaggle.com/datasets/evilspirit05/datasupplychain/data).  
* **Dimensions:** Initially contained 180,519 rows and 53 columns. Each row represents a single item.
* **Key Variables:** `delivery_status`, `market`, `order_item_quantity`, and `discount_ratio`.
* **Data Quirks:** The dataset contained no missing values or empty spaces, though several columns contained redundant information and were dropped during the cleaning phase.

## Research Goal
The main business challenge was to understand what factors affect shipment time. The primary research questions were:
1. Does the origin continent (`market`) impact the delivery status?
2. Does the quantity of items per order (`order_item_quantity`) affect whether a shipment is late or on time?

## Steps Taken


* **Data Cleaning:** Selected 9 core columns related to delivery status, grouped by order ID, checked for nulls/outliers, and standardized column names to `snake_case`.
* **Data Analysis (Python):** * *Univariate Analysis:* Explored the distribution of unique values across categorical and numerical columns.
  * *Bivariate Analysis:* Examined the relationships between `delivery_status` and key features like `market` and `order_item_quantity`.
* **Statistical Analysis:** Applied Chi-square tests to determine if correlations existed between variables, and calculated Cramer's V to measure the strength of those correlations.
* **Visualization:** Created bar charts, pie charts, boxplots (confirming no extreme outliers for discount ratio), histograms, and normalized crosstabs.
* **SQL Implementation:** Imported the cleaned data into SQL to answer 10 specific business questions, including calculating average shipping delays, querying monthly profits, and identifying the most common products.

## Main Findings


* **Systemic Delays:** The most common delivery status across the entire dataset is "Late delivery" (accounting for more than 50% of the records). [cite_start]This indicates that the scheduled delivery times configured by the business are highly unrealistic[cite: 1, 2].
* **No Impact from Order Size:** Bivariate and statistical analyses revealed that the amount of items per order does *not* affect the delivery status. [cite_start]The Chi-square test yielded a p-value > 0.05, and Cramer's V was extremely low (0.018), showing virtually no correlation[cite: 1, 2].
* **No Impact from Geography:** The origin continent does not change the shipping pattern. [cite_start]"Late delivery" remains the most common status no matter which market (Europe, LATAM, Pacific Asia, etc.) the order originates from[cite: 1, 2].

## How to Reproduce the Project
* **Prerequisites:** Python 3, a Jupyter environment, core libraries (`pandas`, `matplotlib`, `seaborn`, `scipy`), and a SQL database (e.g., MySQL or PostgreSQL).
* Clone this repository to your local machine.
* Download the dataset from Kaggle and place it in the project root directory.
* Run `main.ipynb` to execute the data cleaning, statistical tests, and visualizations.
* Load the cleaned data into your SQL environment and execute the queries inside `SQL_questions_and_solutions.sql` to replicate the business analysis.

## Next Steps / Ideas for Improvement
* **Temporal & Seasonality Analysis:** Conduct a time-series analysis to identify seasonal patterns or bottlenecks. Do "Late deliveries" spike consistently during specific months, holidays, or days of the week?
* **Financial Impact Assessment:** Analyze the direct correlation between delivery performance and profitability. Does a higher rate of late deliveries lead to increased order cancellations, higher applied discount ratios, or a noticeable drop in overall profit per order?
* **Pivot the Target Variable:** Our statistical analysis revealed that `delivery_status` had very weak correlations with our chosen features (e.g., a Cramer's V of 0.018 for order quantity). A logical next step is to pivot the investigation away from delivery status and target a more impactful metric, such as profitability (`Order Profit Per Order`) or total sales, to uncover stronger actionable business insights.
* **Broader Feature Exploration:** Re-evaluate the original 53 columns of the dataset to identify new relationships that were excluded during the initial data cleaning phase. Investigating how product categories, shipping modes, or customer segments affect overall revenue could yield a much richer analysis.
* **Temporal & Seasonality Analysis:** Shift the focus toward a time-series analysis to identify seasonal sales patterns. Exploring whether order volumes or specific product categories spike consistently during certain months or holidays could provide valuable forecasting data for the supply chain.
* **Interactive Dashboard:** Connect the cleaned SQL database to a Business Intelligence tool like Tableau or Power BI to create a live, interactive dashboard for supply chain managers to monitor delivery performance.

## Repo Structure
| Folder/File | Description |
| :--- | :--- |
| **`main.ipynb`** | The core Jupyter Notebook containing the Python data cleaning, EDA, statistical testing, and visualization code. |
| **`SQL_questions_and_solutions.sql`** | A well-commented SQL script containing the 10 business queries and their respective solutions. |
| **`Presentation.pdf`** | The slide deck summarizing the business problem, the assumptions made, and screenshots of the SQL queries and insights. |
| **`DataCoSupplyChainDataset.csv`** | The raw supply chain dataset used for the analysis. |

## Authors
Built by me [@alexcardenasgutierrez-droid](https://github.com/alexcardenasgutierrez-droid) together with [@MariusGoeren](https://github.com/MariusGoeren) the Ironhack bootcamp of Data Science & Machine Learning.
