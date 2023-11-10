using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 資料庫專題
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            titleLB.Text = ("歡迎來到飲食紀錄平台");
            errorLabel.Visible = false;
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            userAccountDetailsView.DataBind();
            //沒有找到這個帳號
            if(userAccountDetailsView.DataItemCount == 0)
            {
                errorLabel.Visible = true;
                Session["account"] = null;
                Session["password"] = null;
            }
            //有找到這個帳號且正好為1個
            else if(userAccountDetailsView.DataItemCount == 1)
            {
                
                errorLabel.Visible = true;
                errorLabel.Text = "登入成功";
                Session["account"] = accountTextBox.Text;
                Response.Redirect("~/meal.aspx");
            }
        }
    }
}