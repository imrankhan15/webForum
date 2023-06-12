<%@ Page Title="Forum Listing" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Which forum would you like to visit?</h3>
    <table border=0> 
    <asp:Repeater ID="ForumRepeater" runat="Server"
    OnItemDataBound="ForumRepeater_ItemDataBound" >
    <ItemTemplate> 
    <tr bgcolor="Gainsboro">
    <td>
    <asp:Label ID="lblForumName"
    runat="Server"
    Text='<% #Eval("name") %>' />
    </td>
    </tr>
    <asp:Repeater ID="TopicRepeater"
    runat="Server" >
    <ItemTemplate> 
    <tr><td>
    <asp:LinkButton ID="linkTopicName" 
    runat="Server"
    Text='<% #Eval("name")%>'
    PostBackUrl='<% #Eval("topicid",
    "Threads.aspx?topic={0}")%>'/>
    --
    <asp:Label ID="lblTopicDescr" 
    runat="Server"
    Text='<% #Eval("description")%>' />
    </td></tr>
    </ItemTemplate> 
    </asp:Repeater>
    </ItemTemplate> 
    </asp:Repeater> 
    </table>
</asp:Content>

