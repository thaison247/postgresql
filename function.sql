-- tạo function lấy tổng số film
create function get_film_count (len_from int, len_to int)
returns int
language plpgsql
as
$$
declare
	film_count integer;
begin
	select count(*)
	into film_count
	from film
	where length between len_from and len_to;

    return film_count;
end;
$$

-- gọi function
select get_film_count(50, 90)
select get_film_count(len_from => 40, len_to => 60)

-- PARAMETER MODES: IN - OUT - INOUT
-- IN
create or replace function get_film_stat(
    out min_length int,
    out max_length int,
    out avg_length numeric
)
language plpgsql
as
$$
declare
begin
    select min(length), max(length), cast(avg(length) as numeric(4,1))
    from film
    into min_length, max_length, avg_length;
end;
$$

select get_film_stat() --call function 
select get_film_stat() --call function: column separated

-- OUT
create or replace function swap(
    inout x int, 
    inout y int
)
language plpgsql
as
$$
declare
begin
    select x, y into y, x;
end;
$$;

select * from swap(2, 5);

