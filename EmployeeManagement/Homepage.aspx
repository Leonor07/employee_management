<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="EmployeeManagement.Homepage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="homepageStyle.css" rel="stylesheet"/>
</head>
<body>
  <form id="form" runat="server">
  <header id="main">
      <img src="images/BC-logo.png" id="logo" alt="BC Logo" />
      <h1>Supervisor Home Page</h1>
      <h1 id="welcome">Welcome</h1>
      <asp:Label ID="UsernameLbl" runat="server" Text=""></asp:Label>
  </header>
  
  <nav class="navigation">
    <div id="view" class="container">
      <asp:Button class="button" ID="AppraisalPage" runat="server" Text="View All Appraisals"/>
    </div>
    <div id="logout" class="container">
      <asp:Button class="button" ID="LogoutBtn" runat="server"  Text="Logout"/>
    </div>
  </nav>
  <asp:Label ID="SupervisorNameLbl" runat="server" Text=""></asp:Label>
  <div style="height:50px;">
      <h2>Employee List</h2>
  </div>
  <div style="height:50px;">
      <h3>* Select Employee to Add a New Appraisal</h3>
  </div>
  <div id = "dvGrid" style = "width:100%">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
          <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnPageIndexChanging="OnPageIndexChanging" OnSorting="OnSorting" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
            <Columns>
            <asp:TemplateField>
              <ItemTemplate>
                <asp:Button ID="Select" runat="server" HeaderText ="Employee Appraisals" Text="Select"
                  CommandArgument="SelectBtn" />
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>  
              <ItemTemplate>  
                <asp:Button ID="editBtn" runat="server" Text="Edit Classification" CommandName="Edit" />  
              </ItemTemplate>  
              <EditItemTemplate>  
                <asp:Button ID="updateBtn" runat="server" Text="Update" CommandName="Update"/>  
                <asp:Button ID="cancelBtn" runat="server" Text="Cancel" CommandName="Cancel"/>  
              </EditItemTemplate>  
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="Employee ID">  
              <ItemTemplate>  
                <asp:Label ID="lbl_ID" DataField="EmployeeID" runat="server" SortExpression="EmployeeID" Text='<%# Eval("EmployeeID") %>'></asp:Label>  
              </ItemTemplate>  
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>  
                  <asp:Label ID="Name" DataField="Name" runat="server" SortExpression="Name" Text='<%# Eval("Name") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Title">
                <ItemTemplate>  
                  <asp:Label ID="Title" DataField="Title" runat="server" SortExpression="Title" Text='<%# Eval("Title") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Department">
                <ItemTemplate>  
                    <asp:Label ID="Department" DataField="Department" runat="server" SortExpression="Department" Text='<%# Eval("Department") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Classification">  
                <ItemTemplate>  
                    <asp:Label ID="lbl_Classification" runat="server" CommandName="Classification" SortExpression="Classification" Text='<%# Eval("Classification") %>'></asp:Label>  
                </ItemTemplate>  
                <EditItemTemplate>  
                    <asp:DropDownList ID="drop_Classification" runat="server" Text='<%# Eval("Classification") %>' Width="100%" Height="25px" style="font-weight:bold">
                    <asp:ListItem Text="Select Classification" Value="Select" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Administrative" Value="Administrative"></asp:ListItem>
                    <asp:ListItem Text="Classified" Value="Classified"></asp:ListItem>
                    <asp:ListItem Text="Faculty" Value="Faculty"></asp:ListItem>
                    <asp:ListItem Text="Part-time Faculty" Value="Part-Time Faculty"></asp:ListItem>
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>  
              </asp:TemplateField>  
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#8CB7C7" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#8CB7C7" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" Font-Size="19px" Font-Italic="True" />
            <PagerStyle BackColor="#8CB7C7" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="lightgray" ForeColor="#333333" CssClass="gridRows" />
            <SelectedRowStyle BackColor="#f2f2f2" ForeColor="#333333" CssClass="gridRows" />
            <SortedAscendingCellStyle BackColor="White" />
            <SortedAscendingHeaderStyle BackColor="Black" />
            <SortedDescendingCellStyle BackColor="#cccccc" />
            <SortedDescendingHeaderStyle BackColor="#666666" />
          </asp:GridView>
            
        </ContentTemplate>
      </asp:UpdatePanel>
    </div>
      </form>
</body>
</html>
