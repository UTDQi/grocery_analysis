/*
#### Preamble ####
Purpose: Outline the change in price of lipton ginseng lemon green tea
Author: David Qi
Date: 14 Nov 2024
Contact: haobo.ren@mail.utoronto.ca
License: MIT
Pre-requisites: NA
Any other information needed? Make sure you are in the `starter_folder` rproj
*/




SELECT nowtime, vendor, product_id, product_name, brand, current_price, old_price, units, price_per_unit, other, brand, units
	FROM raw 
	INNER JOIN product 
	ON raw.product_id = product.id 
	WHERE
		(product.product_name LIKE '%green tea%' OR product.product_name LIKE '%greentea%')
		AND product.brand LIKE '%lipton%' AND product.product_name LIKE '%ginseng%' AND product.product_name LIKE '%Lemon%'
		And raw.current_price IS NOT NULL;
		
/* remember to save to .csv after executing */