/*-------------------------------Æ®¸®°Å : È¸¿ø Å»Åğ½Ã Å»ÅğÇÑ È¸¿ø Á¤º¸ ÀúÀå-----------------------------------*/

create trigger trg_deletemember
after delete
on member
for each row
begin
insert into delete_member
values(:old.id, :old.name, :old.num);
end;