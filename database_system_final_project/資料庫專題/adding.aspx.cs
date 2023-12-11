using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 資料庫專題
{
    public partial class adding : System.Web.UI.Page
    {
        bool loggedIn;
        DateTime eatingTime;
        protected void Page_Load(object sender, EventArgs e)
        {
            //強制轉成bool型態 存出global variable
            loggedIn = (bool)Session["loggedIn"];

            // 如果尚未登入 loggedIn = false 跳出彈窗警告 跳回去登入
            if(!loggedIn)
                Response.Write("<script>alert('您尚未登入！');location.href='default.aspx';</script>");

            // 連線資料庫
            // 假設您有一個資料庫連線和一個 SQL 查詢
            /*string connectionString = "ConnectionString";
            string query = "SELECT * FROM nutrientTable";

            // 使用 SqlConnection 和 SqlCommand 連接到資料庫
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();

                // 使用 SqlDataReader 讀取資料庫查詢的結果
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    // 清除現有的選項
                    nameDataList.InnerHtml = "";

                    // 遍歷查詢結果，並將每一個 FlavorName 加入到 <datalist> 中
                    while (reader.Read())
                    {
                        string foodName = reader["name"].ToString();
                        nameDataList.InnerHtml += $"<option value=\"{foodName}\"></option>";
                    }
                }
            }*/
            for(int i = 0; i < foodDetailsView.Rows.Count; i++)
            {

            }
        }

        protected void insertButton_Click(object sender, EventArgs e)
        {
            //取出input time的值
            timeLabel.Text = timeInput.Value;
            //檢查帳號 時間有沒有輸入
            if (Session["account"] != null && timeLabel.Text != null)
            {
                //新增一餐到mealTable
                mealTableSqlDataSource.Insert();
                //在mealFoodTable新增一餐空的default 為了能顯示這一餐
                mealIDDetailsView.DataBind();
                mealFoodTableSqlDataSource.Insert();
            }
        }
    }
}