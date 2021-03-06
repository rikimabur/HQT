USE [QuanLyBenXe]
GO
/****** Object:  UserDefinedTableType [dbo].[NguoiDung_List]    Script Date: 9/12/2018 10:17:01 PM ******/
CREATE TYPE [dbo].[NguoiDung_List] AS TABLE(
	[MaND] [int] NULL,
	[TenND] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[CMND] [varchar](9) NULL,
	[DienThoai] [varchar](20) NULL,
	[TenDangNhap] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[IdLoaiND] [int] NULL,
	[TrangThai] [bit] NULL
)
GO
/****** Object:  Table [dbo].[ChoNgoi]    Script Date: 9/12/2018 10:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChoNgoi](
	[IdChoNgoi] [int] IDENTITY(1,1) NOT NULL,
	[MaXe] [int] NULL,
	[TenChoNgoi] [nvarchar](10) NOT NULL,
	[Gia] [money] NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdChoNgoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuyenXe]    Script Date: 9/12/2018 10:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChuyenXe](
	[IdChuyen] [int] NOT NULL,
	[NgayDi] [datetime] NOT NULL,
	[NgayDen] [datetime] NOT NULL,
	[GioXuatPhat] [varchar](10) NULL,
	[MaXe] [int] NULL,
	[IdTuyen] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdChuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HinhThucThanhToan]    Script Date: 9/12/2018 10:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhThucThanhToan](
	[MaPTTT] [int] IDENTITY(1,1) NOT NULL,
	[TenPhuongThucThanhToan] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPTTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiNguoiDung]    Script Date: 9/12/2018 10:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNguoiDung](
	[IdLoaiND] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiND] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLoaiND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 9/12/2018 10:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaND] [int] IDENTITY(1,1) NOT NULL,
	[TenND] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[CMND] [varchar](9) NULL,
	[DienThoai] [varchar](20) NULL,
	[TenDangNhap] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[IdLoaiND] [int] NOT NULL,
	[TrangThai] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nguoidung_Quyen]    Script Date: 9/12/2018 10:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nguoidung_Quyen](
	[idLoaiND] [int] NULL,
	[idQuyen] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 9/12/2018 10:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaQuyen] [int] NOT NULL,
	[MaND] [int] NULL,
	[Xe] [bit] NULL,
	[TuyenXe] [bit] NULL,
	[ChuyenXe] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TuyenXe]    Script Date: 9/12/2018 10:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuyenXe](
	[IdTuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenTuyen] [nvarchar](30) NULL,
	[DiaDiemDi] [nvarchar](30) NULL,
	[DiaDiemDen] [nvarchar](30) NULL,
	[TrangThai] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[IdTuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VE]    Script Date: 9/12/2018 10:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE](
	[MaVe] [int] IDENTITY(1,1) NOT NULL,
	[GiaVeThuc] [int] NULL,
	[TrangThaiVe] [bit] NULL,
	[TrangThaiThanhToan] [bit] NULL,
	[MaND] [int] NULL,
	[NgayTao] [datetime] NULL,
	[IdChoNgoi] [int] NULL,
	[MaPTTT] [int] NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MaTuyenXe] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[XE]    Script Date: 9/12/2018 10:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XE](
	[MaXe] [int] IDENTITY(1,1) NOT NULL,
	[BienSoXe] [nvarchar](50) NOT NULL,
	[LoaiXe] [nvarchar](50) NOT NULL,
	[SoLuongGhe] [int] NULL,
	[TrangThai] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[MaXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [UQ__HinhThuc__344EF6D1E241AFFE]    Script Date: 9/12/2018 10:17:01 PM ******/
