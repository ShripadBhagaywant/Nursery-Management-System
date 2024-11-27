//using System;
//using System.Collections.Generic;
//using System.Data.SqlClient;
//using System.Data;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Drawing;
//using project_Nusery.Admin1;

//namespace project_Nusery.user
//{
//    public partial class Cart : System.Web.UI.Page
//    {
//        SqlConnection con;
//        SqlCommand cmd;
//        SqlDataAdapter sda;
//        DataTable dt;
//        decimal grandTotal = 0;
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                if (Session["userId"] == null)
//                {
//                    Response.Redirect("Login.aspx");
//                }
//                else
//                {
//                    getCartItems();
//                }
//            }
//        }
//        void getCartItems()
//        {
//            con = new SqlConnection(Connection.GetConnectionString());
//            cmd = new SqlCommand("Cart_Crud", con);
//            cmd.Parameters.AddWithValue("@Action", "SELETE");
//            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
//            cmd.CommandType = CommandType.StoredProcedure;
//            sda = new SqlDataAdapter(cmd);
//            dt = new DataTable();
//            sda.Fill(dt);
//            rCartItem.DataSource = dt;
//            if (dt.Rows.Count == 0)
//            {
//                rCartItem.FooterTemplate = null;
//                rCartItem.FooterTemplate = new CustomTemplate(ListItemType.Footer);
//            }
//            rCartItem.DataBind();
//        }

//        protected void rCartItem_ItemCommand(object source, RepeaterCommandEventArgs e)
//        {
//            Utils utils = new Utils();
//            if(e.CommandName== "remove")
//            {
//                con = new SqlConnection(Connection.GetConnectionString());
//                cmd = new SqlCommand("Cart_Crud", con);
//                cmd.Parameters.AddWithValue("@Action", "DELETE");
//                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);               
//                cmd.Parameters.AddWithValue("@UserId",Session[" userId"]);
//                cmd.CommandType = CommandType.StoredProcedure;
//                try
//                {
//                    con.Open();
//                    cmd.ExecuteNonQuery();
//                    getCartItems();
//                    Session["cartCount"] = utils.cartCount(Convert.ToInt32(Session["userId"]));
                  
                    
//                }
//                catch (Exception ex)
//                {
                    
//                   Response.Write("<script>alert('Error-" + ex.Message + " ');<script>");

//                }
//                finally
//                {
//                    con.Close();
//                }
//            }
//            if(e.CommandName== "updateCart")
//            {
//                bool isCartUpdated = false;
//                for(int item =0; item< rCartItem.Items.Count;item++)
//                {
//                    if (rCartItem.Items[item].ItemType == ListItemType.Item || rCartItem.Items[item].ItemType == ListItemType.AlternatingItem)
//                    {
//                    }                       }
//                }
//            }
//        }

//        protected void rCartItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
//        {
//            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.Item)
//            {
//                Label totalPrice = e.Item.FindControl("lblTotalPrice") as Label;
//                Label productPrice = e.Item.FindControl("lblPrice") as Label;
//                TextBox quantity = e.Item.FindControl("txtQuantity") as TextBox;
//                decimal calTotalPrice = Convert.ToDecimal(productPrice.Text) * Convert.ToDecimal(quantity.Text);
//                totalPrice.Text = calTotalPrice.ToString();
//                grandTotal += calTotalPrice;
//            }
//            Session["grndTotalPrice"] = grandTotal;
//        }
//        //Custom template class to add controls to the repeater's header, item and footer sections.
//        private sealed class CustomTemplate : ITemplate
//        {

//            private ListItemType ListItemType { get; set; }

//            public CustomTemplate(ListItemType type)
//            {
//                ListItemType = type;
//            }

//            public void InstantiateIn(Control container)
//            {
//                if (ListItemType == ListItemType.Footer)
//                {
//                    var footer = new LiteralControl("<tr><td colspan='5'><b>Your Cart is empty.</b><a href='Indoor.aspx' class='badge badge- info m1-2'>Continue Shopping</a></td></tr></tbody></table> "); 
//                        container.Controls.Add(footer);
//                }
//            }
//        }
//    }
//}








          