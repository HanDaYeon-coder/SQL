WITH TRUCKS AS (
    SELECT  A.HISTORY_ID, B.DAILY_FEE, DATEDIFF(END_DATE, START_DATE)+1 AS DATES,
    B.CAR_TYPE,
    CASE WHEN DATEDIFF(END_DATE, START_DATE)+1 >= 90 THEN "90일 이상"
         WHEN DATEDIFF(END_DATE, START_DATE)+1 >= 30 THEN "30일 이상"
         WHEN DATEDIFF(END_DATE, START_DATE)+1 >= 7 THEN "7일 이상"
        ELSE NULL
    END DURATION_TYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY A
    JOIN CAR_RENTAL_COMPANY_CAR B ON A.CAR_ID = B.CAR_ID
    WHERE B.CAR_TYPE = '트럭'
)

SELECT
A.HISTORY_ID, 
ROUND((A.DAILY_FEE * (100 - IFNULL(B.discount_rate,0))/100),0) * DATES AS FEE
FROM TRUCKS A
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN B
ON A.DURATION_TYPE = B.DURATION_TYPE AND A.CAR_TYPE = B.CAR_TYPE
ORDER BY FEE DESC, HISTORY_ID DESC
