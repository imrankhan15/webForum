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

public partial class NewThread : System.Web.UI.Page
{
    protected void btnPost_Click(object sender, EventArgs e)
    {
        string cs = WebConfigurationManager
        .ConnectionStrings["ForumConnectionString"]
        .ConnectionString;
        string insertThread = "INSERT Threads "
        + "(topicid, subject, replies, "
        + "author, lastpostdate)"
        + "VALUES(@topicid, @subject, @replies, "
        + "@author, @lastpostdate)";
        string getThreadID = "SELECT @@IDENTITY";
        string insertMessage = "INSERT Messages "
        + "(threadid, author, date, message) "
        + "VALUES(@threadid, @author, @date, @message)";
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand(insertThread,
        con);
        // insert the thread
        cmd.Parameters.AddWithValue("topicid",
        Request.QueryString["topic"]);
        cmd.Parameters.AddWithValue("subject",
        txtSubject.Text);
        cmd.Parameters.AddWithValue("replies", 0);
        cmd.Parameters.AddWithValue("author",
        txtEmail.Text);
        cmd.Parameters.AddWithValue("lastpostdate",
        DateTime.Now);
        con.Open();
        cmd.ExecuteNonQuery();
        // get the thread ID 
        cmd.CommandText = getThreadID;
        string threadid = cmd.ExecuteScalar().ToString();
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
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Messages.aspx?topic="
        + Request.QueryString["topic"]
        + "&thread=" + threadid);
    }
     protected void btnCancel_Click(
     object sender, EventArgs e)
     {
        Response.Redirect("Threads.aspx?topic="
        + Request.QueryString["topic"]);
     }

}