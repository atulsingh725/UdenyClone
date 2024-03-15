using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Data.CustomModel;
using Data.DBModel;

namespace Repository.businessLayer
{
    public class AccountLayer
    {
        private readonly DBManager dBManager;
        private DataTable dt;
        public AccountLayer() { 
            dBManager= new DBManager();
        }
        public string Register(RegistrationModel registrationModel)
        {
            try
            {
                registrationModel.OTP = Custom.GetOTP();string msg;
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                //new SqlParameter("@Action",1),
                new SqlParameter("@Uid",registrationModel.Uid),
                new SqlParameter("@FirstName",registrationModel.FirstName),
                new SqlParameter("@LastName",registrationModel.LastName),
                new SqlParameter("@Email",registrationModel.Email),
                //new SqlParameter("@Password",registrationModel.Password),
                new SqlParameter("@Otp",registrationModel.OTP)
                };
                dt = dBManager.ExeCRUD("sp_Register", sqlParameters);
                if (dt != null && dt.Rows[0]["flag"].ToString() == "1")
                { 
                    msg = Custom.SendMailSMTP(registrationModel.Email, registrationModel.OTP);
                    registrationModel.IsSendOTP=true;
                }
                else
                    msg =dt.Rows[0]["msg"].ToString();
                return msg;
            }
            catch(Exception e)
            {
                throw e;
            }

        }
    }
}
