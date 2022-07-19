Create database CTTracNghiem
Use CTTracNghiem

--Bảng GiaoVienn
Create Table tbGiaoVien
(

IDGv nchar(6) not null Constraint PK_tbGiaoVien Primary Key,

TenGv nvarchar(30) not null,
NgaySinh_Gv date not null,
GioiTinh nvarchar(15) not null,
CMND_CCCD nvarchar(15) not null,
Email_Gv nvarchar(50) not null,
Diachi_Gv nvarchar(50) ,
SDT_Gv nvarchar(12) not null
)

--Bảng HocVien
create table tbHocVien
(
IDHv nchar(6) not null constraint PK_tbHocVien primary key,

TenHv nvarchar(30) not null ,
NgaySinh_Hv date not null,
GioiTinh nvarchar(15) not null,
Email_Hv nvarchar(50) not null,
DiaChi_Hv nvarchar(50),
SDT_Hv nvarchar(12)
)
--Bảng MonHoc
Create Table tbMonHoc
(
IDMon nchar(4) not null Constraint PK_tbMonHoc Primary Key,
TenMon nvarchar(50) not null,
ghichu nvarchar(100)
)


--Bảng Lop
create table tbLopHoc
(
IDLop nchar(6) not null Constraint PK_tbLopHoc Primary Key,
TenLop nvarchar(50) not null,
ghichu nvarchar(50) 

)
create table ThongTinLopHoc
(
IDLop nchar(6) not null constraint FK_IDLop_tbThongTinLopHoc references tbLopHoc(IDLop),
IDGv nchar(6)  not null constraint FK_IDGv_tbThongTinLopHoc references tbGiaoVien(IDGv),
IDHv nchar(6)  not null constraint FK_IDHv_tbThongTinLopHoc  references tbHocVien(IDHv),
IDMon nchar(4) not null constraint FK_IDMon_tbThongTinLopHoc references tbMonHoc(IDMon),
NgayBatDau date not null,
NgayKetThuc date not null

)
--Bảng DeThi
Create Table tbDeThi
(
IDDe nchar(4) not null Constraint PK_tbDeThi Primary Key,

TenDe nvarchar(30),
IDMon nchar(4) not null constraint FK_IDMon_tbDeThi references tbMonHoc(IDMon),
--IDLop nchar(6) not null constraint FK_IDLop_tbDeThi references tbLopHoc(IDLop),
--Time time(7),
--DS_IDCauHoi nchar(1000) not null,
--TongDiem decimal(10,0),
--DS_RanDom nchar(1000),

)
--bảng nganhang
create table tbNganHang
(
IDCauHoi int not null Constraint PK_tbNganHang Primary Key,
IDDe nchar(4)  Constraint FK_IDDe_tbNganHang references tbDeThi(IDDe),
IDMon nchar(4) not null constraint FK_IDMon_tbNganHang references tbMonHoc(IDMon),

CauHoi nvarchar(300) not null,
DA1 nvarchar(300) not null,
DA2 nvarchar(300) not null,
DA3 nvarchar(300) not null,
DA4 nvarchar(300) not null,                                                                                                                
DapAn nvarchar(300) not null
)
select tbNganHang.*
from tbDeThi join tbNganHang on tbDeThi.IDDe=tbNganHang.IDDe
where tbDeThi.IDDe='W01'

--bangketqua
create table tbKetQua
(
IDDe nchar(4)  null Constraint FK_IDDe_tbResult references tbDeThi(IDDe),
TenDe nvarchar(30),
IDHv nchar(6)  not null constraint FK_IDHv_tbResult  references tbHocVien(IDHv),
Diem int,
ngaykiemtra date
)

insert into tbKetQua 
values
('Y01',N'Bài kiểm tra Python 01','Hv1202',8,'2021-06-06')


create table taikhoan
(
ID nchar(6)  not null constraint PK_Admin Primary Key,
matkhau nvarchar(50)  not null,
vaitro nvarchar(50)
)
Create proc sp_de1 @ma nchar(4)
as
	select IDCauHoi,IDDe,CauHoi,DA1,DA2,DA3,DA4,DapAn
	from tbNganHang 
	where tbNganHang.IDDe=@ma 

exec sp_de1'Y01'

