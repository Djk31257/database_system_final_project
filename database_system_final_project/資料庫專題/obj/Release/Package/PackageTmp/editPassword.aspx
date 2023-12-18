<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editPassword.aspx.cs" Inherits="資料庫專題.editPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>飲食紀錄平台</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 32px;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            text-align: right;
            height: 36px;
        }
        .auto-style5 {
            font-size: xx-large;
        }
        .auto-style6 {
            height: 36px;
        }
        .auto-style7 {
            width: 52px;
        }
        .auto-style8 {
            height: 36px;
            width: 52px;
        }
        .auto-style9 {
            height: 32px;
            width: 52px;
        }
        .auto-style10 {
            text-align: center;
            background-color: #333333;
        }
        </style>
</head>
<body style="background-image: url('sky.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-position: center center">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="titleLB" runat="server" style="font-size: xx-large" Text="修改密碼" ForeColor="White"></asp:Label>
                        <br /><br />
                        <asp:LinkButton ID="homeLinkButton" runat="server" CssClass="auto-style5" PostBackUrl="~/default.aspx" ForeColor="White">首頁</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="recordLinkButton" runat="server" CssClass="auto-style5" PostBackUrl="~/meal.aspx" ForeColor="White">飲食紀錄</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="addingLinkButton" runat="server" CssClass="auto-style5" ForeColor="White" PostBackUrl="~/adding.aspx">新增紀錄</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="addingFoodLinkButton" runat="server" CssClass="auto-style5" ForeColor="White" PostBackUrl="~/addingFood.aspx">新增一餐內的食物</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="editPasswordLinkButton" runat="server" CssClass="auto-style5" ForeColor="White" PostBackUrl="~/editPassword.aspx">修改密碼</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="directionLinkButton" runat="server" CssClass="auto-style5" ForeColor="White">說明</asp:LinkButton>
                    </td>
                </tr>
                </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8"></td>
                    <td class="auto-style4">
                        &nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;
                        </td>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">
                        <asp:Label ID="accountLabel" runat="server" style="font-size: large" Text="顯示已登入的帳號"></asp:Label>
                        </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9"></td>
                    <td class="auto-style2" style="text-align: center">
                        <asp:Label ID="passwordLabel" runat="server" style="font-size: large" Text="請輸入新密碼"></asp:Label>
                        <asp:TextBox ID="newPasswordTextBox" runat="server" style="font-size: large" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">
                        <asp:Label ID="passwordLabel0" runat="server" style="font-size: large" Text="再輸入新密碼"></asp:Label>
                        <asp:TextBox ID="newPasswordTextBox0" runat="server" style="font-size: large" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">
                        <asp:Button ID="editButton" runat="server" CssClass="auto-style3" Text="修改" OnClick="editButton_Click" />
                        <!--不換行空格  &nbsp;-->
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td style="text-align: center">
                        <asp:Label ID="errorLabel" runat="server" CssClass="auto-style3" Text="帳號或密碼錯誤" Visible="False"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="userAccountSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT account, password FROM userAccountTable WHERE (account = @account)" UpdateCommand="UPDATE userAccountTable SET password = @password WHERE (account = @account)">
            <SelectParameters>
                <asp:SessionParameter Name="account" SessionField="account" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="newPasswordTextBox" Name="password" PropertyName="Text" />
                <asp:SessionParameter Name="account" SessionField="account" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="userAccountDetailsView" runat="server" AutoGenerateRows="False" DataKeyNames="account" DataSourceID="userAccountSqlDataSource" Height="50px" Visible="False" Width="125px">
            <Fields>
                <asp:BoundField DataField="account" HeaderText="account" ReadOnly="True" SortExpression="account" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            </Fields>
        </asp:DetailsView>
    </form>
</body>
</html>
