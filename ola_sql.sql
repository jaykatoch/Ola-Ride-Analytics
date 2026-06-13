create database ola;
use ola;

-- 1 all successful booking
Create View Successful_Booking As
select * from bookings 
where Booking_status = 'Success';

-- 2 find average ride distance for each vehicle type;
create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;

-- 3 Get the total no of canceled ride by customer;
Create view cancel_ride_by_customer as
select * from bookings where  Booking_status = 'Canceled by Customer';

-- 4 list the top 5 customer who booked the highest no of rides;
create view customer_with_highest_rides as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;
 
-- 5 Get the no of rides canceled by drivers due to personal and car related issues ;
create view canceled_by_drivers_p_c_issues as
select Customer_ID from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issues';
 
-- 6 find the max and min driver rating for Prime sedan bookings
create view max_min_driver_rating_Prime_sedan as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = 'Prime Sedan';

-- 7 Retrieve all rides where payment was made using UPI;
create view payment_by_UPI as
select * from bookings
where Payment_Method = 'UPI'; 

-- 8 Find average customer rating per vehicle type
Create view avg_cust_rating_per_vehicle as
select Vehicle_Type, avg(Customer_Rating) as avg_cust_rating
from bookings
group by Vehicle_Type;

-- 9 calculate the total booking value of rides completed successfully
create view value_of_successfull_rides as
select sum(Booking_Value) as total_successfull_value
from bookings
where  Booking_Status ='Success';

-- 10 list all incomplete rides along with the reason
create view Incomplete_rides as 
select Booking_ID, Incomplete_Rides_Reason from
bookings
where Incomplete_Rides= 'Yes';