--Nhập liệu--
select IDCauHoi,IDDe,CauHoi,DA1,DA2,DA3,DA4,DapAn
	from tbNganHang 
	where tbNganHang.IDDe='Y01'
select tbNganHang.*,tbDeThi.*
from tbDeThi join tbNganHang on tbDeThi.IDDe=tbNganHang.IDDe
where tbDeThi.TenDe='Bài kiểm tra Python 01'
select IDDe
from tbDeThi

insert into tbGiaoVien
values
('Gv1101', N'Lê Chí Kiên', '1998-08-04','Nam', '272874334', 'lechikienteky@gmail.com',N'564/1/3F Nguyễn Xí - Bình Thạnh - TP.HCM', '0913162000'),
('Gv1102',N'Phan Thanh Tâm', '1996-12-05', N'Nữ','249086421','phanthanhtamtekyt@gmail.com',N'123A Nguyễn Kiệm - q. Gò Vấp - TP.HCM','0978654841'),
('Gv1103',N'Mai Thị Lựu', '1990-12-08', N'Nữ','247097663','maithiluuteky@gmail.com', N'256/96/4 Phan Đăng Lưu - Bình Thạnh - HCM', '0918183144'),
('Gv1104', N'Đào Thị Hồng', '1991-06-22', N'Nữ', '342332189','daothihongteky@gmail.com',N'764/94 Phạm Văn Chiêu - p.13 - GV - HCM', '0975432222'),
('Gv1105', N'Phan Thành Nhân','1998-05-04', 'Nam','2913162007','phanthanhnhateky@gmail.com', N'152 Nguyễn Trọng Tuyển - Tân Bình - HCM', '0913532332'),
('Gv1106', N'Phan Ánh Dương', '1998-09-28', N'Nữ','2836223117','phananhduongteky@gmail.com', N'65 Nam Kỳ Khởi Nghĩa -q.3 - TP.HCM',  '0982127678'),
('Gv1107', N'Phan Ánh Nguyệt', '1989-06-17', N'Nữ','343532118','phananhnguyetekyt@gmail.com', N'32/65/9 Trần Cao Vân - Phú Nhuận - HCM',  '0982342356'),
('Gv1108',N'Nguyễn Trọng Hiền','1999-09-09','Nam','452312354','nguyentronghienteky@gmail.com',N'Phường Linh Trung,Thủ Đức','0915007523'),
('Gv1109',N'Trần Thành Giang','1990-09-24','Nam','272894245','tranthanhgiangteky@gmail.com',N'phường 5, Biên Hòa, Đồng Nai','0915007593'),
('Gv1110', N'Trần Hương Giang', '1997-04-14', N'Nữ','345623321','tranhuonggiangteky@gmail.com',N'Huyện Thống Nhất, Đồng Nai', '0211658448')

