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
        bool loggedIn;
        protected void Page_Load(object sender, EventArgs e)
        {
            //強制轉成bool型態 存出global variable
            loggedIn = (bool)Session["loggedIn"];

            // 如果尚未登入 loggedIn = false 跳出彈窗警告 跳回去登入
            if (!loggedIn)
                Response.Write("<script>alert('您尚未登入！');location.href='default.aspx';</script>");
            //標題顯示使用者名稱(帳號)
            titleLabel.Text = "歡迎：" + Session["account"].ToString() + "，以下是您的紀錄";
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

        // 如果有選擇日期 查詢語法改一下重新查
        protected void dateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            // 將dataCalendar選的日期轉成string
            string formattedDate = dateCalendar.SelectedDate.ToString("yyyy-MM-dd");
            //查詢語法多增加日期條件 把string傳入SQL語句中
            //mealSqlDataSource.SelectCommand=("SELECT mealTable.meal_id, mealTable.account, mealTable.date, mealTable.time, SUM(mealFoodTable.calories) AS TC FROM mealTable INNER JOIN mealFoodTable ON mealTable.meal_id = mealFoodTable.meal_id GROUP BY mealTable.meal_id, mealTable.account, mealTable.date, mealTable.time HAVING (mealTable.account = @account AND mealTable.date = '" + formattedDate + "')");
            mealSqlDataSource.SelectCommand = ("SELECT mealTable.meal_id, mealTable.account, mealTable.date, mealTable.time, SUM(mealFoodTable.calories) AS TC, SUM(mealFoodTable.water) AS total_water, SUM(mealFoodTable.protein) AS total_protein, SUM(mealFoodTable.fat) AS total_fat, SUM(mealFoodTable.saturated_fat) AS total_saturated_fat, SUM(mealFoodTable.ash) AS total_ash, SUM(mealFoodTable.carbonhydrate) AS total_carbonhydrate, SUM(mealFoodTable.dietary_fiber) AS total_dietary_fiber, SUM(mealFoodTable.trans_fat) AS total_trans_fat FROM mealTable INNER JOIN mealFoodTable ON mealTable.meal_id = mealFoodTable.meal_id GROUP BY mealTable.meal_id, mealTable.account, mealTable.date, mealTable.time HAVING (mealTable.account = @account AND mealTable.date = '" + formattedDate + "')");
        }
    }
}