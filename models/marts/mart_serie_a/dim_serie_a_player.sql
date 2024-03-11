with load_serie_a as (SELECT * FROM {{ref('int_serie_a__all_season_unioned')}}),

relevant_columns as (
    SELECT
    palyer_sk,
    palyer_id,
    season,
    palyer_role,
    player_name,
    palyer_team,
    FROM load_serie_a
)

SELECT * FROM relevant_columns