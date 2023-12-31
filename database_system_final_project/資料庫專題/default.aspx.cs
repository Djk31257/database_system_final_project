﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 資料庫專題
{
    public partial class _default : System.Web.UI.Page
    {
        // 用一個bool變數 等等用Session傳global 跨頁面
        bool loggedIn = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            titleLB.Text = ("歡迎來到飲食紀錄平台");
            errorLabel.Visible = false;
            // 如果沒登入過
            if (Application["loggedIn"] == null)
            {
                Session["account"] = "";
                loggedIn = false;
                Session["loggedIn"] = loggedIn;
            }
            // 如果登入過
            else
            {
                loggedIn = true;
                accountTextBox.Visible = false;
                passwordTextBox.Visible = false;
            }
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
                loggedIn = false;
                Session["loggedIn"] = false;
                Response.Write("<script>alert('帳號或密碼錯誤');</script>");
            }
            //有找到這個帳號且正好為1個
            else if(userAccountDetailsView.DataItemCount == 1)
            {
                loggedIn = true;
                errorLabel.Visible = true;
                errorLabel.Text = "登入成功";
                Session["account"] = accountTextBox.Text;
                Session["loggedIn"] = true;
                Response.Redirect("~/meal.aspx");
                Application["loggedIn"] = "abc";
            }
            //Session["loggedIn"] = loggedIn;
        }
    }
}