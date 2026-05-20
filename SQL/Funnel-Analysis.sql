--Funnel Drop off
with W as (
select [channel], sum([sessions]) as total_traffic
from [dbo].[clean_Website]
group by [channel]),

A as (
select [channel], sum([count_Account]) as Account 
from [dbo].[clean_Account]
group by [channel]),

C as (
select [channel] , sum([count_Customers])as Customer
from [dbo].[clean_Customers]
group by [channel])

select W.[channel], CAST(A.Account as float)/ (W.total_traffic) as Account_Traffic, 
CAST(C.Customer as float)/(A.Account) as Customer_Account , 
CAST(C.Customer as float)/(w.total_traffic) as Customer_Traffic
from W 
join A
on(W.channel = A.channel)
join C
on (W.channel = C.channel)
