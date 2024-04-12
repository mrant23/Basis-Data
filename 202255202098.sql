create database db_akademik_202255202098;

use  db_akademik_202255202098;

create table kelas (
id_kelas int primary key,
nm_kelas varchar(20)
);

create table mahasiswa(
nim bigint primary key,
nm_mhs varchar(50),
id_kelas int,
angkatan int,
gender varchar (9),
constraint id_kelas_fk foreign key (id_kelas) references kelas(id_kelas) on delete restrict on update cascade);

create table mata_kuliah(
kd_matkul varchar(10) primary key,
nm_matkul varchar (20),
sks int,
semester int
);

create table belanja_matkul(
nim bigint,
kd_matkul varchar(10),
nilai decimal (5,2),

primary key(nim,kd_matkul),
constraint nim_fk foreign key(nim)
references mahasiswa(nim) on delete restrict on update cascade,
constraint kd_matkul_fk foreign key (kd_matkul) references mata_kuliah(kd_matkul) on delete restrict on update cascade
);

create table ruangan (
id_ruangan int primary key,
nm_ruangan varchar(6)
);

create table waktu(
id_waktu int primary key,
jam_mulai time,
jam_selesai time
);

create table dosen(
nidn int zerofill primary key,
nm_dosen varchar (50),
telp bigint (12) zerofill
);

create table jadwal(
id_jadwal int primary key,
id_kelas int,
id_waktu int,
kd_matkul varchar (10),
nidn int zerofill,
id_ruangan int,
hari varchar(6),
constraint Id_kelas_fk1 foreign key (id_kelas) references kelas (id_kelas) on delete restrict on update cascade,
constraint Id_waktu_fk1 foreign key (id_waktu) references waktu (id_waktu) on delete restrict on update cascade,
constraint kd_matkul_fk1 foreign key (kd_matkul) references mata_kuliah (kd_matkul) on delete restrict on update cascade,
constraint nidn foreign key (nidn) references dosen (nidn) on delete restrict on update cascade,
constraint Id_ruangan_fk1 foreign key (id_ruangan) references ruangan (id_ruangan) on delete restrict on update cascade
);

#insert data kedalam tabel

insert into kelas values (1,"A1"),(2,"B1"),(3,"C1");
select * from kelas;

insert into ruangan values (1,"U-3.01"),(2,"U-3.02"),(3,"U-3.03");
select * from ruangan;

insert into waktu
values (1, "07:00:00", "09:40:00"),
(2, "09:40:00", "12:10:00"),
(3, "13:00:00", "15:30:00"),
(4, "15:40:00", "18:10:00");
#menampilkan semua data dari tebel waktu
select * from waktu;

#memasukan data kedalam tabel dosen
insert into dosen values (0031056905,"Dr. Ir. Hj. Harlinda L., MM., M.Kom., MTA.", 081111111111),
(0428077401,"Dr. Ir. Dolly Indra, S.Kom., M.MSi., MTA.",082222222222),
(0901019302,"Dewi Widyawati, S.Kom., M.Kom", 083333333333);

-- Menampilkan semua data tabel dosen
select * from dosen ;

insert into mata_kuliah values ("1303KKA713","Pemrograman Mobile",3,5),
("1303PPA105","Algoritma dan Pemroframan 1",3,1),
("1303KKB309","Basis Data II",3,3);

-- Update panjang kolom nm_matkul
alter table mata_kuliah modify column nm_matkul varchar(35);

select * from mata_kuliah;

-- Insert data ke dalam tabel mahasiswa
insert into mahasiswa values (13020190096,"A. ANUGRAH AQSA",3,2019,"Laki-Laki"),
(13020220009,"ANDIKA PRATAMA",1,2022,"Laki-Laki"),
(13020220014,"RAIHAN APRIANSYAH",1,2022,"Laki-Laki"),
(13020210009,"RISMA",2,2021,"Perempuan"),
(13020210011,"NURHALISA",2,2021,"Perempuan");

-- Insert data ke dalam tabel jadwal
insert into jadwal values (1,3,4,"1303KKA713",0428077402,3,"Senin"),
(2,1,1,"1303PPA105",0031056905,1,"Senin"),
(3,2,2,"1303KKB309",0901019302,1,"Selasa");

insert into dosen values(0428077402,"M.Fadli Hasa,M.Kom.",081444444444);

select * from jadwal;

-- Insert data ke dalam tabel belanja_matkul
insert into belanja_matkul values (13020190096,"1303KKA713",87.50),
(13020220009,"1303PPA105",66.00),
(13020220014,"1303PPA105",91.20),
(13020210009,"1303KKB309",89.80),
(13020210011,"1303KKB309",92.50);

select * from belanja_matkul;