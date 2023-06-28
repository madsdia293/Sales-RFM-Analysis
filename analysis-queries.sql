---Examining data
SELECT * FROM sales_data_sample

--Checking distinct values
SELECT DISTINCT status FROM sales_data_sample
SELECT DISTINCT year_id FROM sales_data_sample
SELECT DISTINCT productline FROM sales_data_sample
SELECT DISTINCT country FROM sales_data_sample
SELECT DISTINCT dealsize FROM sales_data_sample
SELECT DISTINCT territory FROM sales_data_sample


---ANALYSIS

--Grouping sales by productline
SELECT productline, SUM(sales) AS revenue
FROM sales_data_sample
GROUP BY productline
ORDER BY revenue DESC

--Grouping sales by year
SELECT year_id, SUM(sales) AS revenue
FROM sales_data_sample
GROUP BY year_id
ORDER BY revenue DESC

--Checking 2005 months in operation
SELECT DISTINCT month_id FROM sales_data_sample
WHERE year_id = 2005
ORDER BY month_id

--Grouping sales by deal size
SELECT dealsize, SUM(sales) AS revenue
FROM sales_data_sample
GROUP BY dealsize
ORDER BY revenue DESC

--Identifying best month for sales and revenue for that month
SELECT month_id, SUM(sales) AS revenue, COUNT(ordernumber) AS frequency
FROM sales_data_sample
WHERE year_id = 2003
GROUP BY month_id
ORDER BY revenue DESC

---November appears to be the best month for sales and Classic Cars is probably what is sold that most that month
--Checking that hypothesis
SELECT month_id, productline, SUM(sales) AS revenue, COUNT(ordernumber) AS frequency
FROM sales_data_sample
WHERE year_id = 2003 AND month_id = 11
GROUP BY month_id, productline
ORDER BY revenue DESC


---RFM ANALYSIS
--Identifying best customer


DROP TABLE IF EXISTS rfm;
;WITH rfm AS
(
	SELECT
		customername,
		SUM(sales) AS monetary_value,
		AVG(sales) AS avg_monetary_value,
		COUNT(ordernumber) AS frequency,
		MAX(orderdate) AS last_order_date,
		(SELECT MAX(orderdate) FROM sales_data_sample) AS max_order_date,
		(MAX(orderdate) - (SELECT MAX(orderdate) FROM sales_data_sample)) AS recency
	FROM sales_data_sample
	GROUP BY customername

),
rfm_calc AS
(
	SELECT r.*,
		NTILE(4) OVER (ORDER BY recency) AS rfm_recency,
		NTILE(4) OVER (ORDER BY frequency) AS rfm_frequency,
		NTILE(4) OVER (ORDER BY monetary_value) AS rfm_monetary
	FROM rfm r
)
SELECT 
	c.*, rfm_recency + rfm_frequency + rfm_monetary AS rfm_cell,
	CONCAT(CAST(rfm_recency AS varchar), CAST(rfm_frequency AS varchar), CAST(rfm_monetary AS varchar)) AS rfm_cell_string
INTO rfm	
FROM rfm_calc c

--Segementations
SELECT customername, rfm_recency, rfm_frequency, rfm_monetary,
	CASE
		WHEN rfm_cell_string IN ('111', '112', '121', '122', '123', '132', '211', '212', '114', '141') THEN 'disengaged'
		WHEN rfm_cell_string IN ('133', '134', '143', '144', '244', '334', '343', '344') THEN 'fading'
		WHEN rfm_cell_string IN ('311', '411', '412', '421', '331') THEN 'new'
		WHEN rfm_cell_string IN	('221', '222', '223', '233', '232', '234', '322') THEN 'at-risk'
		WHEN rfm_cell_string IN ('323', '333', '321', '422', '332', '432', '423') THEN 'active'
		WHEN rfm_cell_string IN ('433', '434', '443', '444') THEN 'loyal'
	END rfm_segment
FROM rfm
ORDER BY rfm_segment


--Products that are often sold together

--SELECT * FROM sales_data_sample WHERE ordernumber = 10411

SELECT
    ordernumber,
    string_agg(productcode, ', ') AS productcodes
FROM
    sales_data_sample
WHERE
    ordernumber IN (
        SELECT ordernumber
        FROM (
            SELECT ordernumber, COUNT(*) rn
            FROM sales_data_sample
            WHERE status = 'Shipped'
            GROUP BY ordernumber
        ) m
        WHERE rn = 2
    )
GROUP BY ordernumber
ORDER BY productcodes DESC;



