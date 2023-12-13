<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adding.aspx.cs" Inherits="資料庫專題.adding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新增飲食紀錄</title>
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
            text-align: left;
        }
        .auto-style7 {
            font-size: large;
        }
    </style>
    <script type="text/javascript" src="http://jsearchdropdown.sourceforge.net/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="http://jsearchdropdown.sourceforge.net//jquery.searchabledropdown.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#DropDownList1').searchable();
        });
    </script>
</head>
<body>
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
        <div style="margin: 0 auto;">
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Label ID="addingMealLabel" runat="server" CssClass="auto-style7" Text="新增一餐" ForeColor="Black"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="日期"></asp:Label>
                        <asp:Calendar ID="dateCalendar" runat="server" HorizontalAlign="Center">
                        </asp:Calendar>
                        <input id="timeInput" type="time" asp-for="eatingTime" name="timeInput" runat="server" /><asp:Button ID="insertButton" runat="server" OnClick="insertButton_Click" Text="按此新增一餐" />
                        <asp:SqlDataSource ID="mealTableSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO mealTable(account, date, time) VALUES (@account, @date, @time)" SelectCommand="SELECT [meal_id] FROM [mealTable] WHERE (([date] = @date) AND ([account] = @account) AND ([time] = @time))">
                            <InsertParameters>
                                <asp:SessionParameter Name="account" SessionField="account" />
                                <asp:ControlParameter ControlID="dateCalendar" Name="date" PropertyName="SelectedDate" />
                                <asp:ControlParameter ControlID="timeLabel" Name="time" PropertyName="Text" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="dateCalendar" DbType="Date" Name="date" PropertyName="SelectedDate" />
                                <asp:SessionParameter Name="account" SessionField="account" Type="String" />
                                <asp:ControlParameter ControlID="timeLabel" DbType="Time" Name="time" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DetailsView ID="mealIDDetailsView" runat="server" AutoGenerateRows="False" DataKeyNames="meal_id" DataSourceID="mealTableSqlDataSource" Height="50px" Visible="False" Width="125px">
                            <Fields>
                                <asp:BoundField DataField="meal_id" HeaderText="meal_id" InsertVisible="False" ReadOnly="True" SortExpression="meal_id" />
                            </Fields>
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="mealFoodTableSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO mealFoodTable(meal_id, food_name, calories, weight, food_id) VALUES (@meal_id, N'default', 0, 0, 0)" SelectCommand="SELECT * FROM [mealFoodTable]">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="mealIDDetailsView" Name="meal_id" PropertyName="SelectedValue" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:Label ID="timeLabel" runat="server" Visible="False"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style6">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="nutrientTableSqlDataSource" DataTextField="name" DataValueField="name">
            </asp:DropDownList>
            &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    <script></script>
        <div style="width: 100%; margin: 0 auto; align-items:center">             
        </div>   
        <asp:SqlDataSource ID="nutrientTableSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [nutrientTable]"></asp:SqlDataSource>
        <asp:DetailsView ID="foodDetailsView" runat="server" DataSourceID="nutrientTableSqlDataSource" Height="50px" Visible="False" Width="125px">
        </asp:DetailsView>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <label>請問你使用什麼瀏覽器:
        <input list="nameDataList" name="food"></label>
        <asp:DataList id="nameDataList" runat="server">
        </asp:DataList>
    </form>
    </body>
</html>
