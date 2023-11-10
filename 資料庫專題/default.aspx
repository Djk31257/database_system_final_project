﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="資料庫專題._default" %>

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
    </style>
</head>
<body style="background-image: url('sky.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-position: center center">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">
                        <asp:Label ID="titleLB" runat="server" style="font-size: xx-large" Text="首頁標題"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2" style="text-align: center">
                        <asp:Label ID="accountLabel" runat="server" style="font-size: large" Text="請輸入帳號"></asp:Label>
                        <asp:TextBox ID="accountTextBox" runat="server" style="font-size: large"></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">
                        <asp:Label ID="passwordLabel" runat="server" style="font-size: large" Text="請輸入密碼"></asp:Label>
                        <asp:TextBox ID="passwordTextBox" runat="server" style="font-size: large" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">
                        <asp:Button ID="loginButton" runat="server" CssClass="auto-style3" Text="登入" OnClick="loginButton_Click" />
                        <!--不換行空格  &nbsp;-->
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="signupButton" runat="server" CssClass="auto-style3" Text="註冊" PostBackUrl="~/signup.aspx" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: center">
                        <asp:Label ID="errorLabel" runat="server" CssClass="auto-style3" Text="帳號或密碼錯誤"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="userAccountSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT account, password FROM userAccountTable WHERE (account = @account) AND (password = @password)">
            <SelectParameters>
                <asp:ControlParameter ControlID="accountTextBox" Name="account" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="passwordTextBox" Name="password" PropertyName="Text" Type="String" />
            </SelectParameters>
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
