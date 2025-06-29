-- 식품분류별 가격이 제일 비싼 식품의 분류, 가격, 이름
-- 식품분류가 과자, 국, 김치, 식용유인 경우만 출력
-- 식품 가격을 기준으로 내림차순 정렬

SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE (CATEGORY, PRICE) IN (
    SELECT CATEGORY, MAX(PRICE)
    FROM FOOD_PRODUCT
    WHERE CATEGORY = '과자'
        OR CATEGORY = '국'
        OR CATEGORY = '김치'
        OR CATEGORY = '식용유'
    GROUP BY CATEGORY
)
ORDER BY PRICE DESC
