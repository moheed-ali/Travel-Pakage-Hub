create database termproject

--table 0
create table G4_admins(
adid int primary key identity(1,1),
adusername nvarchar(30),
adpassword nvarchar(30),
adfname nvarchar(30) not null,
adlname nvarchar(30) not null,
adcnic nvarchar(20) unique check (adcnic like '_____-_______-_'),
ademail nvarchar(100) unique check (ademail like '%@%._%'),
adphone nvarchar(20) unique check (adphone like '_%-___%'),
adprovince nvarchar(30),
adcity nvarchar(30),
adaddres nvarchar(100),
adregdate date
)
--insertion into table 0
insert into G4_admins values('ali','123','Moheed','Ali','35404-1234567-9','ali@gmail.com','0300-4009307',
							'Punjab','Lahore','house no. 123,block xyz,sector abc',getdate())

--data from table 0
select * from G4_admins
--view for signin
create view signin
as
select adusername,adpassword from G4_admins

select * from signin
--table 1
create table G4_customer(
custid int primary key identity(1,1),
fname nvarchar(30) not null,
lname nvarchar(30) not null,
dob date not null,
cnic nvarchar(20) unique check (cnic like '_____-_______-_'),
email nvarchar(100) unique check (email like '%@%._%'),
phone nvarchar(20) unique check (phone like '_%-___%'),
province nvarchar(30),
city nvarchar(30),
addres nvarchar(100),
regdate date
)
--insertion into table 1
insert into G4_customer values('Fahad','Wassem','1999-10-05','35404-1456567-9','fahad@gmail.com','0300-8579307',
							'Punjab','Lahore','house no. 123,block xyz,sector abc',getdate())
insert into G4_customer values('Arslan','Ali','1998-09-05','35404-1545667-9','arslan@gmail.com','0312-8579307',
							'Punjab','Lahore','house no. 675,block xyz,sector abc',getdate())
insert into G4_customer values('Maham','Kayani','1999-11-06','32504-1456567-9','maham@gmail.com','0300-8248307',
							'Punjab','Islamabad','house no. 123,block fdfz,sector abc','2020-04-05')
insert into G4_customer values('Abdul','Raheem','1997-12-01','35404-1456567-5','raheem@gmail.com','0300-8579204',
							'Punjab','Sailkot','house no. 862,block xyz,sector abc','2020-04-05')
insert into G4_customer values('Zeeshan','Nawaz','1999-06-05','36404-1456567-9','zeeshan@gmail.com','0308-8579307',
							'Punjab','Shahdara','house no. 123,block xyz,sector abc','2020-03-05')
insert into G4_customer values('Rabab','Munawar','2000-10-05','35404-7654321-9','rabab@gmail.com','0313-8579307',
							'Punjab','Khudian','house no. 25,block xyz,sector abc',getdate())
insert into G4_customer values('Abdullah','Javed','1998-10-16','36303-1456567-9','abdullah@gmail.com','0322-8579307',
							'Sindh','Karachi','house no. 123,block xyz,sector abc',getdate())
--data from table 1
select * from G4_customer

--table 2
create table G4_passport(
passid int primary key identity(1,1),
custid int foreign key references G4_customer(custid) unique,
passportno nvarchar(20) unique,
expire_date date 
)
--insertion in table 2
insert into G4_passport values(1,'1234545578481','2030-10-2')
insert into G4_passport values(2,'1234545578482','2040-10-2')
insert into G4_passport values(3,'1234545578483','2025-10-2')
insert into G4_passport values(4,'1234545578484','2020-10-2')
insert into G4_passport values(5,'1234545578485','2020-10-2')
insert into G4_passport values(6,'1234545578486','2021-10-2')
insert into G4_passport values(7,'1234545578487','2022-10-2')
--data from table 2
select * from G4_passport


--table 3
create table G4_country(
countryid int primary key identity(1,1),
countryname nvarchar(30) unique,
continent nvarchar(20)
)
--insertion in table 3
insert into G4_country values('France','Europe')
insert into G4_country values('Italy','Europe')
insert into G4_country values('Newyork','USA')
insert into G4_country values('Canada','USA')
insert into G4_country values('Saudia Arabia','UAE')
--data from table 3
select * from G4_country

--table 4
create table G4_visa(
visaid int primary key identity(1,1),
countrytid int foreign key references G4_country(countryid),
visatype nvarchar(20),
visaprise int
)
--insertion in table 4
insert into G4_visa values(1,'Visit',200000)
insert into G4_visa values(2,'Study',150000)
insert into G4_visa values(3,'Business',500000)
insert into G4_visa values(4,'Visit',220000)
insert into G4_visa values(5,'Visit',230000)

