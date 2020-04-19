-- Online Process

create database MyDride;
use MyDride;
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

create trigger after_MyDriveCurrentStatus_insert
after insert
on MyDrive_Current_Status for each row
insert into MyDrive
set 
inode_id = new.inode_id,
directory_name=new.directory_name,
file_name =new.file_name ,
Creation_date =new.Creation_date ,
Mod_date =new.Mod_date ,
Size =new.Size;

insert into MyDrive_Current_Status values (1,"biology","organs",now(),now(),20);
insert into MyDrive_Current_Status values (2,"Math","statistics",now(),now(),70);
insert into MyDrive_Current_Status values (3,"Science","Solar System",now(),now(),40);

create trigger after_MyDriveCurrentStatus_update
after update
on MyDrive_Current_Status for each row
update MyDrive
set directory_name=new.directory_name,
file_name =new.file_name ,
Creation_date =new.Creation_date ,
Mod_date =new.Mod_date ,
Size =new.Size
where inode_id = old.inode_id;

update MyDrive_Current_Status set Mod_date = now() where inode_id = 1;

create trigger after_MyDriveCurrentStatus_delete
after delete
on MyDrive_Current_Status for each row
delete from MyDrive
where inode_id = old.inode_id;

delete from MyDrive_Current_Status
where inode_id = 1;


