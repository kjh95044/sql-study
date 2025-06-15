-- 첫번째 풀이 방법(정답)

SELECT 
    S.FLAVOR
FROM (
    SELECT 
        A.FLAVOR AS FLAVOR,
        RANK() OVER( ORDER BY A.TOTAL_ORDER + B.TOTAL_ORDER DESC) AS TOTAL_ORDER_RANK
    FROM FIRST_HALF A
        INNER JOIN (
            SELECT 
                FLAVOR,
                SUM(TOTAL_ORDER) AS TOTAL_ORDER
            FROM JULY
            GROUP BY FLAVOR
        ) AS B
            ON A.FLAVOR = B.FLAVOR
) AS S
WHERE TOTAL_ORDER_RANK <= 3;








