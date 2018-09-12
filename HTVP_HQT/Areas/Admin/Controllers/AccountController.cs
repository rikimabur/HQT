using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HTVP_HQT.Models;

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
            ViewBag.Title = "Quản lý người dùng";
            return View();
        }
        public ActionResult GetById(int id)
        {
            ViewBag.Title = "Người dùng";
            return View();
        }
        public ActionResult Update(int id)
        {
            ViewBag.Title = "Người dùng";
            return View();
        }
        [HttpPost]
        public ActionResult Update(NguoiDungModel model)
        {
            ViewBag.Title = "Người dùng";
            return View();
        }
        public ActionResult Delete(int id)
        {
            return View();
        }
    }
}