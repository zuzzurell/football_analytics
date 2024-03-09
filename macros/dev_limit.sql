{% macro dev_limit() %}
    {% if target.name = 'dev' %}
        select * from {{ this }} limit 1
    {% else %}
        select * from {{ this }}
    {% endif %}
{% endmacro %}
