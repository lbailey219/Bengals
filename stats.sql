create or replace function wins()
returns table(win bigint)
as 
$$
begin 
	return query  select count(lb."Result") from lewis_bailey lb where lb."Result" = 'Win';
end;
$$
language plpgsql;


create or replace function losses()
returns table(win bigint)
as 
$$
begin 
	return query  select count(lb."Result") from lewis_bailey lb where lb."Result" = 'Loss';
end;
$$
language plpgsql;

select sum(lb."BoydYards") "Boyd Yards", sum(lb."HigginsYards") "Higgins Yards", sum(lb."ChaseYards") "Chase Yards", wins() ||'-' || losses() "Wins/Losses" from lewis_bailey lb;

