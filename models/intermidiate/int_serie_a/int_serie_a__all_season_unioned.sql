with union_all_serie_a as (
{{dbt_utils.union_relations(
    relations = [
        ref('stg_serie_a__stagione__22_23'),
        ref('stg_serie_a__stagione__21_22'),
        ref('stg_serie_a__stagione__20_21'),
        ref('stg_serie_a__stagione__19_20'),
        ref('stg_serie_a__stagione__18_19'),
        ref('stg_serie_a__stagione__17_18'),
        ref('stg_serie_a__stagione__16_17')
    ]
)}})

Select * FROM union_all_serie_a



