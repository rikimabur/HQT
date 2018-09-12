--- Table Người dùng
-- Login 
-- Drop PROCEDURE HTVP_Login
CREATE PROC HTVP_Login @TenDangNhap varchar(50),
@MatKhau varchar(50)
AS
BEGIN TRY
  BEGIN TRAN
    --proccess
    IF (SELECT
        COUNT(1)
      FROM NguoiDung(nolock)
      WHERE TenDangNhap = @TenDangNhap
      AND MatKhau = @MatKhau)
      = 0
    BEGIN
      PRINT N'TEN TAI KHOAN HOAC MAT KHAU KHONG DUNG'
    END
    ELSE
    BEGIN
      SELECT
        *
      FROM NguoiDung(nolock)
      WHERE TenDangNhap = @TenDangNhap
      AND MatKhau = @MatKhau
      PRINT N'DANG NHAP THANH CONG'
    END
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  --write log
  PRINT N'LỖI HỆ THỐNG'
END CATCH
GO
-- create new user
CREATE PROC HTVP_CreateUser @Ten nvarchar(50),
@GioiTinh nvarchar(50),
@DiaChi nvarchar(50),
@CMND varchar(9),
@DienThoai varchar(20),
@TenDangNhap varchar(50),
@MatKhau varchar(50),
@TrangThai bit
AS
BEGIN TRY
  BEGIN TRAN
    IF (SELECT
        COUNT(1)
      FROM NguoiDung
      WHERE CMND = @CMND
      OR TenDangNhap = @TenDangNhap)
      = 0
    BEGIN
      INSERT INTO NguoiDung (TenND, GioiTinh, DiaChi, CMND, DienThoai, TenDangNhap, MatKhau)
        VALUES (@Ten, @GioiTinh, @DiaChi, @CMND, @DienThoai, @TenDangNhap, @MatKhau)
      SELECT
        N'Tạo tài khoản thành công',
        @TenDangNhap,
        @MatKhau AS infoUser
    END
    ELSE
    BEGIN
      SELECT
        N'Tài khoản này đã có trong hệ thống' AS infoUser
    END
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi Hệ thống ' + ERROR_MESSAGE() + ' - ' + CONVERT(nvarchar(30), ERROR_LINE()) AS infoUser
END CATCH
GO
-- change password

CREATE PROC HTVP_UpdatePassword @Id int,
@MatKhauCu varchar(50),
@MatKhauMoi varchar(50)
AS
BEGIN TRY
  BEGIN TRAN
    --process
    IF (SELECT
        COUNT(1)
      FROM NguoiDung
      WHERE MaND = @Id
      AND MatKhau = @MatKhauCu)
      = 0
    BEGIN
      SELECT
        N'Không tìm thấy người dùng' AS infoUser
    END
    ELSE
    BEGIN
      UPDATE NguoiDung
      SET MatKhau = @MatKhauMoi
      WHERE MaND = @Id
      SELECT
        N'Thay đổi mật khẩu thành công' AS infoUser
    END
  COMMIT
END TRY
BEGIN CATCH
  --write log
  ROLLBACK
  SELECT
    N'Lỗi hệ thống: ' + ERROR_MESSAGE() + ' - ' + CONVERT(varchar(30), ERROR_LINE()) AS infoUser
END CATCH
GO

-- change current information user
-- drop PROCEDURE HTVP_ChangeInfomation
CREATE PROC HTVP_UpdateInfomation @Id int,
@Ten nvarchar(50),
@GioiTinh nvarchar(50),
@DiaChi nvarchar(50),
@CMND varchar(9),
@DienThoai varchar(20),
@TrangThai bit
AS
BEGIN TRY
  BEGIN TRAN
    IF (SELECT
        COUNT(1)
      FROM NguoiDung
      WHERE MaND = @Id)
      = 0
    BEGIN
      SELECT
        N'Không tìm thấy người dùng' AS infoUser
    END
    ELSE
    BEGIN
      UPDATE NguoiDung
      SET TenND = @Ten,
          GioiTinh = @GioiTinh,
          DiaChi = @DiaChi,
          CMND = @CMND,
          DienThoai = @DienThoai,
          TrangThai = @TrangThai
      WHERE MaND = @id
      SELECT
        N'Cập nhật thông tin người dùng' + @Ten AS infoUser
    END
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi hệ thống: ' + ERROR_MESSAGE() + ' - ' + CONVERT(varchar(30), ERROR_LINE()) asinfoUser
END CATCH
GO

