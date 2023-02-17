SELECT A.MEMBER_NAME, B.REVIEW_TEXT, 
DATE_FORMAT(B.REVIEW_DATE, "%Y-%m-%d") as REVIEW_DATE
from MEMBER_PROFILE as A
join REST_REVIEW as B on A.MEMBER_ID = B.MEMBER_ID
where B.MEMBER_ID = (
    select MEMBER_ID from REST_REVIEW
    group by MEMBER_ID
    order by count(*) desc
    limit 1
)
order by REVIEW_DATE, REVIEW_TEXT
