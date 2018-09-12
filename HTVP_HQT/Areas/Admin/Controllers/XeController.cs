using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HTVP_HQT.Areas.Admin.Controllers
{
    public class XeController : Controller
    {
        // GET: Admin/Xe
        public ActionResult Index()
        {
            ViewBag.title = "Quản lý xe";
            return View();
        }
    }
}