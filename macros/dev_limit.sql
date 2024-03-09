{% macro dev_limit() %}
    {% if "dev_limit" in model.tags | list %}
        select * from {{ this }} limit 1
    {% else %}
        select * from {{ this }}
    {% endif %}
{% endmacro %}
