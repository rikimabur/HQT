using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HTVP_HQT.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        // GET: /Account/Login
        public ActionResult Login()
        {
            return View();
        }
        // GET: /Account/Register
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LogOut()
        {
            return RedirectToAction("Index", "Home");
        }
        // GET: Admin/Account
        public ActionResult Index()
        {
            return View();
        }
    }
}