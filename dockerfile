FROM public.ecr.aws/docker/library/python:3.9.18-bullseye

WORKDIR /dbt_football_analytics

RUN python --version \
    && pip3 install dbt-snowflake

COPY profiles/profiles.yml /root/.dbt/

COPY . .

RUN dbt deps

