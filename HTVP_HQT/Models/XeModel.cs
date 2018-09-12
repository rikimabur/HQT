using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HTVP_HQT.Models
{
    public class XeModel
    {
        public int Id { get; set; }
        public string BienSoXe { get; set; }
        public string LoaiXe { get; set; }
        public int SoLuongGhe { set; get; }
        public bool TrangThai { get; set; }
    }
}