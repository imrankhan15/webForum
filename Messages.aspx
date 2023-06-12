<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" 
    DataSourceID="SqlDataSource1">
    <ItemTemplate>
    <h3>
    Topic:
    <asp:Label ID="topicNameLabel"
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
    <asp:Label ID="threadNameLabel"
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
        <asp:Parameter Name="threadid" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False"
    DataSourceID="SqlDataSource3"
    ShowHeader="False"
    AllowPaging="True" >
    <Columns>
    <asp:TemplateField> 
    <ItemTemplate>
    At
    <asp:Label ID="Label1" runat="server"
    Text='<% #Eval("date") %>' />
    <asp:Label ID="Label2" runat="server"
    Text='<% #Eval("author") %>' />
    wrote:
    <br /><br />
    <table border=0>
    <tr><td width=300>
    <asp:Label ID="Label3" runat="server"
    Text='<% #Eval("message") %>' />
    </td></tr></table>
    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" 
    runat="server"
    ConnectionString
    ="<%$ ConnectionStrings:ForumConnectionString %>"
    SelectCommand="SELECT [author], [date], [message]
    FROM [Messages]
    WHERE ([threadid] = @threadid)
    ORDER BY [date]">
    <SelectParameters>
    <asp:QueryStringParameter 
    Name="threadid"
    QueryStringField="thread" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource><br />
    <asp:Button ID="btnAdd" runat="server" 
    Text="Add a Reply to this Thread"
    OnClick="btnAdd_Click" />
    <br /><br />
    <asp:LinkButton ID="btnReturn" 
    runat="server"
    Text="Return to Threads page"
    OnClick="btnReturn_Click" />


</asp:Content>

