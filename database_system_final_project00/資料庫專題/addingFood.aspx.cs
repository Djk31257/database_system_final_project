using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 資料庫專題
{
    public partial class addingFood : System.Web.UI.Page
    {
        float weight;
        string[] nutrientStr = new string[] {"calorie", "water", "protein", "fat", "saturated_fat",
                                             "trans_fat", "ash", "carbonhydrate", "dietary_fiber"};
        protected void Page_Load(object sender, EventArgs e)
        {
            titleLabel.Text = "請新增一餐中的食物";
        }

        protected void addingButton_Click(object sender, EventArgs e)
        {
            if(weightTextBox.Text == "")
            {
                Response.Write("<script>alert('請輸入重量！');</script>");
            }
            else if (mealGridView.SelectedRow == null)//沒有選取哪一餐
            {
                Response.Write("<script>alert('請選擇要加入哪一餐！');</script>");
            }
            else
            {
                // 把text轉成float
                weight = float.Parse(weightTextBox.Text);
                // 取出DetailsView的name欄位 食物名稱 存到Session
                Session["food_name"] = nutrientDetailsView.Rows[0].Cells[1].Text.ToString();
                // 取出DetailsView的calorie欄位存到Session
                // 各營養素欄位 值都是float
                for(int i = 1; i <= 9; i++)
                {
                    // 如果資料表中這欄位不為null
                    if (!nutrientDetailsView.Rows[i].Cells[1].Text.ToString().Equals("&nbsp;"))
                        Session[nutrientStr[i - 1]] = float.Parse(nutrientDetailsView.Rows[i].Cells[1].Text);
                    else// 這欄位null
                        Session[nutrientStr[i - 1]] = 0.0;

                    //用輸出顯示看detailView空的欄位會顯示什麼 顯示 &nbsp;
                    /*Console.WriteLine(nutrientDetailsView.Rows[i].Cells[1].Text);
                    System.Diagnostics.Debug.WriteLine(nutrientDetailsView.Rows[i].Cells[1].Text);*/
                }
                /*Session["calorie"] = float.Parse(nutrientDetailsView.Rows[1].Cells[1].Text);
                Session["water"] = float.Parse(nutrientDetailsView.Rows[2].Cells[1].Text);
                Session["protein"] = float.Parse(nutrientDetailsView.Rows[3].Cells[1].Text);
                Session["fat"] = float.Parse(nutrientDetailsView.Rows[4].Cells[1].Text);
                Session["saturated_fat"] = float.Parse(nutrientDetailsView.Rows[5].Cells[1].Text);
                Session["trans_fat"] = float.Parse(nutrientDetailsView.Rows[6].Cells[1].Text);
                Session["ash"] = float.Parse(nutrientDetailsView.Rows[7].Cells[1].Text);
                Session["carbonhydrate"] = float.Parse(nutrientDetailsView.Rows[8].Cells[1].Text);
                Session["dietary_fiber"] = float.Parse(nutrientDetailsView.Rows[9].Cells[1].Text);*/

                //執行新增SQL指令
                mealFoodSqlDataSource.Insert();
                //新增完 表單重新抓資料
                mealGridView.DataBind();
            }
        }

        protected void dateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            // 將dataCalendar選的日期轉成string
            string formattedDate = dateCalendar.SelectedDate.ToString("yyyy-MM-dd");
            //查詢語法多增加日期條件 把string傳入SQL語句中
            mealSqlDataSource.SelectCommand = ("SELECT mealTable.meal_id, mealTable.account, mealTable.date, mealTable.time, SUM(mealFoodTable.calories) AS TC FROM mealTable INNER JOIN mealFoodTable ON mealTable.meal_id = mealFoodTable.meal_id GROUP BY mealTable.meal_id, mealTable.account, mealTable.date, mealTable.time HAVING (mealTable.account = @account AND mealTable.date = '" + formattedDate + "')");
        }

        protected void foodDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            nutrientDetailsView.DataBind();
            Session["food_name"] = nutrientDetailsView.Rows[0].Cells[1].Text.ToString();
            for (int i = 1; i <= 9; i++)
            {
                // 如果資料表中這欄位不為null
                if (!nutrientDetailsView.Rows[i].Cells[1].Text.ToString().Equals("&nbsp;"))
                    Session[nutrientStr[i - 1]] = float.Parse(nutrientDetailsView.Rows[i].Cells[1].Text);
                else// 這欄位null
                    Session[nutrientStr[i - 1]] = 0.0;
            }
        }

        protected void mealFoodGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            // mealFood有刪除 一餐中吃的食物 上面一餐總熱量就要變動
            // 重新抓資料
            mealGridView.DataBind();
        }

        protected void typeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            foodDropDownList.Items.Clear();
            foodDropDownList.DataBind();
            nutrientDetailsView.DataBind();
            Session["food_name"] = nutrientDetailsView.Rows[0].Cells[1].Text.ToString();
            for (int i = 1; i <= 9; i++)
            {
                // 如果資料表中這欄位不為null
                if (!nutrientDetailsView.Rows[i].Cells[1].Text.ToString().Equals("&nbsp;"))
                    Session[nutrientStr[i - 1]] = float.Parse(nutrientDetailsView.Rows[i].Cells[1].Text);
                else// 這欄位null
                    Session[nutrientStr[i - 1]] = 0.0;
            }
        }
    }
}