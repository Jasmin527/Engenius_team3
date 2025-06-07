SELECT 
    `timestamp`,
    `P1_FCV01D - P1_FCV01Z_flag`,
    `P1_FCV02D - P1_FCV02Z_flag`,
    `P1_FCV03D - P1_FCV03Z_flag`,
    `P1_LCV01D - P1_LCV01Z_flag`,
    `P1_PCV01D - P1_PCV01Z_flag`,
    `P1_PCV02D - P1_PCV02Z_flag`,
    CASE
        WHEN 
            (`P1_FCV01D - P1_FCV01Z_flag` = 1 OR
             `P1_FCV02D - P1_FCV02Z_flag` = 1 OR
             `P1_FCV03D - P1_FCV03Z_flag` = 1) THEN '유량 밸브 구간'
        WHEN 
            `P1_LCV01D - P1_LCV01Z_flag` = 1 THEN '수위 밸브 구간'
        WHEN 
            (`P1_PCV01D - P1_PCV01Z_flag` = 1 OR
             `P1_PCV02D - P1_PCV02Z_flag` = 1) THEN '압력 밸브 구간'
        ELSE '정상'
    END AS threat_zone
FROM classified_all
WHERE
    `P1_FCV01D - P1_FCV01Z_flag` = 1 OR
    `P1_FCV02D - P1_FCV02Z_flag` = 1 OR
    `P1_FCV03D - P1_FCV03Z_flag` = 1 OR
    `P1_LCV01D - P1_LCV01Z_flag` = 1 OR
    `P1_PCV01D - P1_PCV01Z_flag` = 1 OR
    `P1_PCV02D - P1_PCV02Z_flag` = 1;
    
SELECT 
    threat_zone,
    COUNT(*) AS count
FROM (
    SELECT 
        CASE
            WHEN 
                (`P1_FCV01D - P1_FCV01Z_flag` = 1 OR
                 `P1_FCV02D - P1_FCV02Z_flag` = 1 OR
                 `P1_FCV03D - P1_FCV03Z_flag` = 1) THEN '유량 밸브 구간'
            WHEN 
                `P1_LCV01D - P1_LCV01Z_flag` = 1 THEN '수위 밸브 구간'
            WHEN 
                (`P1_PCV01D - P1_PCV01Z_flag` = 1 OR
                 `P1_PCV02D - P1_PCV02Z_flag` = 1) THEN '압력 밸브 구간'
            ELSE '정상'
        END AS threat_zone
    FROM classified_one
) AS sub
GROUP BY threat_zone
ORDER BY count DESC;


