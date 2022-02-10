SELECT
    "standard_column" as grouped_col,
    SUM(col2),
    MAX(_airbyte_normalized_at)
FROM
    {{ ref('stg_base_model') }}
GROUP BY 1
LIMIT 1