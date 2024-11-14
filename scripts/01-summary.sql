/*
#### Preamble ####
Purpose: Summarise the sql data
Author: David Qi
Date: 14 Nov 2024
Contact: david.qi@mail.utoronto.ca
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
	ON stats.product_id = product.id;