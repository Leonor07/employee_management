using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Collections;
using System.Windows;

namespace EmployeeManagement
{
    public partial class Login : System.Web.UI.Page
    {
        // connection string
        private string str = ConfigurationManager.ConnectionStrings["DatabaseConnString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            loginError.Visible = false;
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(str))
            {
                conn.Open();
                string query = "SELECT COUNT (1) FROM Supervisors WHERE Username=@username AND Password=@password";
                SqlCommand sqlCmd = new SqlCommand(query, conn);
                sqlCmd.Parameters.AddWithValue("@username", UsernameTxt.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@password", PasswordTxt.Text.Trim());
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (count == 1)
                {
                    Session["Username"] = UsernameTxt.Text.Trim();
                    Response.Redirect("Homepage.aspx");

                }
                else { loginError.Visible = true; }
            }
        }
    }
}