--data from table 4
select * from G4_visa

--table 5
create table G4_visa_customer(
visa_custid int primary key identity(1,1),
custid int foreign key references G4_customer(custid) unique,
visaid int foreign key references G4_visa(visaid) ,
visaissuedate date,
visaexpiredate date
)
--insertion in table 5 
insert into G4_visa_customer values(1,4,'2019-06-06','2020-06-06')
insert into G4_visa_customer values(2,3,'2020-06-06','2030-06-06')
insert into G4_visa_customer values(3,2,'2020-12-06','2021-12-06')
insert into G4_visa_customer values(4,1,'2018-06-06','2020-06-06')
insert into G4_visa_customer values(5,1,'2020-06-06','2022-06-06')
insert into G4_visa_customer values(6,3,'2020-06-06','2022-06-06')
insert into G4_visa_customer values(7,2,'2020-06-06','2022-06-06')
--data from table 5
select * from G4_visa_customer

--table 6
create table G4_duration(
durationid int primary key identity(1,1),
duration int unique
)
--insertion in table 6
insert into G4_duration values (30)
insert into G4_duration values (180)
insert into G4_duration values (15)
insert into G4_duration values (60)
--data from table 6
select * from G4_duration

--table 7
create table G4_travelmode(
modeid int primary key identity(1,1),
modetype nvarchar(20) unique,
modecostperday int
)
--insertion in table 7
insert into G4_travelmode values ('Air',20000)
insert into G4_travelmode values ('Ship',10000)
insert into G4_travelmode values ('Road',5000)
--data from table 7
select * from G4_travelmode

--table 8
create table G4_hotel(
hotelid int primary key identity(1,1),
hotelname nvarchar(30),
hotelrating int,
hoteladdress nvarchar(100) unique,
roomcostperday int
)
--insertion in table 8
insert into G4_hotel values ('Grand Hotel',5,'paris,plot no xyx, street abac',10000)
insert into G4_hotel values ('Float Hotel',4,'Vince,plot no xyx, street abac',9000)
insert into G4_hotel values ('American Hotel',4,'Wall street,plot no xyx, street abac',8000)
insert into G4_hotel values ('Hotel Canada',3,'Vancouvar,plot no xyx, street abac',9500)
insert into G4_hotel values ('Al sehar Hotel',4,'Riyah,plot no xyx, street abac',6500)
--data from table 8
select * from G4_hotel

--table 9
create table G4_pakagetype(
pkgtypeid int primary key identity(1,1),
pkgtype nvarchar(20) unique,
pkgimpact int
)
--insertion in table 
insert into G4_pakagetype values ('Economy',20)
insert into G4_pakagetype values ('Luxury',30)
--data from table 9
select * from G4_pakagetype

--table 10
create table G4_pakage(
pakageid int primary key identity(1,1),
pakagename nvarchar(30) unique,
pkgtypeid int foreign key references G4_pakagetype(pkgtypeid),
countrytid int foreign key references G4_country(countryid),
modeid int foreign key references G4_travelmode(modeid),
durationid int foreign key references G4_duration(durationid),
hotelid int foreign key references G4_hotel(hotelid),
pakagecreatedate date,
pakageexpiredate date,
pakageqty int,
pakagesold int
)
--insertion in table 10
insert into G4_pakage values ('Local France',2,1,1,1,1,GETDATE(),'2020-12-15',10,0)
insert into G4_pakage values ('Simply Italy',1,2,2,2,2,GETDATE(),'2022-12-15',10,0)
insert into G4_pakage values ('New NewYork',2,3,1,3,3,GETDATE(),'2020-12-15',10,0)
insert into G4_pakage values ('Come Canada',1,4,1,1,4,GETDATE(),'2021-12-15',10,0)
insert into G4_pakage values ('Saudia Arabia',2,5,3,2,5,GETDATE(),'2020-12-15',10,0)
--data from table 10
select * from G4_pakage

--stored procedure

create procedure pakagedetail
@id int
as
begin
select pakageid,pakagename,countryname,modetype,hotelname,duration,pkgtype,hotelrating,
		pakagecreatedate,pakageexpiredate,pakageqty,pakagesold from G4_pakage p
		join G4_country c on
		p.countrytid=c.countryid
		join G4_pakagetype pt on 
		p.pkgtypeid=pt.pkgtypeid
		join G4_duration d on 
		p.durationid=d.durationid
		join G4_travelmode tm on
		p.modeid=tm.modeid
		join G4_hotel h on
		p.hotelid=h.hotelid
		where pakageid=@id
end

exec pakagedetail @id=1


