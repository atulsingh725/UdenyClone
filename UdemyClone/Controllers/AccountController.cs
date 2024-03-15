using Data.DBModel;
using Microsoft.Win32;
using Repository.businessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace UdemyClone.Controllers
{
    public class AccountController : Controller
    {
        private readonly AccountLayer accountLayer;
        public AccountController()
        {
            accountLayer = new AccountLayer();
        }
        // GET: Account
        /// <summary>
        /// for registration a new account
        /// </summary>
        /// <returns> View</returns>
        public ActionResult Registration()
        {
            return View(new RegistrationModel());
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Registration(RegistrationModel registrationModel)
        {
            try
            {
                TempData["msg"]= accountLayer.Register(registrationModel);
                ViewBag.SendOTP=registrationModel.IsSendOTP==true?true:false;
            }
            catch (Exception ex)
            {
                //throw ex;
                TempData["msg"] = "Error Occurred, Please Try Agian After Some Time !!!";
            }
            return View(registrationModel);
        }

    }
}