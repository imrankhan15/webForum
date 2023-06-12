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

public partial class _Default : System.Web.UI.Page
{
    DataSet ds; 
    protected void Page_Load(object sender, EventArgs e)
    {
        string con = WebConfigurationManager 
        .ConnectionStrings["ForumConnectionString"]
        .ConnectionString;
        ds = new DataSet(); 
        // fill the Forums table
        string sel = "SELECT [forumid], [name] "
        + "FROM Forums "
        + "ORDER BY [name]";
        SqlDataAdapter da = new SqlDataAdapter(sel, con);
        da.Fill(ds, "Forums");
        // fill the Topics table 
        sel = "SELECT [forumid], [topicid], "
        + "[name], [description] "
        + "FROM Topics "
        + "ORDER BY [name]";
        da = new SqlDataAdapter(sel, con);
        da.Fill(ds, "Topics");
        // bind the Forum repeater 
        ForumRepeater.DataSource = ds.Tables["Forums"]
        .DefaultView;
        ForumRepeater.DataBind();
    }
    public void ForumRepeater_ItemDataBound( Object sender, RepeaterItemEventArgs e)
    {
        Repeater r = ((Repeater)e.Item 
        .FindControl("TopicRepeater"));
        DataRowView drv 
        = (DataRowView)e.Item.DataItem;
        string forumid = drv["forumid"].ToString();
        DataView dv 
        = ds.Tables["Topics"].DefaultView;
        dv.RowFilter = "forumid=" + forumid;
        r.DataSource = dv; 
        r.DataBind();
    }


}