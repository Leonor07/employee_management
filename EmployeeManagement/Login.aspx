<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EmployeeManagement.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link href="loginStyle.css" rel="stylesheet" />
</head>

<body>
  <header>
    <img src="images/BC-logo.png" id="logo" alt="BC Logo" />
    <img src="images/BC-slogan.jpg" id="slogan" alt="BC Slogan" />
    Employee Management System
  </header>
  <asp:Label ID="NameLbl" runat="server" Visible="False"></asp:Label>
  <form id="form" runat="server">
    <div class="container">
      <asp:Label ID="supervisor" runat="server" Text="Label">Supervisor Login</asp:Label>
      <div class="username">
        <asp:Label class="left" runat="server" Text="User Name"></asp:Label>
      <asp:TextBox class="right" ID="UsernameTxt" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
      </div>
      <div class="password">
        <asp:Label class="left" runat="server" Text="Password"></asp:Label>
        <asp:TextBox class="right" ID="PasswordTxt" TextMode="Password" runat="server"></asp:TextBox>
      </div>
      <div id="center">
      <asp:Button ID="LoginBtn" runat="server" Text="Login" OnClick="LoginBtn_Click"/>
      </div>
      <asp:Label ID="loginError" runat="server" Text="Incorrect User Credentials" ></asp:Label>
    </div>
  </form>
</body>
</html>

