SELECT A.PRODUCT_CODE, SUM(A.PRICE*B.SALES_AMOUNT) as SALES
from PRODUCT as A
join OFFLINE_SALE as B on A.PRODUCT_ID = B.PRODUCT_ID
group by A.PRODUCT_CODE
order by SALES desc, A.PRODUCT_CODE
