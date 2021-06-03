create or replace trigger trg_customer
before insert or update on customer
for each row 
declare 
begin

    if(:new.credits < 0) then
        raise_application_error(-20900,'Credits should be >= 0');
    end if;

    if(inserting) then
        if(:new.birthdate >= sysdate) then
            raise_application_error(-20901,'Birthdate should be < today');
        end if;
    end if;

    if(updating) then
        if(:new.birthdate <> :old.birthdate) then
            :new.birthdate := :old.birthdate;
        end if;
    end if;

    if(:new.email not like '%@%') then
        raise_application_error(-20902,'Email should contain a @');
    end if;

end trg_customer;
