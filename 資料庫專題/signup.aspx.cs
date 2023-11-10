using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 資料庫專題
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            titleLB.Text = "註冊";
            //userAccountDetailsView.DataBind();

            //暫時先隱藏email註冊
            /*emailLabel.Visible = false;
            emailTextBox.Visible = false;*/

            //密碼錯誤訊息先隱藏
            errorLabel.Visible = false;
            //檢查註冊過的View隱藏
            userAccountDetailsView.Visible = false;
        }

        protected void signupButton_Click(object sender, EventArgs e)
        {
            //View抓資料
            userAccountDetailsView.DataBind();
            //密碼與確認密碼不一樣
            if (passwordTextBox.Text != passwordConfirmTextBox.Text)
            {
                errorLabel.Text = "密碼不一致";
                errorLabel.Visible = true;
            }
            else//密碼確認一樣
            {
                //如果沒註冊過 帳號資料表查詢資料筆數為0
                if(userAccountDetailsView.DataItemCount == 0)
                {
                    Session["account"] = accountTextBox.Text;
                    Session["password"] = passwordTextBox.Text;
                    Session["email"] = emailTextBox.Text;
                    //userAccountDetailsView.Visible = true;
                    signupSqlDataSource.Insert();
                    errorLabel.Text = "註冊成功！請返回登入";
                    errorLabel.Visible = true;
                }
                else
                //if(userAccountDetailsView.DataItemCount == 1)
                {
                    errorLabel.Text = "此帳號已註冊過";
                    errorLabel.Visible = true;
                    //userAccountDetailsView.Visible = true;
                    Session["account"] = null;
                    Session["password"] = null;
                    Session["email"] = null;
                }
            }
        }
    }
}