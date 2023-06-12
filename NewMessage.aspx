<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewMessage.aspx.cs" Inherits="NewMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:FormView ID="FormView1" runat="server" 
        DataSourceID="SqlDataSource1">
        <ItemTemplate>
        <h3>
        Reply To Topic:
        <asp:Label ID="nameLabel"
        runat="server"
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
        <asp:FormView ID="FormView2" runat="server" 
        DataSourceID="SqlDataSource2">
        <ItemTemplate>
        <h3>
        Thread:
        <asp:Label ID="subjectLabel"
        runat="server"
        Text='<%# Bind("subject") %>' />
        </h3>
        </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" 
        runat="server"
        ConnectionString
        ="<%$ ConnectionStrings:ForumConnectionString %>"
        SelectCommand="SELECT [subject]
        FROM [Threads]
        WHERE ([threadid] = @threadid)">
        <SelectParameters> 
        <asp:QueryStringParameter
        Name="threadid"
        QueryStringField="thread"
        Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
        <table border=0>
        <tr><td Width="125" valign="top">
        Your email address:
        </td><td width="300">
        <asp:TextBox ID="txtEmail" runat="server" 
        Width="300px" />
        <asp:RequiredFieldValidator
        ID="RequiredFieldValidator1"
        runat="Server"
        ControlToValidate="txtEmail"
        ErrorMessage="Required." />
        </td></tr>
        <tr><td width="125" valign="top">
        Message:
        </td><td width="300">
        <asp:TextBox ID="txtMessage" 
        runat="server"
        TextMode="MultiLine"
        Width="300px" Height="300px"/>
        <asp:RequiredFieldValidator
        ID="RequiredFieldValidator2"
        runat="Server"
        ControlToValidate="txtMessage"
        ErrorMessage="Required." />
        </td></tr>
        </table>
        <asp:Button ID="btnPost" runat="server"
        OnClick="btnPost_Click"
        Text="Post Reply" />&nbsp;
        <asp:Button ID="btnCancel" runat="server" 
        OnClick="btnCancel_Click"
        Text="Cancel" />

</asp:Content>

