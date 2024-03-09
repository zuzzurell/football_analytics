-- Macro is used to set the database name based on the target/env

{% macro generate_database_name(custom_database_name=none, node=none) -%}

    {%- set default_database = target.database -%}
    {%- if custom_database_name is none -%}

        {{ default_database }}

    {%- else -%}

          {% if target.name == "dev" %}
            DEV_DBT_FOOTBALL
          {% elif target.name == "prod" %}
            PROD_DBT_FOOTBALL
          {% else %}
            {{ default_database }}
          {% endif %}

    {%- endif -%}

{%- endmacro %}
