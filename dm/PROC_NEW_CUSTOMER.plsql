create or replace procedure proc_new_customer(
                                        customer_id in out number,
                                        email in varchar,
                                        firstname in varchar,
                                        lastname in varchar,
                                        gender in varchar,
                                        birthdate in date,
                                        credits in out number
                                            ) is

begin

    customer_id := SEQ_CUSTOMER.nextval;

    if credits is null then
        credits := 10;
    end if;

    insert into customer values(customer_id, email, firstname, lastname, gender, birthdate, credits);
end;
