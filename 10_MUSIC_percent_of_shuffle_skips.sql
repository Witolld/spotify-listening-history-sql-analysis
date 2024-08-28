SELECT 
    (CAST((SELECT COUNT(reason_end) 
           FROM sha_all 
           WHERE shuffle LIKE 'true' AND reason_end LIKE 'fwdbtn') AS DECIMAL) 
    / 
    CAST((SELECT COUNT(reason_end) 
          FROM sha_all 
          WHERE shuffle LIKE 'true') AS DECIMAL)) * 100 AS percentage_of_fwdbtn, 'true' as shuffle
UNION ALL
SELECT 
    (CAST((SELECT COUNT(reason_end) 
           FROM sha_all 
           WHERE shuffle LIKE 'false' AND reason_end LIKE 'fwdbtn') AS DECIMAL) 
    / 
    CAST((SELECT COUNT(reason_end) 
          FROM sha_all 
          WHERE shuffle LIKE 'false') AS DECIMAL)) * 100 AS percentage_of_fwdbtn, 'false' as shuffle