<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Threads.aspx.cs" Inherits="Threads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" 
    DataSourceID="SqlDataSource1">
    <ItemTemplate>
    <h2>
    <asp:Label ID="nameLabel" runat="server"
    Text='<%# Bind("name") %>'/>
    </h2>
    <h3>
    <asp:Label ID="descriptionLabel"
    runat="server"
    Text='<%# Bind("description") %>'/>
    </h3>
    </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" 
    runat="server"
    ConnectionString="<%$ ConnectionStrings:ForumConnectionString %>"
    SelectCommand="SELECT [name], [description]
    FROM [Topics] WHERE ([topicid] = @topicid)">
    <SelectParameters>
    <asp:QueryStringParameter 
    Name="topicid"
    QueryStringField="topic"
    Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False"
    DataSourceID="SqlDataSource2"
    DataKeyNames="threadid"
    AllowPaging="True"
    PageSize="15"
    PagerSettings-Mode="NumericFirstLast"
    OnSelectedIndexChanged
    ="GridView1_SelectedIndexChanged">
    <Columns>
    <asp:ButtonField 
    CommandName="Select"
    DataTextField="subject"
    HeaderText="Subject"
    Text="Button">
    <ItemStyle HorizontalAlign="Left"
    Width="250px" />
    <HeaderStyle HorizontalAlign="Left" />
    </asp:ButtonField>
    <asp:BoundField
    DataField="author"
    HeaderText="Author" >
    <HeaderStyle HorizontalAlign="Left" />
    <ItemStyle Width="100px" />
    </asp:BoundField>
    <asp:BoundField 
    DataField="replies"
    HeaderText="Replies" >
    <HeaderStyle HorizontalAlign="Center" />
    <ItemStyle HorizontalAlign="Center"
    Width="70px" />
    </asp:BoundField>
    <asp:BoundField 
    DataField="lastpostdate"
    HeaderText="Last Post"
    DataFormatString="{0:d}" >
    <HeaderStyle HorizontalAlign="Center" />
    <ItemStyle Width="70px" />
    </asp:BoundField>
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" 
    runat="server"
    ConnectionString="<%$ ConnectionStrings:ForumConnectionString %>"
    SelectCommand="SELECT [threadid], [topicid],
    [subject], [replies], [author], [lastpostdate]
    FROM [Threads]
    WHERE ([topicid] = @topicid)
    ORDER BY [lastpostdate]">
    <SelectParameters>
    <asp:QueryStringParameter 
    Name="topicid"
    QueryStringField="topic"
    Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:LinkButton ID="LinkButton1" 
    runat="server"
    Text="Start a New Thread"
    OnClick="LinkButton1_Click" />
    <br /><br />
    <asp:LinkButton ID="btnReturn" 
    runat="server"
    PostBackUrl="~/Default.aspx"
    Text="Return to Forum Page" />

</asp:Content>

