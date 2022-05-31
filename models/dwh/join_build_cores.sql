{{
    materialized = 'incremental',
    alias = 
    unique_key = ''
}}

Select ac.license_id, ac.agent_id, ac."timestamp", cb.id as build_id
FROM {{ref('agent_cores')}} ac
inner join {{ref('coord_build')}} cb
on ac.license_id = cb.license_id
and ac.agent_id = 1
and ac."timestamp" between cb.start_time and cb.end_time