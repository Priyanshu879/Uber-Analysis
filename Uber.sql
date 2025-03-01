
#1. Retrieve all successful bookings

Create view  Successful_Bookings as 
SELECT * FROM bookings 
WHERE Booking_Status = 'Success';

#2. Find the average ride distance for each vehicle type:
Create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as avg_distance 
from bookings 
group by Vehicle_Type; 

select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
create view cancelled_ride_by_coustomer as
select count(*) 
from bookings 
where Booking_Status = "Canceled by Customer";

#4. List the top 5 customers who booked the highest number of rides:
create view highest_no_of_rides as
select Customer_ID, count(Booking_ID) as total_ride
from bookings
group by Customer_ID
order by total_ride desc limit 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view  cancelled_drivers_due_personal_reason as
select count(*)
from bookings 
where Canceled_Rides_by_Driver = "Personal & Car related issue";

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Rating as
select max(Driver_Ratings), min(Driver_Ratings)
from bookings 
where Vehicle_Type = "Prime Sedan";

#7. Retrieve all rides where payment was made using UPI:
create view Payment_by_UPI as 
select * from bookings where Payment_Method = "UPI";

#8. Find the average customer rating per vehicle type:
create view Avg_cust_rating as
select Vehicle_Type, avg(Customer_Rating) as customer_rating
from bookings 
group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
create view total_booking_value as 
select sum(Booking_Value) 
from bookings 
where Booking_Status = "Success";


#10. List all incomplete rides along with the reason:
create view Incomplete_Ride as 
select Booking_ID,  Incomplete_Rides_Reason 
from bookings
where Incomplete_Rides = "Yes";

use Uber;
select * from highest_no_of_rides;
 
