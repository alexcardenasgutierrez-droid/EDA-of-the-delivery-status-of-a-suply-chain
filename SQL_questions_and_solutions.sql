-- 1. AVG of delay shipping
SELECT sum(days_for_shipping_real - days_for_shipment_scheduled) AS shipping_days_late,
	count() AS orders_late_count,
	round(sum(days_for_shipping_real - days_for_shipment_scheduled) * 1.0 / count(), 2) as shipping_days_late_avg
FROM DataCoSupplyChainDataset_cleaned
WHERE days_for_shipping_real > days_for_shipment_scheduled;

-- 2. AVG of advance shipping
SELECT sum(days_for_shipment_scheduled - days_for_shipping_real) AS shipping_days_early,
	count() AS orders_early_count,
	round(sum(days_for_shipping_real - days_for_shipment_scheduled) * 1.0 / count(), 2) as shipping_days_early_avg
FROM DataCoSupplyChainDataset_cleaned
WHERE days_for_shipping_real < days_for_shipment_scheduled;

-- 3. number or products for each 
SELECT "Product Name", count() AS "sum"
FROM DataCoSupplyChainDataset
GROUP BY "Product Name"
ORDER BY "sum" DESC;

-- 4. number or products for each category
SELECT "Category Name", count() AS "sum"
FROM DataCoSupplyChainDataset
GROUP BY "Category Name"
ORDER BY "sum" DESC;

-- 5. show all orders from january 2015
select "order date (DateOrders)" as order_date
from DataCoSupplyChainDataset
where order_date like '1/%/2015%'
order by order_date;

-- 6. show that these columns represent the same: "days for shipment (scheduled)" and "Shipping Mode"
select "days for shipment (scheduled)" as shipping_days_scheduled, "Shipping Mode" as shipping_mode
from DataCoSupplyChainDataset
group by shipping_days_scheduled, shipping_mode;

-- 7. what is the most used paying type?
select Type, count(Type) as number
from DataCoSupplyChainDataset
group by Type
order by number DESC;

-- 8. what is the order Profit per Order in 2018?
select sum("Sales") as sales_2018
from DataCoSupplyChainDataset
where "order date (DateOrders)" like '%/2018%';

-- 9. most common bought product?
select "Product Name", sum("Order Item Quantity") as number
from DataCoSupplyChainDataset
group by "Product Name"
order by number DESC;

-- 10. total "Order Item Discount" in august 2016
select round(sum("Order Item Discount"),2) as total_discount_august_2016
from DataCoSupplyChainDataset
where "order date (DateOrders)" like '8/%/2016%';
