--- change list information
CREATE PROC Update_ListUser @tableList NguoiDung_List READONLY
AS
BEGIN
  SET NOCOUNT ON
  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
  SELECT
    * INTO #temp_EndList
  FROM NguoiDung_List
  WHERE 1 = 1
  UPDATE ND
  SET TenND = NDL.TenND,
      GioiTinh = NDL.GioiTinh,
      DiaChi = NDL.DiaChi,
      CMND = NDL.CMND,
      DienThoai = NDL.DienThoai,
      TrangThai = NDL.TrangThai
  FROM NguoiDung ND
  INNER JOIN #temp_EndList NDL
    ON NDL.MaND = ND.MaND
  DROP TABLE #temp_EndList
END
GO
-- delete user
-- drop PROCEDURE HTVP_ChangeInfomation
CREATE PROC HTVP_DeleteUser @Id int
AS
BEGIN TRY
  BEGIN TRAN
    IF (SELECT
        COUNT(1)
      FROM NguoiDung
      WHERE MaND = @Id)
      = 0
    BEGIN
      SELECT
        N'Không tìm thấy người dùng' AS infoUser
    END
    ELSE
    BEGIN
      UPDATE NguoiDung
      SET TrangThai = 1
      WHERE MaND = @id
      SELECT
        N'Xoá thông tin người dùng' AS infoUser
    END
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi hệ thống: ' + ERROR_MESSAGE() + ' - ' + CONVERT(varchar(30), ERROR_LINE()) asinfoUser
END CATCH
GO
--- Table HinhThucThanhToan
-- create payments
CREATE PROC HTVP_CreateHTTT @TenHinhThuc nvarchar(50)
AS
BEGIN TRY
  BEGIN TRAN
    IF (SELECT
        COUNT(1)
      FROM HinhThucThanhToan
      WHERE TenPhuongThucThanhToan = @TenHinhThuc)
      = 0
    BEGIN
      INSERT INTO HinhThucThanhToan
        VALUES (@TenHinhThuc)
    END
    ELSE
    BEGIN
      PRINT N'Đã có hình thức thanh toán'
    END
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi hệ thống: ' + ERROR_MESSAGE() + ' - ' + CONVERT(varchar(30), ERROR_LINE()) AS InfoHTTT
  PRINT N'Lỗi Hệ Thống. Xin Vui lòng thử lại sau'
END CATCH
GO
--- update payments
CREATE PROC HTVP_UpdateTTT @Id int,
@TenHinhThuc nvarchar(50)
AS
BEGIN TRY
  BEGIN TRAN
    IF (SELECT
        COUNT(1)
      FROM HinhThucThanhToan
      WHERE MaPTTT = @Id)
      > 0
    BEGIN
      PRINT N'Không tìm thấy Hình thức thanh toán này'
    END
    ELSE
    BEGIN
      UPDATE HinhThucThanhToan
      SET TenPhuongThucThanhToan = @TenHinhThuc
      WHERE MaPTTT = @Id
      PRINT N'Cập nhật thành công.'
    END
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi hệ thống: ' + ERROR_MESSAGE() + ' - ' + CONVERT(varchar(30), ERROR_LINE()) AS InfoHTTT
  PRINT N'Lỗi Hệ Thống. Xin Vui lòng thử lại sau'
END CATCH
GO

-- delete payments
CREATE PROC HTVP_DeleteHTTT @Id int
AS
BEGIN
  IF (SELECT
      COUNT(1)
    FROM HinhThucThanhToan
    WHERE MaPTTT = @id)
    = 0
  BEGIN
    PRINT N'Không tìm thấy hình thức thanh toán này'
  END
  ELSE
  BEGIN
    DELETE HinhThucThanhToan
    WHERE MaPTTT = @Id
    PRINT N'Xoá thành công hình thức thanh toán'
  END
END
GO

--- Table Loại người dùng
-- get all user type
CREATE PROC HTVP_GetAllUserType
AS
BEGIN
  SELECT
    *
  FROM LoaiNguoiDung(nolock)
