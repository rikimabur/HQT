using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HTVP_HQT.Models
{
    public class NguoiDungModel
    {
        public int MaND{ get; set; }
        public string TenND { get; set; }
        public string GioiTinh { get; set; }
        public string DiaChi { get; set; }
        public string CMND { get; set; }
        public string DienThoai { get; set; }
        public string TenDangNhap { get; set; }
        public string MatKhau { get; set; }
        public int IdLoaiND { get; set; }
        public bool TrangThai { get; set; }
    }
}