SELECT
    name,
    BYTE_LENGTH(name) as len_string,
    MAX(_airbyte_normalized_at) as latest_replication_date
FROM
    {{ ref('stg_artists_base_model') }}
WHERE _airbyte_normalized_at = (SELECT MAX(_airbyte_normalized_at) FROM {{ ref('stg_artists_base_model') }})
GROUP BY 1