END
GO
-- get usertye With Id
CREATE PROC HTVP_GetByIdUserType @Id int
AS
BEGIN
  IF (SELECT
      COUNT(1)
    FROM LoaiNguoiDung
    WHERE IdLoaiND = @Id)
    = 0
    PRINT 'Không tìm thấy người dùng'
  ELSE
    SELECT
      *
    FROM LoaiNguoiDung(nolock)
    WHERE IdLoaiND = @Id
END
GO
-- create UserType
CREATE PROC HTVP_CreateUserType @TenLoaiND nvarchar(50)
AS
BEGIN TRY
  BEGIN TRAN
    IF (SELECT
        COUNT(1)
      FROM LoaiNguoiDung
      WHERE TenLoaiND = @TenLoaiND)
      = 0
    BEGIN
      INSERT INTO LoaiNguoiDung
        VALUES (@TenLoaiND)
    END
    ELSE
    BEGIN
      PRINT N'Đã có loại người dùng này'
    END
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi hệ thống: ' + ERROR_MESSAGE() + ' - ' + CONVERT(varchar(30), ERROR_LINE()) AS InfoHTTT
  PRINT N'Lỗi Hệ Thống. Xin Vui lòng thử lại sau'
END CATCH
GO
--- update payments
CREATE PROC HTVP_UserType @Id int,
@TenLoaiND nvarchar(50)
AS
BEGIN TRY
  BEGIN TRAN
    IF (SELECT
        COUNT(1)
      FROM LoaiNguoiDung
      WHERE IdLoaiND = @Id)
      > 0
    BEGIN
      PRINT N'Không tìm thấy loại người dùng này'
    END
    ELSE
    BEGIN
      UPDATE LoaiNguoiDung
      SET TenLoaiND = @TenLoaiND
      WHERE IdLoaiND = @Id
      PRINT N'Cập nhật thành công.'
    END
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi hệ thống: ' + ERROR_MESSAGE() + ' - ' + CONVERT(varchar(30), ERROR_LINE()) AS InfoHTTT
  PRINT N'Lỗi Hệ Thống. Xin Vui lòng thử lại sau'
END CATCH
GO

-- delete payments
CREATE PROC HTVP_DeleteUerType @Id int
AS
BEGIN
  IF (SELECT
      COUNT(1)
    FROM LoaiNguoiDung
    WHERE IdLoaiND = @id)
    = 0
  BEGIN
    PRINT N'Không tìm thấy loại người dùng này'
  END
  ELSE
  BEGIN
    DELETE LoaiNguoiDung
    WHERE IdLoaiND = @Id
    PRINT N'Xoá thành loại người dùng'
  END
END
GO
-- Table Tuyến xe (carriage-way)
--- create carriage away
CREATE PROC HTVP_CreateCarriageAway @TenTuyen nvarchar(30),
@DiaDiemDi nvarchar(30),
@DiaDiemDen nvarchar(30)
AS
BEGIN TRY
  IF (SELECT
      COUNT(1)
    FROM TuyenXe
    WHERE TenTuyen = @TenTuyen)
    = 0
  BEGIN
    INSERT INTO TuyenXe
      VALUES (@TenTuyen, @DiaDiemDi, @DiaDiemDen, 1)
    PRINT N'Tạo thành công tuyến xe'
  END
  ELSE
  BEGIN
    PRINT N'Tuyễn Xe đã tồn tại trong hệ thống'
  END
  BEGIN TRAN
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi Hệ thống ' + ERROR_MESSAGE() + ' - ' + CONVERT(varchar(30), ERROR_LINE()) AS InfoCarriageAway
END CATCH
GO
-- Table Car
-- get all car
CREATE PROC HTVP_GetAllCar
AS
BEGIN
  SELECT
    *
  FROM Xe(nolock)