--table 11
create table G4_cities(
cityid int primary key identity(1,1),
cityname nvarchar(30),
countrytid int foreign key references G4_country(countryid),
pakageid int foreign key references G4_pakage(pakageid)
)
--insertion in table 11
insert into G4_cities values ('Paris',1,1)
insert into G4_cities values ('Chile',1,1)
insert into G4_cities values ('Vince',2,2)
insert into G4_cities values ('New Jersy',3,3)
insert into G4_cities values ('Upstate',3,3)
insert into G4_cities values ('Vancovar',4,4)
insert into G4_cities values ('Toronto',4,4)
insert into G4_cities values ('Riyah',5,5)
insert into G4_cities values ('Makkah',5,5)
insert into G4_cities values ('Madina',5,5)


--data from table 11
select * from G4_cities


--table 12
create table G4_pakagecost(
pkcost int primary key identity(1,1),
pakageid int foreign key references G4_pakage(pakageid),
cost int
)
--insertion in table 12
insert into G4_pakagecost (pakageid) values (1)
insert into G4_pakagecost (pakageid) values (2)
insert into G4_pakagecost (pakageid) values (3)
insert into G4_pakagecost (pakageid) values (4)
insert into G4_pakagecost (pakageid) values (5)
--data from table 12
select * from G4_pakagecost

--function
create function percentagee(
@val int,
@per int
)
returns float
as
begin
declare @vper float
set @vper=(@val+((@val*@per)/100))
return @per
end

create function min_dis(
@val int,
@per int
)
returns float
as 
begin
declare @vper float
set @vper=(@val+((@val*@per)/100))
set @val=@val-@vper
return @val
end

create function pkfdate(
@date date
)
returns table
as
return
select pakagename,pakagecreatedate,pakageexpiredate from G4_pakage where pakagecreatedate between @date and pakageexpiredate
SELECT * FROM pkfdate('2020-4-10')

--instead of trigger
create TRIGGER pkgcost
ON G4_pakagecost
INSTEAD OF insert
AS
begin
declare @id int
set @id=(select pakageid from INSERTED)
declare @span int 
set @span=(select duration from G4_pakage p join G4_duration d on p.durationid=d.durationid where pakageid=@id)
declare @mode int
set @mode=(select modecostperday from G4_pakage p join G4_travelmode d on p.modeid=d.modeid where pakageid=@id)
declare @room int 
set @room=(select roomcostperday from G4_pakage p join G4_hotel d on p.hotelid=d.hotelid where pakageid=@id)
declare @impact int
set @impact=(select pkgimpact from G4_pakage p join G4_pakagetype d on p.pkgtypeid=d.pkgtypeid where pakageid=@id)
declare @cities int
set @cities=(select count(cityid) from G4_cities where pakageid=@id)
declare @total int
set @total=((@span*@mode)+(@span*@room)+(@span*@cities))
declare @val float
set @val=(select dbo.percentagee(@total,@impact))
set @total=@total+@val
insert into G4_pakagecost values(@id,@total)
end

--table 13
create table G4_cust_pkg(
custid int foreign key references G4_customer(custid) ,
passid int foreign key references G4_passport(passid) unique,
visa_custid int foreign key references G4_visa_customer(visa_custid) unique,
pakageid int foreign key references G4_pakage(pakageid) ,
pakage_cost int,
pakage_purchased_date date,
pakage_purchased int 
)

--insertion in table 13
insert into G4_cust_pkg  values(1,1,1,1,900000,GETDATE(),2)
insert into G4_cust_pkg  values(2,2,2,2,3420200,GETDATE(),5)
insert into G4_cust_pkg  values(3,3,3,5,2070570,GETDATE(),6)
insert into G4_cust_pkg  values(4,4,4,3,420000,GETDATE(),4)
insert into G4_cust_pkg  values(5,5,5,4,885080,GETDATE(),3)
insert into G4_cust_pkg  values(6,6,6,3,420000,GETDATE(),4)
insert into G4_cust_pkg  values(7,7,7,1,900000,GETDATE(),3)
--
create procedure custpkg
@id int
as
begin 
	select fname,lname,passportno,visaissuedate,pakagename,pakage_cost,pakage_purchased_date,pakage_purchased
			from G4_cust_pkg ct 
			join G4_customer c on 
			ct.custid=c.custid
			join G4_passport p on
			ct.custid=p.custid
			join G4_visa_customer vc on
			ct.custid=vc.custid
			join G4_pakage pk on
			ct.pakageid=pk.pakageid
			where ct.custid=@id
end
exec custpkg  @id=1

--data in table 13
select * from G4_cust_pkg




--for trigger