insert into tbHocVien
values
('Hv1201',N'Nguyễn QuốcTrường','2010-09-09', 'Nam','nguyenquoctruongteky@gmail.com', N'Trần Xuân Soạn-q7 - TP.HCM','0913198900'),
('Hv1202', N'Phạm Uyên Thanh', '2010-01-01', N'Nữ','phamuyenthanhlteky@gmail.com', N'294 Ung Văn Khiêm - q. Bình Thạnh - TP.HCM',null),
('Hv1203',N'Trần Thái Văn Khoa',  '2008-03-02','Nam','tranthaivankhoateky@gmail.com', N'230/60/24 Xô Viết Nghệ Tĩnh - Bình Thạnh - TP.HCM',  '0945876920'),
('Hv1204',N'Ngô Thành Văn',  '2009-09-06','Nam','ngothanhvanteky@gmail.com',N'474 Trường Chinh, P. Tây Thạnh, Q. Tân Phú, Tp HCM','0838654933'),
('Hv1205',N'Lê Huỳnh Đông Khang', '2008-12-12','Nam','lehuynhdongkhangteky@gmail.com',N'47 Phạm Văn Hai - Q. Tân Bình - TP Hồ Chí Minh', '0116513578'),
('Hv1206',N'Phạm Hoàng Đăng',  '2009-11-10','Nam','phamhoangdangteky@gmail.com', N'21 - Tân Trào - P. Tân Phú - Q7 - TP.HCM', null),
('Hv1207',N'Đỗ Ngọc Trang','2010-10-12',N'Nữ','dongoctrangteky@gmail.com',N'01 - p. Tân Định - Q.1-TP.HCM','0217654444'),
('Hv1208',N'Mai Hoàng Nhung','2008-09-07',N'Nữ','maihoangnhungteky@gmail.com',N'Linh Trung- q Thủ Đức - TP Hồ Chí Minh','0211232334'),
('Hv1209', N'Đoàn Khánh Huy ','2009-10-11','Nam','doankhanhhuyteky@gmail.com',N'13 Trần Xuân Soạn - Q.7 - TP.HCM', '0287667856'),
('Hv1210', N'Nguyễn Quang Duy','2010-10-12','Nam','nguyenquanghuyteky@gmail.com',N'16 Linh Xuân - quận Thủ Đức-TP HCM', '0918712870'),
('Hv1211',N'Phạm Thị Mai Hoa','2009-11-11',N'Nữ','phamthimaihoateky@gmail.com',N'72 Lê Văn Sỹ -Q.3 -TP.HCM','0978654987'),
('Hv1212',N'Nguyễn Minh Vương','2009-10-10','Nam','nguyenminhvuongteky@gmail.com',N'34 Lê Minh Xuân-Q.Tân Bình -TP.HCM',null),
('Hv1213',N'Phan Đăng Lưu','2009-04-04','Nam','phandangluuteky@gmail.com','07 Đường D2- Q.Bình Thạnh-TP.HCM', null),
('Hv1214',N'Nguyễn Ngọc Nhã Hân','2008-06-06',N'Nữ','nguyenngocnhahanteky@gmail.com',N'42 Trần Xuân Soạn - Q.7- TP.HCM','0967321547'),
('Hv1215',N'Phạm Bích Chi','2010-04-01',N'Nữ','phambichchiteky@gmail.com',N'12 Dĩ An- Bình Dương- TP.Thủ Đức','0945123321'),
('Hv1216',N'Trần Minh Thiên','2010-02-05','Nam','tranminhthienteky@gmail.com',N'22 Lê Văn Sỹ- Q.Tân Bình -TP.HCM','0967867853'),
('Hv1217',N'Nguyễn Công Vinh','2010-09-01','Nam','nguyencongvinhteky@gmail.com',N'Bến Ghé - Q.1 -TP.HCM','0923761231'),
('Hv1218',N'Ông Yên Nhi','2010-10-01',N'Nữ','ongyennhiteky@gmailcom',N'Linh Xuân- Q.Thủ Đức -TP.HCM', null),
('Hv1219',N'Ông Cao Thắng','2010-10-11','Nam','ongcaothangteky@gmail.com',N'340 Đường 3/2 -Q.10 -TP.HCM','0978654123'),
('Hv1220',N'Nguyễn Yến Nhi','2009-09-10',N'Nữ','nguyenyennhiteky@gmail.com',N'45 Hòa Hảo - Q.10 -TP.HCM',null)


insert into tbMonHoc
values
('LTW',N' Siêu Nhân Lập Trình Web',null),
('PTS',N'PhotoShop','Coaching'),
('LTPY',N'Siêu Nhân Lập Trình Python',null)
--Bảng lophoc
insert into tbLopHoc
values
('LTW001',N'Siêu Nhân Lập Trình Web 001',N'Cấp 1'),
('LTW002',N'Siêu Nhân Lập Trình Web 002',N'Cấp 2'),
('LTW003',N'Siêu Nhân Lập Trình Web 003',N'Cấp 3'),
('LTPY01',N'Siêu Nhân Lập Trình Python 01',N'Cấp 1'),
('LTPY02',N'Siêu Nhân Lập Trình Python 02',N'Cấp 2'),
('LTPY03',N'Siêu Nhân Lập Trình Python 03',N'Cấp 3'),
('PTS001',N'PhotoShop 001',N'Cấp 1'),
('PTS002',N'PhotoShop 002',N'Cấp 2'),
('PTS003',N'PhotoShop 003',N'Cấp 3'),
('PTS_EX','PhotoShop ',N'Lớp học trải nghiệm')

insert into ThongTinLopHoc
values
('PTS001','Gv1101','Hv1202','PTS','2020-06-04','2023-06-04'),
('PTS001','Gv1101','Hv1201','PTS','2020-06-04','2023-06-04'),
('PTS001','Gv1101','Hv1203','PTS','2020-06-04','2023-06-04')


