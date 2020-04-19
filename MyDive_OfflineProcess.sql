-- Offline Process
create database MyDrideOffline;
use MyDrideOffline;
Create Table MyDrive(
inode_id bigint NOT NULL,
directory_name varchar(100),
file_name varchar(100),
Creation_date datetime,
Mod_date datetime,
Size bigint(20),
PRIMARY KEY (inode_id)
);

Create Table MyDrive_Current_Status(
inode_id bigint NOT NULL,
directory_name varchar(100),
file_name varchar(100),
Creation_date datetime,
Mod_date datetime,
Size bigint(20),
PRIMARY KEY (inode_id)
);


insert into MyDrive_Current_Status values (1,"biology","organs",now(),now(),20);
insert into MyDrive_Current_Status values (2,"Math","statistics",now(),now(),70);
insert into MyDrive_Current_Status values (3,"Science","Solar System",now(),now(),40);


insert into MyDrive
select *
from MyDrive_Current_Status
where not exists(
	select 1 
    from MyDrive
    where MyDrive.inode_id = MyDrive_Current_Status.inode_id 
);

SET SQL_SAFE_UPDATES = 0;
delete from MyDrive
where not exists(
	select 1
    from MyDrive_Current_Status
    where MyDrive.inode_id = MyDrive_Current_Status.inode_id
);


update MyDrive 
set
	MyDrive.Mod_date = (
		select MyDrive_Current_Status.Mod_date
        from MyDrive_Current_Status
        where MyDrive.inode_id = MyDrive_Current_Status.inode_id
    )
    
where exists(
	select 1 
    from MyDrive_Current_Status
    where MyDrive.inode_id = MyDrive_Current_Status.inode_id and
    MyDrive.Mod_date != MyDrive_Current_Status.Mod_date
);
