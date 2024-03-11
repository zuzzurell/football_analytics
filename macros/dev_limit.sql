{% macro dev_limit() %}
    {% if target.name == 'dev' %}
        limit 1
    {% endif %}
{% endmacro %}
