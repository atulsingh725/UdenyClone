using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//using Sy

namespace Data.DBModel
{
    public class RegistrationModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage ="Please Enter First Name !!")]
        public string FirstName { get; set; }
        public string LastName { get; set; }

        [Required(ErrorMessage = "Please Enter Email Address!!"),RegularExpression(@"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$",ErrorMessage ="Please Enter Valid Email Address !!")]
        public string Email { get; set; }
        public string MobileNumber { get; set; }
        public string ProfileImage { get; set; }
        public Guid Uid { get; set; }
        public string IsServiceProvider { get; set; }
        public string Password { get; set; }
        public string OTP { get; set; }
        public bool IsSendOTP { get; set; }
    }
}