insert into ThongTinLopHoc
values
('PTS002','Gv1103','Hv1214','PTS','2020-06-08','2023-06-08'),
('PTS002','Gv1103','Hv1207','PTS','2020-06-08','2023-06-08'),
('PTS002','Gv1103','Hv1208','PTS','2020-06-08','2023-06-08'),
('PTS002','Gv1103','Hv1204','PTS','2020-06-08','2023-06-08'),
('PTS002','Gv1103','Hv1206','PTS','2020-06-08','2023-06-08')

insert into ThongTinLopHoc
values
('PTS003','Gv1104','Hv1209','PTS','2019-10-06','2022-10-06'),
('PTS003','Gv1104','Hv1210','PTS','2019-10-06','2022-10-06'),
('PTS003','Gv1104','Hv1204','PTS','2019-10-06','2022-10-06')

insert into ThongTinLopHoc
values
('LTW001','Gv1102','Hv1204','LTW','2019-04-04','2022-04-04'),
('LTW001','Gv1102','Hv1205','LTW','2019-04-04','2022-04-04'),
('LTW001','Gv1102','Hv1206','LTW','2019-04-04','2022-04-04')

insert into ThongTinLopHoc
values
('LTW002','Gv1105','Hv1211','LTW','2019-12-12','2022-12-12'),
('LTW002','Gv1105','Hv1212','LTW','2019-12-12','2022-12-12'),
('LTW002','Gv1105','Hv1213','LTW','2019-12-12','2022-12-12')

insert into ThongTinLopHoc
values 
('LTW003','Gv1106','Hv1214','LTW','2019-12-05','2022-12-05'),
('LTW003','Gv1106','Hv1215','LTW','2019-12-05','2022-12-05')

insert into ThongTinLopHoc
values
('LTPY01','Gv1107','Hv1216','LTPY','2019-09-12','2022-09-12'),
('LTPY01','Gv1107','Hv1217','LTPY','2019-09-12','2022-09-12'),
('LTPY01','Gv1107','Hv1201','LTPY','2019-09-12','2022-09-12'),
('LTPY01','Gv1107','Hv1218','LTPY','2019-09-12','2022-09-12'),
('LTPY01','Gv1107','Hv1219','LTPY','2019-09-12','2022-09-12')

insert into ThongTinLopHoc
values
('LTPY02','Gv1108','Hv1220','LTPY','2019-03-10','2022-03-10'),
('LTPY02','Gv1108','Hv1213','LTW','2019-03-10','2022-03-10'),
('LTPY02','Gv1108','Hv1205','LTPY','2019-03-10','2022-03-10'),
('LTPY02','Gv1108','Hv1209','LTPY','2019-03-10','2022-03-10'),
('LTPY02','Gv1108','Hv1208','LTPY','2019-03-10','2022-03-10')
insert into ThongTinLopHoc
values
('LTPY03','Gv1109','Hv1202','LTPY','2021-04-08','2024-04-08'),
('LTPY03','Gv1109','Hv1203','LTPY','2021-04-08','2024-04-08'),
('LTPY03','Gv1109','Hv1212','LTPY','2021-04-08','2024-04-08')

insert into ThongTinLopHoc
values
('PTS_EX','Gv1110','Hv1217','PTS','2021-03-03','2021-04-03'),
('PTS_EX','Gv1110','Hv1218','PTS','2021-03-03','2021-04-03'),
('PTS_EX','Gv1110','Hv1220','PTS','2021-03-03','2021-04-03')

insert into tbDeThi
values
('Y01',N'Bài kiểm tra Python 01','LTPY'),
('Y02',N'Bài kiểm tra Python 02','LTPY'),
('W01',N'Bài kiểm tra Web 01','LTW'),
('S01',N'Bài kiểm tra Photoshop','PTS')


insert into tbNganHang
values
('01','Y01','LTPY',N'Khẳng định nào sau đây về Python là đúng? ',N'Python là một ngôn ngữ lập trình cấp cao.',N'Python là một ngôn ngữ thông dịch.',N'Python là ngôn ngữ lập trình hướng đối tượng.',N'Tất cả các đáp án đều đúng.',N'Tất cả các đáp án đều đúng.'),

