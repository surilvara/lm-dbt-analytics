{{ config(materialized="table") }}

SELECT 
    m._id as media_id, 
    REPLACE(tag, "\"","") as tag_id,
    JSON_EXTRACT_SCALAR(tr, '$._id') as tagrel_id

FROM {{ source('datalake', 'media') }} as m, UNNEST(tags) as tag
LEFT JOIN UNNEST(m.tagRelationships) as tr
WHERE _id IN ('61df14bf32be0e00098f36d3', '61df14bfe09f4b0009186f15', '61df17ecbb547f0009c0e72c')