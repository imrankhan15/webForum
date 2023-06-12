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

public partial class Messages : System.Web.UI.Page
{
    protected void btnAdd_Click(object sender, 
    EventArgs e)
    {
    string topicid = Request.QueryString["topic"];
    string threadid = Request.QueryString["thread"];
    Response.Redirect("NewMessage.aspx?topic="
    + topicid + "&thread=" + threadid);
    }
    protected void btnReturn_Click(object sender,
    EventArgs e)
    {
    Response.Redirect("Threads.aspx?topic="
    + Request.QueryString["topic"]);
    }
}