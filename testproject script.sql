use testproject;






delimiter //
create procedure searchFlights(IN CustomerSource varchar(20), IN Customerdestination varchar(20))
begin
select f.flightId, a.AirlinerName, f.status, f.DateAndTime, S.SourceName, d.DestinationName, f.flightDuration
 from flight f 
 inner join Source s on f.FlightSourceId = s.SourceId 
 inner join Destination d on f.FlightDestinationId= d.DestinationId 
 inner join Airliner a on a.AirlinerId = f. flightAirlinerId where s.SourceName = CustomerSource && d.DestinationName = CustomerDestination;
end //

call searchFlights('Boston','Mumbai');



delimiter //
create procedure checkAvailableSeats(IN BookingFlightId int)
begin
select seatId,seatFlightId, Availability, SeatClassType,SeatClassPrice 
from seat 
inner join seatclass on seat.classId = seatclass.seatClassId 
where seatflightId = (select flightid from flight where flightId = BookingFlightId) order by seatId;
end //

drop procedure checkAvailableSeats;

call checkAvailableSeats(1);




delimiter //
create procedure BookTicket(IN bookingSeatId int, IN passengerId int)
begin 
start transaction;
set transaction isolation level serializable;

insert into ticket(TicketCustomerId ,TicketSeatId) values (passengerId, BookingSeatId);

update ticket
set CustomerName = (Select concat(FirstName,' ' ,LastName) as Name from Customer where customerId = passengerId)
where TicketSeatId = bookingSeatId;

update ticket 
set pricePaid = (select seatclassPrice from seatclass where SeatClassId = (Select classId from seat where seatId = bookingSeatId)) 
																													- ( select rewardpoints from customer where customerId = passengerId)
																														
where ticketSeatId = bookingSeatid;

update customer
set rewardpoints = 0
where customerId = passengerId;

commit;
end //



call bookticket(2,1);




Delimiter //
create trigger DeleteBookedSeats
after insert 
on Ticket
for each row
begin
update seat 
set availability = 'N'
where seatId = new.ticketSeatId;
end //







delimiter //
create procedure populateSchedule()
begin
insert into flightschedule(scheduleId, flightNo) values (1,1);
end //

drop procedure populateSchedule;

alter table flight 
add column Status varchar(30);

update flight
set status = 'Scheduled'
where flightId = 9; 



create view displayScheduleData
as 
select flightId, AirlinerName,SourceName, DestinationName,status from Flight f inner join Airliner a
 on f.FlightAirlinerId = a.airlinerId 
 inner join Source s 
 on f.flightSourceId = s.SourceId
 inner join Destination d 
 on f.FlightDestinationId= d.DestinationId;
 
 select * from displayScheduleData;





delimiter //
create procedure timelapse(IN flightNo int, IN hour int)
begin
declare var datetime;
declare var1 datetime;
declare var3 int;
declare var4 datetime;
declare var5 datetime;
set var5= (select dateAndtime from flight where flightId = flightNo);
set var3 = (select flightDuration from flight where flightId = flightNo);
set var4 = (select addtime(@var5, concat(var3, ':00:00')));
set var1 =( select addtime(@var5, concat(hour,':00:00')));
select var5, var4, var3, var1;
update flight 
set status = 'landed'
where var4- var1 = 0 && flightId = flightNo;
end//


call timelapse (1,10);




delimiter //
create trigger GiveRewardPoints
after 
update on
flight
for each row
begin
if new.status = 'landed'
then
update customer set rewardpoints = rewardpoints+100 
where customerid in(select t.ticketCustomerId from seat s inner join ticket t on s.seatid = t.ticketSeatId where s.seatflightid=new.flightid);
end if;
end //



delimiter //
create function getTraffic (s varchar(20))
returns int deterministic
begin
declare value int;
set value = (select count(*) from flight where FlightSourceId = 
																									(Select SourceId from Source where SourceName = s) || FlightDestinationId 
																										= (Select DestinationId from Destination where DestinationName = s));
return value;

end //



select getTraffic('Boston');



delimiter //
create procedure getItinerary(IN CustomerNo int)
begin
select f.flightId, ticketId,s.seatId, CustomerName ,  SourceName, DestinationName,PricePaid, f.status, f.DateAndTime,f.flightduration,a.airlinerName
from ticket t 
inner join seat s on t.ticketSeatId = s.SeatId 
inner join flight f on s.seatFlightId = f.flightId
inner join Airliner a on f.FlightAirlinerId = a.AirlinerId
inner join Source sou on f.FlightSourceId = sou.SourceId 
inner join Destination d on f.flightDestinationId = d.DestinationId 
inner join customer c on t.TicketCustomerId = c.CustomerId 
where c.customerId = customerNo;
end //

call getitinerary(5);



create user 'Customer'@'localhost' identified by 'customer';
grant select on testproject.customer to 'Customer'@'localhost';
grant execute on procedure testproject.getitinerary to 'Customer'@'localhost';


create user 'BookingAgent'@'localhost' identified by 'agent';
grant select on testproject.flight to 'BookingAgent'@'localhost';
grant select on testproject.customer to 'BookingAgent'@'localhost';
grant select, update, delete on testproject.ticket to 'BookingAgent'@'localhost';
grant execute on procedure testproject.searchFlights to 'BookingAgent'@'localhost';
grant execute on procedure testproject.checkAvailableSeats to 'BookingAgent'@'localhost';
grant execute on procedure testproject.BookTicket to 'BookingAgent'@'localhost';


create user 'AirTrafficController'@'localhost' identified by 'air';
grant execute on function testproject.getTraffic to 'AirTrafficController'@'localhost';
grant select on testproject.displayScheduleData to 'AirTrafficController'@'localhost';
