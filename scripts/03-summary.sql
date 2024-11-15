/*
#### Preamble ####
Purpose: Summarise the sql data
Author: Haobo Ren
Date: 14 Nov 2024
Contact: haobo.ren@mail.utoronto.ca
License: MIT
Pre-requisites: NA
Any other information needed? Make sure you are in the `starter_folder` rproj
*/

WITH
	uniquedates AS (
		SELECT DISTINCT 
			date(nowtime), current_price, product_id 
		FROM
			raw),
	
	stats AS (
		SELECT
			*, MAX(current_price) as max_price, MIN(current_price) as min_price, AVG(current_price) as avg_price, COUNT(current_price) as days_with_price_data
		FROM
			uniquedates
		GROUP BY
			product_id)
			
	SELECT
		product.id,product.vendor,product.product_name,product.units,product.brand, stats.max_price, stats.min_price, stats.avg_price, stats.days_with_price_data
	FROM
		stats
	INNER JOIN
		product
	ON stats.product_id = product.id
	WHERE product_name LIKE '%green tea%'  OR product_name LIKE '%greentea%' 
	ORDER BY days_with_price_data DESC;