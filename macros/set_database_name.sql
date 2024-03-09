-- Macro is used to set the database name based on the target/env
{% macro set_database_name() %}
  {% set default_database = target.database %}
  {% if target.name == "dev" %}
    DEV_DBT_FOOTBALL
  {% elif target.name == "prod" %}
    PROD_DBT_FOOTBALL
  {% else %}
    {{ default_database }}
  {% endif %}
{% endmacro %}
