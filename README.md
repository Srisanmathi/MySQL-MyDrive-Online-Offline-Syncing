# MySQL-MyDrive-Online-Offline-Syncing
Implementation of MyDrive (similar to Google Drive). Involves online and offline process.

Problem:
We are asked to implement MyDride, the competition to Google Drive. The table, MyDrive, contains the information about the drive, in other words, the file system.

The implementation contemplates two separate synchronization processes, one online and one offline. We, as the computer scientist and SQL expert, need to implement both processes. 

The offline process runs every time that the user connects its computer to the internet, populating MyDrive_Current_Status table. MyDrive_Current_Status has the same table structure as MyDrive. MyDrive_Current_Status will have the file system as it is at the time of connection. We need to implement a process to sync the table MyDrive based on the table MyDrive_Current_Status.


Online process:
After writing the offline process, we will need to implement a trigger-based process to automate the synchronization in real-time. That means that every time that the file system gets changed, represented by MyDrive_Current_Status. MyDrive will be updated.

 

Table definition:

Create Table MyDrive(

inode_id bigint NOT NULL,

directory_name varchar(100),

file_name varchar(100),

Creation_date datetime,

Mod_date datetime,

Size bigint(20),

PRIMARY KEY (inode_id),

);
