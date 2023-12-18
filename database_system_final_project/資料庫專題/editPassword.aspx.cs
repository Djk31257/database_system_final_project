using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 資料庫專題
{
    public partial class editPassword : System.Web.UI.Page
    {
        bool loggedIn;
        protected void Page_Load(object sender, EventArgs e)
        {
            //強制轉成bool型態 存出global variable
            loggedIn = (bool)Session["loggedIn"];

            // 如果尚未登入 loggedIn = false 跳出彈窗警告 跳回去登入
            if (!loggedIn)
                Response.Write("<script>alert('您尚未登入！');location.href='default.aspx';</script>");

            accountLabel.Text = "已登入帳號: " + Session["account"].ToString();
        }
        protected void editButton_Click(object sender, EventArgs e)
        {
            if(newPasswordTextBox.Text != newPasswordTextBox0.Text)
            {
                Response.Write("<script>alert('密碼不一致！');</script>");
            }
            else
            {
                userAccountSqlDataSource.Update();
                Response.Write("<script>alert('修改完成！');</script>");
            }
        }
    }
}