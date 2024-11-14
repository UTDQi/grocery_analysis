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
			*, MAX(current_price) as _max, MIN(current_price) as _min, AVG( current_price ) as _avg, COUNT( current_price ) as _count
		FROM
			uniquedates
		GROUP BY
			product_id)
			
	SELECT
		product.id,product.vendor,product.product_name,product.units,product.brand, stats._max, stats._min, stats._avg, stats._count
	FROM
		stats
	INNER JOIN
		product
	ON stats.product_id = product.id
	WHERE product_name LIKE '%green tea%'  OR product_name LIKE '%greentea%' 
	ORDER BY _count DESC;