SET @HOUR := -1;
SELECT (@HOUR := @HOUR + 1) AS HOUR,
(SELECT COUNT(*) from ANIMAL_OUTS where DATE_FORMAT(DATETIME, "%H") = @HOUR) AS COUNT
FROM ANIMAL_OUTS
WHERE @HOUR < 23;
