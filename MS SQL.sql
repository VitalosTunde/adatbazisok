create view vszoba as
SELECT sz.*,
		szh.szallas_nev,
        szh.hely,
        szh.csillagok_szama
from Szoba sz JOIN Szallashely szh on sz.szallas_fk = szh.SZALLAS_ID


select * from vszoba


create or alter procedure spugyfelfoglalasok
@ugyfelazon nvarchar(40)
AS
begin
select *
from Foglalas
where ugyfel_fk = @ugyfelazon
end


exec spugyfelfoglalasok 'laszlo2'


create or alter function udfferohely
(
	@fazon int
)
returns int
AS
BEGIN
return 
(
select sz.ferohely
from Foglalas f join Szoba sz on f.szoba_fk = sz.szoba_id
where f.foglalas_pk = @fazon
)
end


select dbo.udfferohely(651)


create or alter function udfferohelyszebb
(
	@fazon int
)
returns int
AS
BEGIN
declare @ferohely int
select @ferohely = sz.ferohely
from Foglalas f join Szoba sz on f.szoba_fk = sz.szoba_id
where f.foglalas_pk = @fazon
return @ferohely
end


select dbo.udfferohelyszebb(651)

