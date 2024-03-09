--Macro is used to set the database name based on the target/env
{% macro database_name(target) %}
  {%- if target.name == "dev" -%} DEV_DBT_FOOTBALL
  {%- elif target.name == "prod"  -%} PROD_DBT_FOOTBALL
  {%- else -%} invalid_database
  {%- endif -%}
{% endmacro %}
