using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace HTVP_HQT.Helpers
{
    public static class Extensions
    {
        public static int[] TointArray(this string val)
        {
            try
            {
                if (string.IsNullOrEmpty(val))
                    return new int[0];
                val = val.Trim(',').Replace(" ", "").Trim();
                if (!val.IsValidatedCommaList())
                    return new int[0];
                var a = val.Split(',');
                var l = new List<int>();
                foreach (var item in a)
                {
                    int y;
                    if (int.TryParse(item.Trim(), out y))
                        l.Add(y);
                }
                return l.ToArray();
            }
            catch (Exception)
            {
                return new int[0];
            }
        }
        /// <summary>
        /// Kiểm tra xem chuỗi có phải ở dạng ID,ID,ID... hay không?
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static bool IsValidatedCommaList(this string s)
        {
            if (string.IsNullOrEmpty(s))
                return false;
            // không chứa dấu ,  thì hiển nhiên tách được
            if (!s.Contains(','))
                return true;
            s = s.Trim(',').Trim();
            return Regex.IsMatch(s, "^([0-9]+,)*[0-9]+$");
        }
        public static List<int> SplitToIntList(string input, char separator = ',')
        {
            if (String.IsNullOrEmpty(input))
                return new List<int>();
            try
            {
                return input.Split(separator).Select(Int32.Parse).ToList();
            }
            catch (Exception)
            {
                return new List<int>();
            }
        }
        /// <summary>
        /// Chuyển một số về dạng tiền tệ
        /// </summary>
        /// <param name="number">Giá trị cần chuyển (int, decimal, double...)</param>
        /// <param name="unit">Đơn vị tính</param>
        /// <returns>String dạng tiền tệ</returns>
        public static string ToCurrency(this object number, string unit = "")
        {
            if (string.IsNullOrEmpty(unit))
                return number.FormatNumber("{0:c}");
            return number.FormatNumber("{0:c}") + "/" + unit.ToLower();
        }
        private static string FormatNumber(this object value, string format)
        {
            if (!value.IsNumericType())
                throw new ArgumentException("\"" + value + "\" is not a number.");

            var result = string.Format("vi-VN", format, value);
            if (result.StartsWith("0"))
                return string.Empty;
            return result;
        }
        /// <summary>
        /// Kiểm tra một object có phải là kiểu số hay không
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public static bool IsNumericType(this object o)
        {
            switch (Type.GetTypeCode(o.GetType()))
            {
                case TypeCode.Byte:
                case TypeCode.SByte:
                case TypeCode.UInt16:
                case TypeCode.UInt32:
                case TypeCode.UInt64:
                case TypeCode.Int16:
                case TypeCode.Int32:
                case TypeCode.Int64:
                case TypeCode.Decimal:
                case TypeCode.Double:
                case TypeCode.Single:
                    return true;
                default:
                    return false;
            }
        }
        public static bool CheckIsNumber(this string strNumber)
        {
            if (string.IsNullOrEmpty(strNumber))
            {
                return false;
            }
            string strExp = "[0-9]{" + strNumber.Length + "}";
            return Regex.IsMatch(strNumber, strExp);
        }
        public static bool IsPhoneNumber(this string phone)
        {
            if (string.IsNullOrEmpty(phone))
                return false;
            const string phonePattern = @"^((09(\d){8})|(052(\d){7})|(01(\d){9})|(08(\d){8}))$";
            return Regex.IsMatch(phone.Trim(), phonePattern);
        }
        public static bool IsEmail(this string email)
        {
            if (string.IsNullOrEmpty(email))
                return false;
            const string sMailPattern = @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
            return Regex.IsMatch(email.Trim(), sMailPattern);
        }
    }
}