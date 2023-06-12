using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration; 
using System.Data.SqlClient;

public partial class NewMessage : System.Web.UI.Page
{
    protected void btnPost_Click( 
    object sender, EventArgs e)
    {
    // set up the data objects 
    string cs = WebConfigurationManager
    .ConnectionStrings["ForumConnectionString"]
    .ConnectionString;
    string insertMessage = "INSERT Messages "
    + "(threadid, author, date, message) "
    + "VALUES(@threadid, @author, @date, @message);"
    + "UPDATE Threads "
    + "SET replies = replies + 1"
    + "WHERE threadid = @threadid";
    SqlConnection con = new SqlConnection(cs);
    SqlCommand cmd
    = new SqlCommand(insertMessage, con);
    // get the query strings 
    string threadid = Request.QueryString["thread"];
    string topicid = Request.QueryString["topic"];
    // insert the message 
    cmd.CommandText = insertMessage;
        cmd.Parameters.Clear();
    cmd.Parameters.AddWithValue("threadid",
    threadid);
    cmd.Parameters.AddWithValue("author",
    txtEmail.Text);
    cmd.Parameters.AddWithValue("date",
    DateTime.Now);
    cmd.Parameters.AddWithValue("message",
    txtMessage.Text);
    con.Open();
    cmd.ExecuteNonQuery();
    con.Close();
    Response.Redirect("Messages.aspx?topic=" 
    + topicid + "&thread=" + threadid);
    }
    protected void btnCancel_Click(
    object sender, EventArgs e)
    {
    Response.Redirect("Messages.aspx?topic="
    + Request.QueryString["topic"]
    + "&thread="
    + Request.QueryString["thread"]);
    }
}