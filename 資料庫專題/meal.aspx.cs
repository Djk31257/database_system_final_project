using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 資料庫專題
{
    public partial class meal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //標題顯示使用者名稱(帳號)
            titleLabel.Text = "歡迎<br>" + Session["account"].ToString() + "<br>以下是您的紀錄";
            //建立一餐預設的食物 讓資料庫一定抓得到資料
            Session["default"] = "default";
        }

        protected void mealGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void mealFoodGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            mealGridView.DataBind();
        }
    }
}