using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HTVP_HQT.Helpers
{
    public class BaseController : Controller
    {
        public bool IsLogin()
        {
           return CurrentContext.IsLogged();
        }
    }
}