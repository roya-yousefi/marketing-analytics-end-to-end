-- Customer value by subscription
with C as (
select [subscription], sum([count_Customers]) as customer
from [dbo].[clean_Customers]
group by [subscription]),

P as(
select [subscription], sum([count_Parcels]) as paracel
from [dbo].[clean_Parcels]
group by [subscription])

select C.[subscription], CAST(P.paracel as float)/(C.customer) as paracel_customer
from C
join P
on(C.[subscription]= P.[subscription])

