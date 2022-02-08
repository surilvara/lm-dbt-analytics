{% macro get_key_list() %}

{% set key_retrieval_query %}
select 
    distinct key
from {{ ref('duplicates_rm') }}
order by 1
{% endset %}

{% set results = run_query(key_retrieval_query) %}

{% if execute %}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}