create database Cafe
go

use QuanLyQuanCafe
go


create table NhanVien
(
	id int primary key,
	ten nvarchar(100) not null default N'Chưa nhập tên',
	taikhoan nvarchar(100) not null ,
	matkhau nvarchar(100) not null ,
	quyen int not null default 0
)
go
create table CaTruc
(
	id int primary key,
	ngaytruc datetime not null,
	buoitruc nvarchar(100) not null,
	id_nhanvien int not null,
	foreign key (id_nhanvien) references NhanVien(id)
)
go


create table DanhMuc
(
	id int primary key,
	ten nvarchar(100) not null default N'Chưa đặt tên',
	trangthai int default 0
)
go

create table ThucUong
(
	id int primary key,
	ten nvarchar(100) not null default N'Chưa đặt tên',
	gia int not null default 0,
	trangthai int default 1,
	id_danhmuc int not null

	foreign key (id_danhmuc) references DanhMuc(id)
)
go

create table KhuVuc
(
	id int primary key,
	ten nvarchar(100) not null,
	trangthai nvarchar(100) default N'Đang sử dụng'
)
GO

create table Ban
(
	id int primary key,
	ten nvarchar(100) not null default N'Bàn trống',
	trangthai nvarchar(100) not null default N'Trống',
	id_khuvuc int not null

	foreign key (id_khuvuc) references KhuVuc(id)
)
GO

create table HoaDon
(
	id int primary key,
	ngaylap datetime not null default getdate(),
	trangthai int not null default 0,
	tongtien int not null,
	id_ban int not null,
	id_nhanvien int not null

	foreign key (id_ban) references Ban(id),
	foreign key (id_nhanvien) references NhanVien(id)
)
go

create table CTHD
(
	soluong int not null default 0,
	thanhtien int not null, 
	id_hoadon int not null,
	id_thucuong int not null

	primary key(id_hoadon, id_thucuong),

	foreign key (id_hoadon) references HoaDon(id),
	foreign key (id_thucuong) references ThucUong(id)
)
go



insert into NhanVien(id, ten, taikhoan, matkhau, quyen) values ( '1',N'Nguyễn Văn A', 'admin', 'admin', '0');
insert into NhanVien(id, ten, taikhoan, matkhau, quyen) values ( '2', N'Nguyễn Văn b', 'hihi', '123456', '0');
insert into CaTruc(id, ngaytruc, buoitruc, id_nhanvien) values ('1', '1-1-2018', N'Sáng', '2');
insert into CaTruc(id, ngaytruc, buoitruc, id_nhanvien) values ('2', '1-1-2018', N'Tối', '1');
insert into DanhMuc(id, ten) values ('1', N'Giải Khát');
insert into DanhMuc(id, ten) values ('2', N'Sinh Tố');
insert into ThucUong(id, ten, gia, id_danhmuc) values ('1',N'Pepsi','20000', '1');
insert into ThucUong(id, ten, gia, id_danhmuc) values ('2',N'Sinh tố dâu','25000', '2');
insert into KhuVuc(id, ten, trangthai) values ('1', N'Tầng 1', N'Đầy đủ');
insert into KhuVuc(id, ten, trangthai) values ('2', N'Tầng 2', N'Đầy đủ');
insert into Ban(id, ten, trangthai, id_khuvuc) values ('1', 'Bàn 1', '0', '1');
insert into Ban(id, ten, trangthai, id_khuvuc) values ('2', 'Bàn 2', '0', '2');
insert into HoaDon(id, ngaylap, tongtien, trangthai, id_ban, id_nhanvien) values ('1', '1-1-2018', '20000', '0', '1', '1');
insert into HoaDon(id, ngaylap, tongtien, trangthai, id_ban, id_nhanvien) values ('2', '1-1-2018', '25000', '0', '2', '1');
insert into CTHD( soluong, thanhtien, id_hoadon, id_thucuong) values ('1', '20000', '1', '1');
insert into CTHD( soluong, thanhtien, id_hoadon, id_thucuong) values ('1', '25000', '2', '2');