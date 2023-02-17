SELECT DISTINCT(A.CAR_ID)
from CAR_RENTAL_COMPANY_CAR A
left join CAR_RENTAL_COMPANY_RENTAL_HISTORY B
on A.CAR_ID = B.CAR_ID
where B.START_DATE like "2022-10%" and A.CAR_TYPE = "세단"
order by A.CAR_ID desc
