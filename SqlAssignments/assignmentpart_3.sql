
use assignments;
/* question 1 */
delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `order_status`(ord_year integer,ord_month integer)
BEGIN
    select ordernumber, orderdate, status 
    from orders 
    where year(orderdate) = ord_year
    and month(orderdate) = ord_month;
    
END; //
call order_status(2005,05);

/* question 2 */
#a
select * from payments;

dCREATE DEFINER=`root`@`localhost` FUNCTION `purchase_status`(cnum integer) RETURNS varchar(10) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	declare pstatus varchar(10) default '';
    declare amt integer default 0;
    
    set amt = (select sum(amount) from payments where customerNumber = cnum) ;
    if amt < 25000 then
      set pstatus = 'Silver';
	elseif amt between 25000 and 50000 then
      set pstatus = 'Gold';
	else 
       set pstatus = 'Platinum';
	end if;
    
RETURN pstatus;
END


#b

select customerNumber, customerName,country,salesrepemployeenumber, purchase_status(customerNumber) as status from customers;
select * from customers ;

/* question 3 */

delimiter //
CREATE TRIGGER update_cascade 
AFTER UPDATE ON `movies` 
FOR EACH ROW
BEGIN
    update rentals set movieid = new.id
    where movieid = old.id;
END; //

-- On delete cascade
delimiter //
CREATE TRIGGER delete_cascade 
AFTER DELETE ON `movies` 
FOR EACH ROW
BEGIN
   delete from rentals 
   where movieid = old.id;
END;//


/* question 4  */

select fname,salary from employee order by salary desc limit 1 offset 2;

/* question 5  */

select *,
	   dense_rank () OVER (order by salary desc) as Rank_salary
	from employee;



