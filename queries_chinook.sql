-- Use the Chinook database for the questions below:


-- 1 - Display all Sales Support Agents with their first name and last name
select Firstname, LastName, title from  Employee where title = 'Sales Support Agent';

-- 2 - Display all employees hired between 2002 and 2003, and display their first name and last name
select *  from Employee where HireDate >= '2002-01-01' and HireDate < '2004-01-01' ;

--- 3 - Display all artists that have the word 'Metal' in their name
select *  from  Artist where Artist.Name like '%Metal%';

-- 4 - Display all employees which are in sales (sales manager, sales rep etc.)
select *  from  Employee  where Employee.title like '%Sales%';

-- 5 - Display the titles of all tracks which has the genre "easy listening"
select Track.name, Genre.Name as Game from Track  join Genre on Track.Genreid = Genre.Genreid  where Genre.Name = 'easy listening';

-- 6 - Display all the tracks from all albums along with the genre of each track
select Track.name as Track_Name ,Genre.Name as Genre from Track  join Genre on Track.Genreid = Genre.Genreid limit 10;

select ablum.track, track.name, track.genreid from album join track on album.albumid = track.albumid;

--- 7 - Using the Invoice table, show the average payment made for each country
select * from customer.country, avg(Invoice.total), from customer join  invoice on invoice.customerid = customer.customerid  Group By customer.country;

select billingcountry, avg(total) from invoice group by billingcountry;
--- 8 - Using the Invoice table, show the average payment made for each country, but only for countries that paid more than 1,000 in total
select * from Invoice join  where avg(Total) > 1000;

select billingcountry, avg(total) from invoice groupby billingcountry having sum(total) > 100;
-- 9 - Using the Invoice table, show the average payment made for each customer, but only for customer reside in Germany and 
-- only if that customer has paid more than 100 in total

Select Invoice.customerid, avg(invoice.total), sum(invoice.total), customer.country from invoice
join customer on invoice.customerid = customer.customerid
where customer.country = "Germany"
group by invoice.customerid, customer.country
having sum(invoice.total) >10;

-- 10 - Display the average length of Jazz song (that is, the genre of the song is Jazz) for each album
select Track.name, Genre.Name, avg(Milliseconds) from Track  join Genre on Track.Genreid = Genre.Genreid  where Genre.Name = 'Jazz';


select album.albumid, album.title 