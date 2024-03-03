with load_stagione_22_23 as (
    SELECT * FROM {{source('RAW_SERIE_A','RAW_SERIE_A_2022_2023')}}
),

load_columns as (
    SELECT 
    ID::varchar as palyer_id,
    '2022-2023' as season,
    --test
    'test_col' as test_column,
    'test_col_2' as test_column_2,
    'test_col_3' as test_column_3,
    'test_col_4' as test_column_4,
    'test_col_5' as test_column_5,
    'test_col_6' as test_column_6,
    'test_col_7' as test_column_7,
    'test_col_7' as test_column_8,
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
    {{dbt_utils.generate_surrogate_key(['palyer_id','season','palyer_team'])}} as palyer_sk,
    *
    FROM load_columns
)
SELECT * FROM sk_unique_players