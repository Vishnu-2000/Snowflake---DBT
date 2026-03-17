with cte as 
(
    select
    t.*
    from 
    {{ ref('trip_fact') }} t
    left join {{ ref('daily_weather') }} w
    on t.trip_date = w.day
    order by trip_date desc
)

select * from cte