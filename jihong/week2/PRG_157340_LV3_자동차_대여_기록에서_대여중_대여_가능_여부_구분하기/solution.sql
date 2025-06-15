-- 중복된 car_id 때문에 고민하다가 찾아보니 MAX를 날짜에도 쓸 수 있고, 이 때 가장 최신 정보를 가져올 수 있다.

SELECT CAR_ID,
    MAX(CASE
        WHEN '2022-10-16' BETWEEN start_date AND end_date THEN '대여중'
    ELSE '대여 가능'
    END) AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY car_id
ORDER BY car_id desc
