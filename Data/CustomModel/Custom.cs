using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Data.CustomModel
{
    public class Custom
    {
        /// <summary>
        /// send email using smtp mail
        /// </summary>
        /// <param name="email">for sent email to pass who email address to pass email in fisrt parameter</param>
        /// <param name="otp"> otp parameter</param>
        /// <param name="msg"> and success message</param>
        /// <returns>message</returns>
        public static string SendMailSMTP(string email,string otp ,string msg= "OTP sent successfully!")
        {
            // Sender's email address and password
            string senderEmail = "xyz@gmail.com";
            string senderPassword = "xyz";

            // Recipient's email address
            string recipientEmail = email;

            // Create a new MailMessage
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(senderEmail);
            mailMessage.To.Add(recipientEmail);
            mailMessage.Subject = "Vefify Account ";
            //mailMessage.Body = "Body of the email";
            mailMessage.Body = "Your OTP is"+ otp+ " .";

            // Create a new SmtpClient
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
            smtpClient.Port = 587;
            smtpClient.Credentials = new NetworkCredential(senderEmail, senderPassword);
            smtpClient.EnableSsl = true;

             try
            {
                // Send the email
                smtpClient.Send(mailMessage);
            }
             catch (Exception ex)
            {
               throw ex;
                 //msg ="Fail, Please Try Again After Some Time !!";
            }
            return msg;
        }
        /// <summary>
        /// get Otp default 4 degit
        /// </summary>
        /// <param name="digit">how meny degit genrate otp</param>
        /// <returns>string otp</returns>
        public static string GetOTP(int digit=4)
        {
            string OTP = "";
            Random random= new Random();
            for (int i = 0; i < digit; i++)
            {
                OTP += random.Next(0, 9);
            }
            return OTP;
        }
    }
}