create TRIGGER pkgcust
ON G4_cust_pkg
INSTEAD OF insert
AS
begin
begin transaction my
begin
	declare @custid int
	set @custid=(select custid from INSERTED)
	declare @passid int
	set @passid=(select passid from INSERTED)
	declare @visa_custid int
	set @visa_custid=(select visa_custid from INSERTED)
	declare @pakageid int
	set @pakageid=(select pakageid from INSERTED)
	declare @pakage_cost int
	set @pakage_cost=(select pakage_cost From INSERTED)
	declare @pakage_purchased_date date
	set @pakage_purchased_date=(select pakage_purchased_date from INSERTED)
	declare @pakage_purchased int
	set @pakage_purchased=(select pakage_purchased from INSERTED)
	declare @checkex int
	set @checkex=(select datediff(yyyy,expire_date,getdate()) from G4_passport where custid=@custid)
		if(@checkex=0)begin
			print 'Passport Expired'
			rollback transaction my
		end
	declare @checkav int
	set @checkav=(select pakageqty from G4_pakage where pakageid=@pakageid)
		if(@checkav<@pakage_purchased)begin
			print 'Purchased Quantity is greater than avalible quantity'
			rollback transaction my
			end
		UPDATE G4_pakage
			SET pakageqty = (@checkav-@pakage_purchased), pakagesold = (pakagesold+@pakage_purchased)
			WHERE pakageid=@pakageid;
	declare @range float
	set @range=(select dbo.min_dis(@pakage_cost,5))
	if(@pakage_cost < @range)begin
		print 'Entered cost is way less than margin'
		rollback transaction my
	end
	insert into G4_cust_pkg (custid,passid,visa_custid,pakageid,pakage_cost,pakage_purchased_date,pakage_purchased) 
					values(@custid,@passid,@visa_custid,@pakageid,@pakage_cost,@pakage_purchased_date,@pakage_purchased)
	commit transaction my
	end
end

--list of customers having discount and a luxuary pakage
select concat(fname,' ',lname) As [Name],pakagename,pkgtype,pakage_cost,cost 
		from G4_cust_pkg ct
		join G4_customer  c on 
		ct.custid=c.custid
		join G4_pakage p on 
		ct.pakageid=p.pakageid
		join G4_pakagetype pt on
		p.pkgtypeid=pt.pkgtypeid
		join G4_pakagecost pc on 
		p.pakageid=pc.pakageid
		where cost > pakage_cost
		group by cost,pkgtype,concat(fname,' ',lname),pakagename,pakage_cost,cost
		having pkgtype='Luxury' 
		
--List of Pakages having a duration of 30 days and travel mode air
select pakagename,duration,modetype from G4_pakage p 
		join G4_travelmode m on 
		p.modeid=m.modeid
		join G4_duration d on 
		p.durationid=d.durationid
		where duration=30
		group by pakagename,duration,modetype
		having modetype='Air'

--list of pakage which is notsold and have a hotelrating of 3 or less
select pakagename,pakagesold,hotelrating,hotelname from G4_pakage p
  		join G4_hotel  h on 
		p.hotelid=h.hotelid
		where pakagesold=0
		group by pakagename,pakagesold,hotelrating,hotelname
		having hotelrating<4

--list of customers whose from lahore and their passport is expired or expired in next year
select concat(fname,' ',lname) As [Name],city,passportno,expire_date from G4_passport p
		join G4_customer c on
		p.custid=c.custid
		where city <>'Lahore'
		group by concat(fname,' ',lname),city,passportno,expire_date
		having expire_date < '2021-01-01'

--Complete customer,pakage detail for a single customer
declare @id int
set @id=3
select concat(fname,' ',lname) As [Name],phone,email,cnic,province,city,addres from G4_customer
		where custid=@id 
select pakagename,pkgtype,hotelname,hotelrating,hoteladdress,duration,modetype,cost,countryname,
	pakage_purchased,pakage_purchased_date from G4_cust_pkg ct
	join G4_pakage p on
	ct.pakageid=p.pakageid
	join G4_hotel h on
	p.hotelid=h.hotelid
	join G4_duration d on 
	p.durationid=d.durationid
	join G4_travelmode tm on
	p.modeid=tm.modeid
	join G4_country c on 
	p.countrytid=c.countryid
	join G4_pakagecost pc on
	p.pakageid=pc.pakageid
	join G4_pakagetype pt on
	p.pkgtypeid=pt.pkgtypeid
	where custid=@id
select cityname from G4_cust_pkg ct
	join G4_pakage p on 
	ct.pakageid=p.pakageid
	join G4_cities c on
	p.pakageid=c.pakageid
	where custid=@id