ALTER TABLE [dbo].[HinhThucThanhToan] ADD UNIQUE NONCLUSTERED 
(
	[TenPhuongThucThanhToan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__NguoiDun__55F68FC07B94E9C5]    Script Date: 9/12/2018 10:17:01 PM ******/
ALTER TABLE [dbo].[NguoiDung] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__NguoiDun__F67C8D0B648E5828]    Script Date: 9/12/2018 10:17:01 PM ******/
ALTER TABLE [dbo].[NguoiDung] ADD UNIQUE NONCLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TuyenXe__1BFA8625B692288A]    Script Date: 9/12/2018 10:17:01 PM ******/
ALTER TABLE [dbo].[TuyenXe] ADD UNIQUE NONCLUSTERED 
(
	[TenTuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__XE__A780599219B0DD2C]    Script Date: 9/12/2018 10:17:01 PM ******/
ALTER TABLE [dbo].[XE] ADD UNIQUE NONCLUSTERED 
(
	[BienSoXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChoNgoi] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  DEFAULT ((0)) FOR [Xe]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  DEFAULT ((0)) FOR [TuyenXe]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  DEFAULT ((0)) FOR [ChuyenXe]
GO
ALTER TABLE [dbo].[ChoNgoi]  WITH CHECK ADD  CONSTRAINT [FK_ChoNgoi_XE] FOREIGN KEY([MaXe])
REFERENCES [dbo].[XE] ([MaXe])
GO
ALTER TABLE [dbo].[ChoNgoi] CHECK CONSTRAINT [FK_ChoNgoi_XE]
GO
ALTER TABLE [dbo].[ChuyenXe]  WITH CHECK ADD  CONSTRAINT [FK_ChuyenXe_TuyenXe] FOREIGN KEY([IdTuyen])
REFERENCES [dbo].[TuyenXe] ([IdTuyen])
GO
ALTER TABLE [dbo].[ChuyenXe] CHECK CONSTRAINT [FK_ChuyenXe_TuyenXe]
GO
ALTER TABLE [dbo].[ChuyenXe]  WITH CHECK ADD  CONSTRAINT [FK_ChuyenXe_XE] FOREIGN KEY([MaXe])
REFERENCES [dbo].[XE] ([MaXe])
GO
ALTER TABLE [dbo].[ChuyenXe] CHECK CONSTRAINT [FK_ChuyenXe_XE]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_LoaiNguoiDung] FOREIGN KEY([IdLoaiND])
REFERENCES [dbo].[LoaiNguoiDung] ([IdLoaiND])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_LoaiNguoiDung]
GO
ALTER TABLE [dbo].[Nguoidung_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_Nguoidung_Quyen_LoaiNguoiDung] FOREIGN KEY([idLoaiND])
REFERENCES [dbo].[LoaiNguoiDung] ([IdLoaiND])
GO
ALTER TABLE [dbo].[Nguoidung_Quyen] CHECK CONSTRAINT [FK_Nguoidung_Quyen_LoaiNguoiDung]
GO
ALTER TABLE [dbo].[Nguoidung_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_Nguoidung_Quyen_PhanQuyen] FOREIGN KEY([idQuyen])
REFERENCES [dbo].[PhanQuyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[Nguoidung_Quyen] CHECK CONSTRAINT [FK_Nguoidung_Quyen_PhanQuyen]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK_VE_ChoNgoi] FOREIGN KEY([IdChoNgoi])
REFERENCES [dbo].[ChoNgoi] ([IdChoNgoi])
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK_VE_ChoNgoi]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK_VE_HinhThucThanhToan] FOREIGN KEY([MaPTTT])
REFERENCES [dbo].[HinhThucThanhToan] ([MaPTTT])
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK_VE_HinhThucThanhToan]
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD  CONSTRAINT [FK_VE_NguoiDung] FOREIGN KEY([MaND])
REFERENCES [dbo].[NguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[VE] CHECK CONSTRAINT [FK_VE_NguoiDung]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD CHECK  ((len([CMND])=(9) AND isnumeric([CMND])=(1)))
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD CHECK  ((len([DienThoai])<=(12) AND len([DienThoai])>=(10)))
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD CHECK  (([GioiTinh]=N'Nữ' OR [GioiTinh]=N'Nam'))
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD CHECK  (([GiaVeThuc]>=(0)))
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD CHECK  (([TrangThaiThanhToan]=(0) OR [TrangThaiThanhToan]=(1)))
GO
ALTER TABLE [dbo].[VE]  WITH CHECK ADD CHECK  (([TrangThaiVe]=(0) OR [TrangThaiVe]=(1)))
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD CHECK  (([SoLuongGhe]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[Update_ListUser]    Script Date: 9/12/2018 10:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Update_ListUser]
@tableList  NguoiDung_List readonly
as
begin
 SET NOCOUNT ON
 update ND set DienThoai = NDL.DienThoai  from NguoiDung ND inner join NguoiDung_List NDL ON NDL.MaND = ND.MaND
end
GO
