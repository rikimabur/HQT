using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HTVP_HQT.Helpers
{
    public class CurrentContext
    {
        public static bool IsLogged()
        {
            if (HttpContext.Current.Session["IsLogin"] == null)
            {
                HttpContext.Current.Session["IsLogin"] = 0;
            }

            if ((int)HttpContext.Current.Session["IsLogin"] == 1)
                return true;
            return false;
        }
        public static void Destroy()
        {
            HttpContext.Current.Session["IsLogin"] = 0;
            HttpContext.Current.Session["CurUser"] = null;
        }
    }
}