<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="資料庫專題.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>飲食紀錄平台</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style9 {
            text-align: center;
        }
        .auto-style10 {
            font-size: x-large;
        }
    </style>
</head>
<body style="background-image: url('https://localhost:44362/sky.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-position: center center">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="titleLB" runat="server" style="font-size: xx-large" Text="註冊"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="emailLabel" runat="server" CssClass="auto-style3" Text="電子信箱"></asp:Label>
                        &nbsp&nbsp&nbsp&nbsp
                        <asp:TextBox ID="emailTextBox" runat="server" CssClass="auto-style3"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="accountLabel" runat="server" style="font-size: large" Text="請輸入帳號"></asp:Label>
                        <asp:TextBox ID="accountTextBox" runat="server" style="font-size: large"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="passwordLabel" runat="server" style="font-size: large" Text="請輸入密碼"></asp:Label>
                        <asp:TextBox ID="passwordTextBox" runat="server" style="font-size: large" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="passwordConfirmLabel" runat="server" CssClass="auto-style3" Text="請確認密碼"></asp:Label>
                        <asp:TextBox ID="passwordConfirmTextBox" runat="server" CssClass="auto-style3" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                </table>
        </div>
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style9">
                        <asp:Button ID="signupButton" runat="server" CssClass="auto-style3" Text="註冊" OnClick="signupButton_Click" />
                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style9">
                    <asp:Label ID="errorLabel" runat="server" CssClass="auto-style10" Text="errorMessage"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style9">
                    <asp:Button ID="returnToLoginButton" runat="server" CssClass="auto-style3" PostBackUrl="~/default.aspx" Text="返回登入頁面" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:SqlDataSource ID="signupSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO userAccountTable(account, password, email) VALUES (@account, @password, @email)" SelectCommand="SELECT account, password, email FROM userAccountTable WHERE (account = @account) AND (password = @password)">
            <InsertParameters>
                <asp:SessionParameter Name="account" SessionField="account" />
                <asp:SessionParameter Name="password" SessionField="password" />
                <asp:SessionParameter DefaultValue="" Name="email" SessionField="email" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="accountTextBox" Name="account" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="passwordTextBox" Name="password" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="userAccountDetailsView" runat="server" AutoGenerateRows="False" DataKeyNames="account,password,email" DataSourceID="signupSqlDataSource" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="account" HeaderText="account" ReadOnly="True" SortExpression="account" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            </Fields>
        </asp:DetailsView>
    </form>
</body>
</html>
