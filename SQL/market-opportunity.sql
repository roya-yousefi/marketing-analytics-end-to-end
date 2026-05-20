-- market opportunity
with W as (
select [Country], sum ([sessions]) as total_traffic
from [dbo].[clean_Website]
group by [Country]),

C as(
select [Country], sum([count_Customers]) as customer
from [dbo].[clean_Customers]
group by [Country]),

P as(
select [Country], sum([count_Parcels]) as paracel
from[dbo].[clean_Parcels]
group by [Country])

select W.[Country], CAST(C.customer as float)/(W.total_traffic) as traffic_customer, CAST(P.paracel as float)/(W.total_traffic)
from W
join C
on(W.[Country] =C.[Country])
join P
on (W.[Country] =P.[Country])