('02','Y01','LTPY',N'Kí hiệu nào dùng để xác định các khối lệnh (khối lệnh của hàm, vòng lặp,...) trong Python?',N'Dấu ngoặc nhọn { }',N'Dấu ngoặc vuông [ ]',N'Thụt lề',N'Dầu ngoặc đơn ( )',N'Thụt lề'),

('03','Y01','LTPY',N'Khẳng định nào là đúng về chú thích trong Python?',N'Chú thích giúp cho các lập trình viên hiểu rõ hơn về chương trình.',N'Trình thông dịch Python sẽ bỏ qua những chú thích.',N'Có thể viết chú thích trên cùng một dòng với lệnh/biểu thức hoặc viết trên nhiều dòng mà không vấn đề gì cả',N'Tất cả các đáp án trên',N'Tất cả các đáp án trên'),

('04','Y01','LTPY',N'Đâu là quy tắc đúng khi đặt tên cho biến trong Python?',N'Tên biến có thể bắt đầu bằng dấu gạch dưới " _ ".',N'Có thể sử dụng keyword làm tên biến.',N'Tên biến có thể có các ký hiệu như !, @, #, $, %,...',N'Không có câu trả lời đúng',N'Tên biến có thể bắt đầu bằng dấu gạch dưới " _ ".'),

('05','Y01','LTPY',N'n = 5, vậy n trong đoạn sau là kiểu dữ liệu nào?','integer','string','tuple','operator','integer'),

('06','Y01','LTPY',N'Lệnh nào dùng để lấy dữ liệu đầu vào từ người dùng?','cin','scanf()','input()','<>','input()'),

('07','Y01','LTPY',N'Câu lệnh sử dụng toán tử and trả về kết quả TRUE khi nào?',N'Cả hai toán hạng đều là TRUE.',N'Cả hai toán hàng đều là FALSE.',N'Một trong hai toán hạng là TRUE.',N'Toán hạng đầu tiên là TRUE.',N'Cả hai toán hạng đều là TRUE.'),

