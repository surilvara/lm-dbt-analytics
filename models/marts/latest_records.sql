-- Script grabs the most recent results in the table by self joining date on max_date

with t1 as (SELECT * FROM {{ ref('duplicates_rm') }} )

SELECT 
    t1.media_id, 
    t1.tag_id, 
    t1.media_creation_date,

FROM
    t1 JOIN (SELECT MAX(media_creation_date) as max_date FROM t1) as t2 ON t1.media_creation_date = t2.max_date