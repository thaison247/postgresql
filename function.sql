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
