#1
CREATE DATABASE db_202255202098;

USE db_202255202098;

-- 2. membuat tabel mahasiswa
CREATE TABLE mahasiswa(
nim INT ,
nama VARCHAR(59),
sem INT,
makul VARCHAR(35),
nidn INT,
nama_dosen VARCHAR(50)
);
-- memasukan data kedalam tabel mahasiswa sesuai Tabel 1 Entitas Mahasiswa 
UnNormal
INSERT INTO mahasiswa VALUES (201001,"Andika 
Syaputra",1,"Algoritma",1078523,"Riyanti Anjani"),
(NULL,"",NULL,"Struktur Data",1078523,"Riyanti 
Anjani"),
(201002,"Biyanti Anggie",3,"Struktur 
Data",1078523,"Riyanti Anjani"),
(NULL,"",NULL,"Orkom",1078523,"Riyanti Anjani"),
(NULL,"",NULL,"Metnum",1075047,"Susan Savitri"),
(201003,"Naura Putri",5,"Web",1075047,"Susan Savitri"),
(NULL,"",NULL,"Jarkom",1077021,"Erwin Musadi"),
(NULL,"",NULL,"Metnum",1075047,"Susan Savitri");
select * from mahasiswa;
#3
update mahasiswa 
set nim = 201001,
nama = "Andika Syaputra",
sem = 1
where (nim is NULL) and makul = "Struktur Data";
update mahasiswa 
set nim = 201002,
nama = "Biyanti Anggie",
sem = 3
where (nim is NULL) and makul = "Orkom";
update mahasiswa set nim = 201002,
nama = "Biyanti Anggie",
sem = 3
where (nim is NULL) and makul = "Metnum" limit 1;
update mahasiswa 
set nim = 201003,
nama = "Naura Putri",
sem = 5
where (nim is NULL) and makul = "Jarkom" ;
update mahasiswa 
set nim = 201003,
nama = "Naura Putri",
sem = 5
where (sem is NULL) and makul = "Metnum" ;
#4 membuat tabel dosen dan isinya
create table dosen (
nidn int,
nama varchar(50),
makul_1 varchar(35),
makul_2 varchar(35),
makul_3 varchar(35)
);
-- memasukan data kedalam tabel dosen
INSERT INTO dosen VALUES (1078523,"Riyanti Anjani","Algoritma","Struktur 
Data","Orkom"),
(1075047,"Susan 
Savitri","Metnum","Web",""),
(1077021,"Erwin Masadi","Jarkom","","");
SELECT * FROM dosen;
ALTER TABLE dosen DROP COLUMN makul_2;
ALTER TABLE dosen DROP COLUMN makul_3;
ALTER TABLE dosen CHANGE makul_1 makul varchar(35);
INSERT INTO dosen VALUES (1078523,"Riyanti Anjani","Struktur Data"),
(1078523,"Riyanti Anjani","Orkom"),
(1075047,"Susan Savitri","Web"),
(1078523,"Riyanti Anjani","Struktur Data");
SELECT * FROM dosen;

#5
RENAME TABLE mahasiswa TO ambil_mk;

create table mahasiswa (
nim int primary key,
nama varchar(50),
sem int
);
insert into mahasiswa values (201001,"Andika Saputra",1),
(201002,"Biyanti Anggie",3),
(201003,"Naura Putri",5);
select * from mahasiswa;
alter table ambil_mk drop column nama;
alter table ambil_mk drop column sem;
select * from ambil_mk;
#6
select * from dosen;
alter table dosen drop column makul;
delete from dosen where nidn = 1078523 limit 3;
delete from dosen where nidn = 1075047 limit 1;
alter table dosen change nidn nidn int primary key;
select * from dosen;
select * from ambil_mk;
alter table ambil_mk drop column nama_dosen;
select * from ambil_mk;