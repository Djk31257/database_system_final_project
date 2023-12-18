<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addingFood.aspx.cs" Inherits="資料庫專題.addingFood" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新增食物</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
            background-color: #333333;
        }
        .auto-style5 {
            font-size: xx-large;
        }
        .auto-style6 {
            text-align: center;
        }
        </style>
</head>
<body style="background-color: #FFFFFF; background-repeat: no-repeat; background-attachment: fixed; background-position: center center; background-image: url('sky.jpg');">
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="titleLabel" runat="server" style="font-size: xx-large" Text="首頁標題" ForeColor="White"></asp:Label>
                    <br /><br />
                    <asp:LinkButton ID="homeLinkButton" runat="server" CssClass="auto-style5" PostBackUrl="~/default.aspx" ForeColor="White">首頁</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="recordLinkButton" runat="server" CssClass="auto-style5" PostBackUrl="~/meal.aspx" ForeColor="White">飲食紀錄</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="addingLinkButton" runat="server" CssClass="auto-style5" ForeColor="White" PostBackUrl="~/adding.aspx">新增紀錄</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="addingFoodLinkButton" runat="server" CssClass="auto-style5" ForeColor="White" PostBackUrl="~/addingFood.aspx">新增一餐內的食物</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="directionLinkButton" runat="server" CssClass="auto-style5" ForeColor="White">說明</asp:LinkButton>
                </td>
            </tr>
        </table>
        <div>
            <asp:Label ID="dateLabel" runat="server" Text="選擇日期"></asp:Label>
        </div>
        <asp:Calendar ID="dateCalendar" runat="server" OnSelectionChanged="dateCalendar_SelectionChanged"></asp:Calendar>
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="mealLabel" runat="server" Text="請選擇一餐"></asp:Label>
                </td>
            </tr>
        </table>
            <asp:SqlDataSource ID="mealSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT mealTable.meal_id, mealTable.account, mealTable.date, mealTable.time, SUM(mealFoodTable.calories) AS TC, SUM(mealFoodTable.water) AS total_water, SUM(mealFoodTable.protein) AS total_protein, SUM(mealFoodTable.fat) AS total_fat, SUM(mealFoodTable.saturated_fat) AS total_saturated_fat, SUM(mealFoodTable.ash) AS total_ash, SUM(mealFoodTable.carbonhydrate) AS total_carbonhydrate, SUM(mealFoodTable.dietary_fiber) AS total_dietary_fiber, SUM(mealFoodTable.trans_fat) AS total_trans_fat FROM mealTable INNER JOIN mealFoodTable ON mealTable.meal_id = mealFoodTable.meal_id GROUP BY mealTable.meal_id, mealTable.account, mealTable.date, mealTable.time HAVING (mealTable.account = @account)">
                <SelectParameters>
                    <asp:SessionParameter Name="account" SessionField="account" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:GridView ID="mealGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="meal_id" DataSourceID="mealSqlDataSource" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="date" HeaderText="日期" SortExpression="date" DataFormatString="{0:d}" />
                <asp:BoundField DataField="time" HeaderText="時間" SortExpression="time" />
                <asp:BoundField DataField="TC" DataFormatString="{0:N2}" HeaderText="總熱量(大卡)" SortExpression="TC" ReadOnly="True" />
                <asp:BoundField DataField="total_water" DataFormatString="{0:N2}" HeaderText="水" ReadOnly="True" SortExpression="total_water" />
                <asp:BoundField DataField="total_protein" DataFormatString="{0:N2}" HeaderText="蛋白質" ReadOnly="True" SortExpression="total_protein" />
                <asp:BoundField DataField="total_fat" DataFormatString="{0:N2}" HeaderText="脂肪" ReadOnly="True" SortExpression="total_fat" />
                <asp:BoundField DataField="total_saturated_fat" DataFormatString="{0:N2}" HeaderText="飽和脂肪" ReadOnly="True" SortExpression="total_saturated_fat" />
                <asp:BoundField DataField="total_trans_fat" DataFormatString="{0:N2}" HeaderText="反式脂肪" ReadOnly="True" SortExpression="total_trans_fat" />
                <asp:BoundField DataField="total_carbonhydrate" DataFormatString="{0:N2}" HeaderText="碳水化合物" ReadOnly="True" SortExpression="total_carbonhydrate" />
                <asp:BoundField DataField="total_dietary_fiber" DataFormatString="{0:N2}" HeaderText="膳食纖維" ReadOnly="True" SortExpression="total_dietary_fiber" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="mealFoodLabel" runat="server" Text="您在這一餐中吃了："></asp:Label>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="mealFoodSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT mealFood_id, meal_id, food_name, calories, weight, food_id, water, protein, fat, saturated_fat, ash, carbonhydrate, dietary_fiber, trans_fat FROM mealFoodTable WHERE (meal_id = @meal_id) AND (food_name &lt;&gt; @default )" InsertCommand="INSERT INTO mealFoodTable(meal_id, food_name, calories, weight, food_id, water, protein, fat, saturated_fat, ash, carbonhydrate, dietary_fiber, trans_fat) VALUES (@meal_id, @food_name, @weight * @unit_calorie / 100, @weight, @food_id, @weight * @unit_water / 100, @weight * @unit_protein / 100, @weight * @unit_fat / 100, @weight * @unit_saturated_fat / 100, @weight * @unit_ash / 100, @weight * @unit_carbonhydrate / 100, @weight * @unit_dietary_fiber / 100, @weight * @unit_trans_fat / 100)" DeleteCommand="DELETE FROM mealFoodTable WHERE (mealFood_id = @mealFood_id)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="mealFoodGridView" Name="mealFood_id" PropertyName="SelectedValue" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="mealGridView" Name="meal_id" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="food_name" SessionField="food_name" Type="String" />
                <asp:ControlParameter ControlID="weightTextBox" Name="weight" PropertyName="Text" />
                <asp:SessionParameter Name="unit_calorie" SessionField="calorie" />
                <asp:ControlParameter ControlID="foodDropDownList" Name="food_id" PropertyName="SelectedValue" Type="String" />
                <asp:SessionParameter Name="unit_water" SessionField="water" />
                <asp:SessionParameter Name="unit_protein" SessionField="protein" />
                <asp:SessionParameter Name="unit_fat" SessionField="fat" />
                <asp:SessionParameter Name="unit_saturated_fat" SessionField="saturated_fat" />
                <asp:SessionParameter Name="unit_ash" SessionField="ash" />
                <asp:SessionParameter Name="unit_carbonhydrate" SessionField="carbonhydrate" />
                <asp:SessionParameter Name="unit_dietary_fiber" SessionField="dietary_fiber" />
                <asp:SessionParameter Name="unit_trans_fat" SessionField="trans_fat" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="mealGridView" Name="meal_id" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="default" SessionField="default" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="mealFoodGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="mealFood_id" DataSourceID="mealFoodSqlDataSource" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" AutoGenerateDeleteButton="True" OnRowDeleted="mealFoodGridView_RowDeleted">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="food_name" HeaderText="食物名稱" SortExpression="food_name" />
                <asp:BoundField DataField="weight" HeaderText="重量" SortExpression="weight" />
                <asp:BoundField DataField="calories" DataFormatString="{0:N2}" HeaderText="熱量" SortExpression="calories" />
                <asp:BoundField DataField="water" DataFormatString="{0:N2}" HeaderText="水" SortExpression="water" />
                <asp:BoundField DataField="protein" DataFormatString="{0:N2}" HeaderText="蛋白質" SortExpression="protein" />
                <asp:BoundField DataField="fat" DataFormatString="{0:N2}" HeaderText="脂肪" SortExpression="fat" />
                <asp:BoundField DataField="saturated_fat" DataFormatString="{0:N2}" HeaderText="飽和脂肪" SortExpression="saturated_fat" />
                <asp:BoundField DataField="trans_fat" DataFormatString="{0:N2}" HeaderText="反式脂肪" SortExpression="trans_fat" />
                <asp:BoundField DataField="carbonhydrate" DataFormatString="{0:N2}" HeaderText="碳水化合物" SortExpression="carbonhydrate" />
                <asp:BoundField DataField="dietary_fiber" DataFormatString="{0:N2}" HeaderText="膳食纖維" SortExpression="dietary_fiber" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="typeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [typeTable]"></asp:SqlDataSource>
        <asp:Label ID="typeLabel" runat="server" Text="請選擇食物類別"></asp:Label>
        <asp:DropDownList ID="typeDropDownList" runat="server" AutoPostBack="True" DataSourceID="typeSqlDataSource" DataTextField="type" DataValueField="type" OnSelectedIndexChanged="typeDropDownList_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Label ID="foodLabel" runat="server" Text="請選擇食物"></asp:Label>
        <asp:DropDownList ID="foodDropDownList" runat="server" DataSourceID="foodSqlDataSource" DataTextField="name" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="foodDropDownList_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Label ID="inputWeightLabel" runat="server" Text="請輸入重量(公克)"></asp:Label>
        <asp:TextBox ID="weightTextBox" runat="server" TextMode="Number"></asp:TextBox>
        <asp:Button ID="addingButton" runat="server" OnClick="addingButton_Click" Text="新增" />
        <asp:SqlDataSource ID="foodSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT id, type, name, detail, common_name, calorie, water, protein, fat, saturated_fat, ash, carbonhydrate, dietary_fiber FROM nutrientTable WHERE (type = @type)">
            <SelectParameters>
                <asp:ControlParameter ControlID="typeDropDownList" Name="type" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="nutrientLabel" runat="server" Text="每100g含有營養："></asp:Label>
                </td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="nutrientSqlDataSource" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="name" HeaderText="食物名稱" SortExpression="name" />
                <asp:BoundField DataField="calorie" HeaderText="熱量" SortExpression="calorie" />
                <asp:BoundField DataField="water" HeaderText="水" SortExpression="water" />
                <asp:BoundField DataField="protein" HeaderText="蛋白質" SortExpression="protein" />
                <asp:BoundField DataField="fat" HeaderText="脂肪" SortExpression="fat" />
                <asp:BoundField DataField="saturated_fat" HeaderText="飽和脂肪" SortExpression="saturated_fat" />
                <asp:BoundField DataField="trans_fat" HeaderText="反式脂肪" SortExpression="trans_fat" />
                <asp:BoundField DataField="carbonhydrate" HeaderText="碳水化合物" SortExpression="carbonhydrate" />
                <asp:BoundField DataField="dietary_fiber" HeaderText="膳食纖維" SortExpression="dietary_fiber" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:DetailsView ID="nutrientDetailsView" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" DataSourceID="nutrientSqlDataSource" ForeColor="#333333" GridLines="None" Height="50px" Visible="False" Width="125px" EmptyDataText="empty">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="calorie" HeaderText="calorie" SortExpression="calorie" />
                <asp:BoundField DataField="water" HeaderText="water" SortExpression="water" />
                <asp:BoundField DataField="protein" HeaderText="protein" SortExpression="protein" />
                <asp:BoundField DataField="fat" HeaderText="fat" SortExpression="fat" />
                <asp:BoundField DataField="saturated_fat" HeaderText="saturated_fat" SortExpression="saturated_fat" />
                <asp:BoundField DataField="trans_fat" HeaderText="trans_fat" SortExpression="trans_fat" />
                <asp:BoundField DataField="ash" HeaderText="ash" SortExpression="ash" />
                <asp:BoundField DataField="carbonhydrate" HeaderText="carbonhydrate" SortExpression="carbonhydrate" />
                <asp:BoundField DataField="dietary_fiber" HeaderText="dietary_fiber" SortExpression="dietary_fiber" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="nutrientSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT id, name, calorie, water, protein, fat, saturated_fat, ash, carbonhydrate, dietary_fiber, trans_fat FROM nutrientTable WHERE (id = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="foodDropDownList" Name="id" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" Visible="False">
            <asp:ListItem Value="穀物類"></asp:ListItem>
            <asp:ListItem Value="澱粉類"></asp:ListItem>
            <asp:ListItem Value="堅果及種子類"></asp:ListItem>
            <asp:ListItem Value="水果類"></asp:ListItem>
            <asp:ListItem Value="蔬菜類"></asp:ListItem>
            <asp:ListItem Value="藻類"></asp:ListItem>
            <asp:ListItem Value="菇類"></asp:ListItem>
            <asp:ListItem Value="豆類"></asp:ListItem>
            <asp:ListItem Value="肉類"></asp:ListItem>
            <asp:ListItem Value="魚貝類"></asp:ListItem>
            <asp:ListItem Value="蛋類"></asp:ListItem>
            <asp:ListItem Value="乳品類"></asp:ListItem>
            <asp:ListItem Value="油脂類"></asp:ListItem>
            <asp:ListItem Value="糖類"></asp:ListItem>
            <asp:ListItem Value="飲料類"></asp:ListItem>
            <asp:ListItem Value="調味料及香辛料類"></asp:ListItem>
            <asp:ListItem Value="糕餅點心類"></asp:ListItem>
            <asp:ListItem Value="加工調理食品及其他類"></asp:ListItem>
        </asp:DropDownList>
    </form>
</body>
</html>
