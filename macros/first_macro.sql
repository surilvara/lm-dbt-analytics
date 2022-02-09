{% macro get_key_list() %}

-- First, grab the distinct values of the column you want to iterate over
{% set key_retrieval_query %}
select 
    distinct key
from {{ ref('duplicates_rm') }}
order by 1
{% endset %}

{% set results = run_query(key_retrieval_query) %}

{% if execute %}
-- The above set returns a table, which is no good as we need a LIST, so we need to access the columns values and convert this series to a list
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}