<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewThread.aspx.cs" Inherits="NewThread" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" 
    DataSourceID="SqlDataSource1">
    <ItemTemplate>
    <h3>
    New Thread for Topic:&nbsp;
    <asp:Label ID="nameLabel" runat="server"
    Text='<%# Bind("name") %>' />
    </h3>
    </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" 
    runat="server"
    ConnectionString
    ="<%$ ConnectionStrings:ForumConnectionString %>"
    SelectCommand="SELECT [name], [description]
    FROM [Topics]
    WHERE ([topicid] = @topicid)">
    <SelectParameters>
    <asp:QueryStringParameter 
    Name="topicid"
    QueryStringField="topic"
    Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    <table border=0>
    <tr><td Width="125">
    Your email address:
    </td><td width="300" valign="top">
    <asp:TextBox ID="txtEmail" runat="server" 
    Width="300px" />
    <asp:RequiredFieldValidator
    ID="RequiredFieldValidator1"
    runat="server"
    ControlToValidate="txtEmail"
    ErrorMessage="Required." />
    </td></tr>
    <tr><td Width="125">
    Subject:
    </td><td width="300" valign="top">
    <asp:TextBox ID="txtSubject" runat="server" 
    Width="300px" />
    <asp:RequiredFieldValidator
    ID="RequiredFieldValidator2"
    runat="server"
    ControlToValidate="txtMessage"
    ErrorMessage="Required." />
    </td></tr>
    <tr><td width="125" valign="top">
    Message:
    </td><td width="300">
    <asp:TextBox ID="txtMessage" runat="server" 
    TextMode="MultiLine"
    Width="300px" Height="300px"/>
    <asp:RequiredFieldValidator
    ID="RequiredFieldValidator3"
    runat="server"
    ControlToValidate="txtSubject"
    ErrorMessage="Required." />
    </td></tr>
    </table>
    <asp:Button ID="btnPost" runat="server" 
    OnClick="btnPost_Click"
    Text="Post Message" />&nbsp;
    <asp:Button ID="btnCancel" runat="server" 
    OnClick="btnCancel_Click" Text="Cancel" />

</asp:Content>

