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

namespace EmployeeManagement
{
    public partial class Homepage : System.Web.UI.Page
    {
        // connection string
        private string str = ConfigurationManager.ConnectionStrings["DatabaseConnString"].ConnectionString;

        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                string name = string.Empty;
                using (SqlConnection conn = new SqlConnection(str))
                {
                    conn.Open();
                    string query = "SELECT FirstName, LastName from Supervisors WHERE Username=@username ";
                    SqlCommand sqlCmd = new SqlCommand(query, conn);
                    sqlCmd.Parameters.AddWithValue("@username", Session["Username"].ToString());
                    SqlDataReader reader = sqlCmd.ExecuteReader();

                    reader.Read();
                    name = reader["FirstName"].ToString() + " " + reader["LastName"].ToString();
                    UsernameLbl.Text = name;
                }
            }
            else
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                FillEmployeeGrid();
            }
        }
        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
        protected void AppraisalPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("SupervisorAppraisals.aspx");
        }

         private void FillEmployeeGrid(string sortExpression = null)
        {
            using (SqlConnection conn = new SqlConnection(str))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT EmployeeID,Name,Title,Department,Classification from Employees WHERE Supervisor=@Supervisor"))
                {
                    cmd.Parameters.AddWithValue("@Supervisor", UsernameLbl.Text.Trim());

                    using (SqlDataAdapter ad = new SqlDataAdapter())
                    {
                        cmd.Connection = conn;
                        ad.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            ad.Fill(dt);
                            if (sortExpression != null)
                            {
                                DataView dv = dt.AsDataView();
                                this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";
                                dv.Sort = sortExpression + " " + this.SortDirection;
                                GridView1.DataSource = dv;
                            }
                            else
                            {
                                GridView1.DataSource = dt;
                            }
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            FillEmployeeGrid();
        }
        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            FillEmployeeGrid(e.SortExpression);
        }
    }
}