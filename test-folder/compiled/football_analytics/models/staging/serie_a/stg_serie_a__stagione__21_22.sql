with load_stagione_22_23 as (
    SELECT * FROM RAW_FOOTBALL.RAW_SERIE_A.RAW_SERIE_A_2021_2022
),

load_columns as (
    SELECT 
    ID::varchar as palyer_id,
    '2021-2022' as season,
    'test_col_2' as test_column_2,
    'test_col_3' as test_column_3,
    R::varchar as palyer_role,
    nome::varchar as player_name,
    squadra::varchar as palyer_team,
    pv::integer as palyed_games,
    mv::integer as avg_note,
    fm::integer as avg_fantasy_note,
    gf::integer as goal_scored,
    gs::integer as goal_conceded,
    rp::integer as penalty_saved,
    rc::integer as penalty_conceded,
    "R+"::integer as penality_scored,
    "R-"::integer as penality_missed,
    ass::integer as assists,
    amm::integer as ammonitions,
    esp::integer as explusions,
    au::integer as autogoal
    FROM load_stagione_22_23
),
--Add sk for unique player each season
sk_unique_players as (
    SELECT
    md5(cast(coalesce(cast(palyer_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(season as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(palyer_team as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as palyer_sk,
    *
    FROM load_columns
)
SELECT * FROM sk_unique_players