END
GO
-- create car
CREATE PROC HTVP_CreateCar @BienSoXe nvarchar(50),
@Loaixe nvarchar(50),
@SoLuongGhe nvarchar(50)
AS
BEGIN TRY
  BEGIN TRAN
    IF (SELECT
        COUNT(1)
      FROM Xe
      WHERE BienSoXe = @BienSoXe)
      = 0
    BEGIN
      INSERT INTO Xe
        VALUES (@BienSoXe, @Loaixe, @SoLuongGhe, 1)
      SELECT
        N'Thêm xe thành công' AS infoCar
    END
    ELSE
    BEGIN
      SELECT
        N'Biển số xe này đã có trong hệ thống' AS infoCar
    END
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi Hệ thống ' + ERROR_MESSAGE() + ' - ' + CONVERT(nvarchar(30), ERROR_LINE()) AS infoCar
END CATCH
GO
-- update car
CREATE PROC HTVP_UpdateCar @MaXe int,
@BienSoXe nvarchar(50),
@Loaixe nvarchar(50),
@SoLuongGhe nvarchar(50),
@TrangThai bit
AS
BEGIN TRY
  BEGIN TRAN
    IF (SELECT
        COUNT(1)
      FROM Xe
      WHERE MaXe = @MaXe
      AND BienSoXe <> @BienSoXe)
      = 0
    BEGIN
      SELECT
        N'Xe này không có trong hệ thống' AS infoCar
    END
    ELSE
    BEGIN

      UPDATE Xe
      SET BienSoXe = @BienSoXe,
          LoaiXe = @Loaixe,
          SoLuongGhe = @SoLuongGhe,
          TrangThai = @TrangThai
      WHERE MaXe = @MaXe
      SELECT
        N'update xe thành công' AS infoCar
    END
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi Hệ thống ' + ERROR_MESSAGE() + ' - ' + CONVERT(nvarchar(30), ERROR_LINE()) AS infoCar
END CATCH
GO
-- delete Car with id 
CREATE PROC HTVP_DeleteCar @MaXe int
AS
BEGIN TRY
  BEGIN TRAN
    IF (SELECT
        COUNT(1)
      FROM Xe
      WHERE MaXe = @MaXe)
      = 0
    BEGIN
      SELECT
        N'Xe này không có trong hệ thống' AS infoCar
    END
    ELSE
    BEGIN

      UPDATE Xe
      SET TrangThai = 0
      WHERE MaXe = @MaXe
      SELECT
        N'Xoá xe thành công' AS infoCar
    END
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi Hệ thống ' + ERROR_MESSAGE() + ' - ' + CONVERT(nvarchar(30), ERROR_LINE()) AS infoCar
END CATCH
GO
-- Ticket
--create ticket
CREATE PROC HTVP_CreateTicket @GiaVeThuc int,
@TrangThaiThanhToan bit,
@MaND int,
@IdChoNgoi int,
@MaPTTT int,
@MaTuyenXe int
AS
BEGIN TRY
  BEGIN TRAN
    IF (SELECT
        COUNT(1)
      FROM ChoNgoi
      WHERE IdChoNgoi = @IdChoNgoi)
      <> 0
    BEGIN
      PRINT N'Chổ ngồi này đã có người đặt'
      ROLLBACK
      RETURN 1
    END
    IF (SELECT
        COUNT(1)
      FROM HinhThucThanhToan
      WHERE MaPTTT = @MaPTTT)
      = 0
    BEGIN
      PRINT N'Phương thức thanh toán không không có trong hệ thống'
      ROLLBACK
      RETURN 1
    END
    IF (SELECT
        COUNT(1)
      FROM TuyenXe
      WHERE IdTuyen = @MaTuyenXe)
      = 0
    BEGIN
      PRINT N'Tuyến xe này không tồn tại'
      ROLLBACK
      RETURN 1
    END
    DECLARE @TenDangNhap nvarchar(50) = NULL
    IF @MaND > 0
    BEGIN
      SET @TenDangNhap = (SELECT
        TenDangNhap
      FROM NguoiDung
      WHERE MaND = @MaND)
    END
    INSERT INTO VE
      VALUES (@GiaVeThuc, @TrangThaiThanhToan, @MaND, GETDATE(), @IdChoNgoi, @MaPTTT, @TenDangNhap, @MaTuyenXe)
    PRINT N'Thêm thành công vé xe'
	RETURN 1
  COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
  SELECT
    N'Lỗi Hệ thống ' + ERROR_MESSAGE() + ' - ' + CONVERT(nvarchar(30), ERROR_LINE()) AS infoCar
END CATCH