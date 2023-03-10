SELECT A.PRODUCT_ID, B.PRODUCT_NAME, (SUM(A.AMOUNT) * B.PRICE) as TOTAL_SALES
from FOOD_ORDER as A
join FOOD_PRODUCT as B on A.PRODUCT_ID = B.PRODUCT_ID
where A.PRODUCE_DATE like "2022-05-%"
group by A.PRODUCT_ID
order by TOTAL_SALES desc, PRODUCT_ID
