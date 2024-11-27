using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using project_Nusery.Admin1;
using System.Xml.Linq;

namespace project_Nusery.user
{

    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

           if(!IsPostBack)
            {
                if (Request.QueryString["id"] != null) /* Session["userId"] != null)*/
                {
                    getUserDetails();
                }
                else if (Session["userId"] != null)
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int userId = Convert.ToInt32(Request.QueryString["id"]);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", userId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Name", TextName.Text.Trim());
            cmd.Parameters.AddWithValue("@Username", TextUsername.Text.Trim()); cmd.Parameters.AddWithValue("@Mobile", TextMobile.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", TextEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", TextAddress.Text.Trim()); cmd.Parameters.AddWithValue("@PostCode", TextPostCode.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", TextPassword.Text.Trim());
            if (fuUserImage.HasFile)
            {
                if (Utils.IsValidExtension(fuUserImage.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuUserImage.FileName);
                    imagePath = "Images/User/" + obj.ToString() + fileExtension;
                    fuUserImage.PostedFile.SaveAs(Server.MapPath("~/Images/User/") + obj.ToString() + fileExtension); cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg, .jpeg or.png image";
                    lblMsg.CssClass = "alert alert-danger";
                    isValidToExecute = false;
                }
            }
            else
            {
                isValidToExecute = true;
            }
            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = userId == 0 ?
                    "registration is successful! <b><a href='Login.aspx'>Click here</a></b> to do login" :
                    "details updated successful! <b><a href='Profile.aspx'>Can check here</a></b>";
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + TextUsername.Text.Trim() + "</b> " + actionName; //"Registration is successful! <b><a href='Login
                    lblMsg.CssClass = "alert alert-success";
                    if (userId != 0)
                    {
                        Response.AddHeader("REFRESH", "1; URL=Profile.aspx");
                    }

                    clear();
                }
                catch (SqlException ex)
                {
                    if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "<br>" + TextUsername.Text.Trim() + "<br> username already exits,try new one..!";
                        lblMsg.CssClass = "alert alert-danger";

                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
        }

        void getUserDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                TextName.Text = dt.Rows[0]["Name"].ToString();
                TextUsername.Text = dt.Rows[0]["Username"].ToString();
                TextMobile.Text = dt.Rows[0]["Mobile"].ToString();
                TextEmail.Text = dt.Rows[0]["Email"].ToString();
                TextAddress.Text = dt.Rows[0]["Address"].ToString();
                TextPostCode.Text = dt.Rows[0]["PostCode"].ToString();
                imgUser.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString())
                ? " ../Images/No_image.png" : "../" + dt.Rows[0]["ImageUrl"].ToString();
                imgUser.Height = 200;
                imgUser.Width = 200;
                TextPassword.TextMode = TextBoxMode.SingleLine;
                TextPassword.ReadOnly = true;
                TextPassword.Text = dt.Rows[0]["Password"].ToString();
            }
            lblHeaderMsg.Text = "<h2>Edit Profile</h2>";
            btnRegister.Text = "Update";
            lblAlreadyUser.Text = "";
        }
        private void clear()
        {
            TextName.Text = string.Empty;
            TextUsername.Text = string.Empty;
            TextMobile.Text = string.Empty;
            TextEmail.Text = string.Empty;
            TextAddress.Text = string.Empty;
            TextPostCode.Text = string.Empty;
            TextPassword.Text = string.Empty;
        }
    }
}
