<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="meal.aspx.cs" Inherits="資料庫專題.meal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>飲食紀錄</title>
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
        .auto-style7 {
            font-size: large;
        }
        </style>
</head>
<body style="background-image: url('sky.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-position: center center">
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
                    <asp:LinkButton ID="directionLinkButton" runat="server" CssClass="auto-style5" ForeColor="White">說明</asp:LinkButton>
                </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style1">
                    <asp:Calendar ID="dateCalendar" runat="server" OnSelectionChanged="dateCalendar_SelectionChanged"></asp:Calendar>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        <asp:SqlDataSource ID="mealSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT mealTable.meal_id, mealTable.account, mealTable.date, mealTable.time, SUM(mealFoodTable.calories) AS TC FROM mealTable INNER JOIN mealFoodTable ON mealTable.meal_id = mealFoodTable.meal_id GROUP BY mealTable.meal_id, mealTable.account, mealTable.date, mealTable.time HAVING (mealTable.account = @account)">
            <SelectParameters>
                <asp:SessionParameter Name="account" SessionField="account" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:GridView ID="mealGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="meal_id" DataSourceID="mealSqlDataSource" HorizontalAlign="Center" CssClass="auto-style7" OnSelectedIndexChanged="mealGridView_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" Height="161px" Width="450px" AllowPaging="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="date" HeaderText="日期" SortExpression="date" DataFormatString="{0:d}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="time" HeaderText="時間" SortExpression="time" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="TC" HeaderText="總熱量(大卡)" ReadOnly="True" SortExpression="TC" ItemStyle-HorizontalAlign="Right" >
<ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
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
            <br /><br /><br /><br /><br /><br />
        <asp:SqlDataSource ID="mealFoodSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT mealFood_id, meal_id, food_name, calories FROM mealFoodTable WHERE (meal_id = @meal_id) AND (food_name &lt;&gt; @default )" DeleteCommand="DELETE FROM mealFoodTable WHERE (mealFood_id = @mealFood_id)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="mealFoodGridView" Name="mealFood_id" PropertyName="SelectedDataKey" Type="Int64" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="mealGridView" Name="meal_id" PropertyName="SelectedValue" Type="Int64" />
                <asp:SessionParameter Name="default" SessionField="default" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="mealFoodGridView" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="mealFood_id" DataSourceID="mealFoodSqlDataSource" ForeColor="#333333" GridLines="None" Height="161px" Width="450px" AutoGenerateDeleteButton="True" OnRowDeleted="mealFoodGridView_RowDeleted">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="food_name" HeaderText="食物名稱" SortExpression="food_name" />
                    <asp:BoundField DataField="calories" HeaderText="熱量(大卡)" SortExpression="calories" ItemStyle-HorizontalAlign="Right" />
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
        </div>
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
