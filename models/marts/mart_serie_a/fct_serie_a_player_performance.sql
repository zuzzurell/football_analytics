with load_serie_a as (SELECT * FROM {{ref('int_serie_a__all_season_unioned')}}),

relevant_columns as (
    SELECT
    palyer_sk,
    palyed_games,
    avg_note,
    avg_fantasy_note,
    goal_scored,
    goal_conceded,
    penalty_saved,
    penalty_conceded,
    penality_scored,
    penality_missed,
    assists,
    ammonitions,
    explusions,
    autogoal
    FROM load_serie_a
)

SELECT * FROM relevant_columns