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

public partial class Threads : System.Web.UI.Page
{
    protected void LinkButton1_Click(object sender,EventArgs e)
    {
    Response.Redirect("NewThread.aspx?topic="
    + Request.QueryString["topic"]);
    }
    protected void GridView1_SelectedIndexChanged( 
    object sender, EventArgs e)
    {
    string threadid
    = GridView1.SelectedValue.ToString();
    string topicid = Request.QueryString["topic"];
    Response.Redirect("Messages.aspx?topic=" + topicid
    + "&thread=" + threadid);
    }
}