('08','Y01','LTPY',N'def printHello():
print("Hello")
a = printHello()
Khẳng định nào là đúng khi nói về đoạn code sau:',N'printHello() là một hàm và a là một biến. Cả hai đều không phải đối tượng.',N'Cả printHello() và a đều thể hiện chung một đối tượng.',N'printHello() và a là hai đối tượng khác nhau.',N'Lỗi cú pháp. Không thể gán hàm cho một biến trong Python.',N'Cả printHello() và a đều thể hiện chung một đối tượng.'),

('09','Y01','LTPY',N'Khẳng định nào sau đây là đúng?',N'Lớp (class) là một kế hoạch chi tiết cho đối tượng.',N'Chỉ có thể tạo một đối tượng duy nhất từ lớp đã cho.',N'Cả hai đáp án trên đều đúng.',N'Không có đáp án chính xác.',N'Lớp (class) là một kế hoạch chi tiết cho đối tượng.'),

('10','Y01','LTPY',N'Ý nghĩa của hàm __init__() trong Python là gì?',N'Khởi tạo một lớp để sử dụng.',N'Được gọi khi một đối tượng mới được khởi tạo.',N'Khởi tạo và đưa tất cả các thuộc tính dữ liệu về 0 khi được gọi.',N'Không có đáp án đúng.',N'Được gọi khi một đối tượng mới được khởi tạo.'),

('11','Y02','LTPY',N'Một lớp được thừa hưởng thuộc tính từ hai lớp khác nhau được gọi là gì?',N'Kế thừa đa cấp (Multilevel Inheritance)',N'Đa kế thừa (Multiple Inheritance)',N'Kế thừa phân cấp (Hierarchical Inheritance)',N'Kế thừa (Inheritance)',N'Đa kế thừa (Multiple Inheritance)'),

('12','Y02','LTPY',N'Khẳng định nào sau đây là đúng?',N'Trong Python, một toán tử có thể có hoạt động khác nhau tùy thuộc vào toán hạng được sử dụng.',N'Bạn có thể thay đổi cách các toán tử hoạt động trong Python.',N'__add () __ được gọi khi toán tử ' + ' được sử dụng.',N'Tất cả các đáp trên đều đúng.',N'Tất cả các đáp trên đều đúng.'),

('13','Y02','LTPY',N'Mở file với chế độ mode " a " có ý nghĩa gì?',N'Mở file ở chế độ chỉ được phép đọc.',N'Mở file ở chế độ ghi.',N'Mở file chế độ ghi tiếp vào cuối file.',N'Mở file để đọc và ghi.',N'Mở file chế độ ghi tiếp vào cuối file.'),


('14','Y02','LTPY',N'f = open("test.txt") Đoạn code dưới đây có ý nghĩa gì?',N'Mở file test.txt được phép đọc và ghi vào file.',N'Mở file test.txt và chỉ được phép đọc file.',N'Mở file test.txt và được phép ghi đè vào file',N'Mở file test.txt và được phép ghi tiếp vào file.',N'Mở file test.txt và chỉ được phép đọc file.'),

('15','Y02','LTPY',N'Khẳng định nào về ngoại lệ là đúng nhất?',N'Ngoại lệ (Exception) là lỗi phát sinh khi đang thực thi chương trình (runtime error).',N'Lỗi cú pháp (syntax error) cũng là một ngoại lệ.',N'Ngoại lệ được Python dùng để loại bỏ một khối code khỏi chương trình.',N'Tất cả các đáp án trên đều đúng.',N'Ngoại lệ (Exception) là lỗi phát sinh khi đang thực thi chương trình (runtime error).'),

('16','Y02','LTPY',N'Ngoại lệ nào xảy ra khi phát hiện thấy lỗi không thuộc bất kỳ danh mục nào khác?','ReferenceError','SystemError','RuntimeError','LookupError','RuntimeError'),

('17','Y02','LTPY',N'L = [1, 23, ‘hello’, 1] 
Đối tượng dưới đây thuộc kiểu dữ liệu nào?','List','Dictionary','Tuple','Array','List'),

('18','Y02','LTPY',N'list = [ "Tech", 404, 3.03, "Beamers", 33.3 ]
print list[1:3]
Kết quả nào là output của đoạn code dưới đây?','[ "Tech", 404, 3.03, "Beamers", 33.3 ]','[404, 3.03]','["Tech", "Beamers"]','None of the above','[404, 3.03]'),

('19','Y02','LTPY',N'Đâu không phải là kiểu dữ liệu tiêu chuẩn trong Python?','List','Dictionary','Class','Tuple','Class'),

('20','Y02','LTPY',N'Đâu là điểm khác biệt giữa tuple và list?',N'Tuple nằm trong dấu ngoặc nhọn, list nằm trong dầu ngoặc vuông.',N'Tuple nằm trong dấu ngoặc vuông, list nằm trong dầu ngoặc nhọn.',N'Tuple là danh sách với dữ liệu kiểu la mã, list là danh sách với kiểu dữ liệu thường.',N'Dữ liệu thuộc kiểu list có thể thay đổi được, dữ liệu thuộc kiểu tuple không thể thay đổi được.',N'Dữ liệu thuộc kiểu list có thể thay đổi được, dữ liệu thuộc kiểu tuple không thể thay đổi được.')

insert into tbNganHang
values
('21','W01','LTW',N'JavaScrip là ngôn ngữ xử lý ở :','Client','Server','Server/client',N'Không có dạng nào','Client'),

('22','W01','LTW',N'Phương thức viết chương trình của JavaScrip như thế nào?',N'Viết riêng một trang',N'Viết chung với HTML',N'Cả 2 dạng A và B',N'Không có dạng nào',N'Cả 2 dạng A và B'),

('23','W01','LTW',N'JavaScrip có dạng biến?',N'Number,String,Boolean',N'Number,Integer, char',N'Number,String,Boolean,Null',N'Tất cả các loại trên',N'Number,String,Boolean'),

('24','W01','LTW',N'Trong javaScrip hàm ParseInt() dùng để làm gì?',N'Chuyển một chuỗi thành số',N'Chuyển một chuỗi thành số nguyên',N'Chuyển một chuỗi thành số thực',N'Chuyển một số nguyên thành một chuỗi',N'Chuyển một chuỗi thành số nguyên'),

('25','W01','LTW',N'Trong javaScrip hàm ParseFloat() dùng để làm gì?',N'Chuyển một chuỗi thành số',N'Chuyển một chuỗi thành số nguyên',N'Chuyển một chuỗi thành số thực',N'Chuyển một số nguyên thành một chuỗi',N'Chuyển một chuỗi thành số thực'),

('26','W01','LTW',N'Lệnh Prompt trong JavaScrip để làm gì?',N'Hiện một thông báo nhập thông tin',N'Hiện một thông báo dạng yes,no',N'Cả hai dạng trên',N'Không có lệnh nào đúng',N'Hiện một thông báo nhập thông tin'),

('27','W01','LTW',N'Trong JavaScrip sự kiện Onload thực hiện khi:',N'Khi bắt đầu chương trình chạy',N'Khi Click chuột',N'Khi kết thúc một chương trình',N'Khi di chuyển chuột qua',N'Khi bắt đầu chương trình chạy'),

('28','W01','LTW',N'Thẻ<input="button"...> dùng để làm gì?',N'Tạo một ô text để nhập dữ liệu',N'Tạo một nút lệnh lên trên form',N'Tạo một vùng có nhiều cột nhiều dòng',N'Tất cả các ý trên',N'Tạo một nút lệnh lên trên form'),

('29','W01','LTW',N'Lệnh lặp for có dạng như thế nào?',N'For(biến= giá trị đầu,điều kiện, giá trị tăng)',N'For(biến= giá trị đầu,giá trị tăng, điều kiện)',N'For(biến=điều kiện,giá trị tăng, giá trị cuối)',N'Tất cả các dạng trên',N'For(biến= giá trị đầu,điều kiện, giá trị tăng)'),

('30','W01','LTW',N'Lệnh break kết hợp với vòng lặp for dùng để? ',N'Ngưng vòng lặp for nếu gặp lệnh này',N'Không có ý nghĩa gì trong vòng lặp',N'Nhảy đến một tập lệnh khác',N'Không thể kết hợp được',N'Ngưng vòng lặp for nếu gặp lệnh này'),

('31','W01','LTW',N'Làm cách nào để gọi một hàm myFuction trong JavaScrip? ','Call function myFunction()','Call myFunction()','myFunction()',N'Tất cả đáp án đều đúng','myFunction()'),

('32','W01','LTW',N'Cách nào để thêm một comment nhiều dòng tròn javaScrip?','/*Conmment*/','//Conmment//','<!--Comment-->',N'Cả A,B,C đều đúng','/*Conmment*/'),

('33','W01','LTW',N'Cách viết câu lệnh IF nào sau đây là đúng?','If i=5 then','If(i==5)','If i==5 then','If i=5','If(i==5)'),

('34','W01','LTW',N'Cách nào để làm tròn 7.25 tới số nguyên gần nhất trong javaScrip?','rnd(7.25)','round(7.25)','Math.round(7.25)','Math.rnd(7.25)','Math.round(7.25)'),

('35','W01','LTW',N'Cách khai báo mảng nào là trong javaScrip là đúng?','var color=1=("red",2=("green"),3=("blue")','var color=["red","green","blue"]','var color=(1:"red",2:"green",3:"blue")','var color="red","green","blue"','var color=["red","green","blue"]')
insert into tbNganHang
values
('36','S01','PTS',N'Khi tạo file mới, màu của file mới tạo là màu:',N'Trắng (white)',N'Trong suốt',N'Tuỳ chọn trong hộp thoại',N'Màu đen',N'Tuỳ chọn trong hộp thoại'),

('37','S01','PTS',N'Định dạng file chuẩn của Photoshop là',N'JPG',N'PST',N'PSD',N'Tất cả các định dạng file ảnh','PSD'),

('39','S01','PTS',N'Để bật/tắt tools box ta chọn lệnh',N'Window\ tool box',N'Window\ tools',N'Window\ Navigator',N'Cả A và B đều đúng','Window\ tools'),

('40','S01','PTS',N'Để cuộn xem hình ảnh mà kích thước hình ảnh lớn hơn cửa sổ hiển thị nó:',N'Dùng công cụ Hand (phím tắt H)',N'Đè thanh Space bar trên bàn phím',N'Đáp án A và B đều đúng',N'Đáp án A và B đều sai',N'Đáp án A và B đều đúng'),

('41','S01','PTS',N'Quay lại một số bước trước đó đã thực hiện sử dụng:',N'Ctrl + Z',N'Ctrl+Alt + Z',N'Cả A và B đều sai',N'Cả A và B đều đúng','Ctrl+Alt + Z'),

('42','S01','PTS',N'Phát biểu nào dưới đây không đúng?',N'Rotate 90° CW: Xoay 90° cùng chiều kim đồng hồ',N'Rotate 90° CCW: Xoay 90° ngược chiều kim đồng hồ',N'Flip Horizontal: Lật đối tượng theo chiều ngang đối xứng',N'Flip Vertical: Lật đối tượng theo chiều ngang đối xứng',N'Flip Vertical: Lật đối tượng theo chiều ngang đối xứng'),

('43','S01','PTS',N'Phần mềm Photoshop có thể:',N'Cắt ghép hình ảnh',N'Phục chế ảnh',N'Thiết kế giao diện Web',N'Tất cả các đáp án trên',N'Tất cả các đáp án trên'),

('44','S01','PTS',N'Bộ công cụ Marquee có thể tạo vùng chọn theo:',N'Hình chữ nhật',N'Hình elip',N'Cả A và B đều đúng',N'Cả A và B đều sai',N'Cả A và B đều đúng'),

('45','S01','PTS',N'Công cụ Lasso Tool là:',N'Công cụ tạo vùng chọn tự do',N'Công cụ chọn vùng dựa theo màu sắc',N'Công cụ bám dính',N'Công cụ di chuyển',N'Công cụ tạo vùng chọn tự do'),

('46','S01','PTS',N'Công cụ Move Tool có tác dụng:',N'Sao chép ảnh',N'Để di chuyển đối tượng và gióng hàng các đối tượng trên các Layer',N'Tạo viền vùng chọn',N'Tô vẽ hình ảnh',N'Để di chuyển đối tượng và gióng hàng các đối tượng trên các Layer'),

('47','S01','PTS',N'Muốn tạo độ Feather sau khi tạo vùng chọn sử dụng:',N'Ctrl+D',N'Ctrl+Alt+D',N'Không tạo được',N'Cả A và B đều được','Ctrl+Alt+D'),

('48','S01','PTS',N'Muốn tạo vùng chọn theo màu sắc tương đổng sử dụng công cụ:',N'Polygonal Lasso tool',N'Magic Wand Tool',N'Magnetic Lasso Tool',N'Move Tool(phím tắt V)','Magic Wand Tool')



insert into taikhoan
values
('admin','admin',N'Đào tạo'),
('Gv1101','kienGv1101', N'Giáo viên'),
('Gv1102','tamGv1102',N'Giáo viên'),
('Gv1103', 'luuGv1103',N'Giáo viên'),
('Gv1104', 'hongGv1104',N'Giáo viên'),
('Gv1105', 'nhanGv1105',N'Giáo viên'),
('Gv1106','duongGv1106', N'Giáo viên'),
('Gv1107','nguyetGv1107', N'Giáo viên'),
('Gv1108','hienGv1108',N'Giáo viên'),
('Gv1109','giangGv1109',N'Giáo viên'),
('Gv1110','giangGv1110',N'Giáo viên'),

('Hv1201','truongHv1201',N'Học viên'),
('Hv1202','thanhHv1202', N'Học viên'),
('Hv1203','khoaHv1203',N'Học viên'),
('Hv1204','vanHv1204',N'Học viên'),
('Hv1205','khangHv1205',N'Học viên'),
('Hv1206','dangHv1206',N'Học viên'),
('Hv1207','trangHv1207',N'Học viên'),
('Hv1208','nhungHv1208',N'Học viên'),
('Hv1209', 'huyHv1209',N'Học viên'),
('Hv1210','duyHv1210', N'Học viên'),
('Hv1211','hoaHv1211',N'Học viên'),
('Hv1212','vuongHv1212',N'Học viên'),
('Hv1213','luuHv1213',N'Học viên'),
('Hv1214','hanHv1214',N'Học viên'),
('Hv1215','chiHv1215',N'Học viên'),
('Hv1216','thienHv1216',N'Học viên'),
('Hv1217','vinhHv1217',N'Học viên'),
('Hv1218','nhiHv1218',N'Học viên'),
('Hv1219', 'thangHv1219',N'Học viên'),
('Hv1220','nhiHv1220',N'Học viên')
