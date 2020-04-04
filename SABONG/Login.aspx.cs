
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SABONG
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // database register
        MySql.Data.MySqlClient.MySqlConnection conn;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        String queryStr;
        // database login
        MySql.Data.MySqlClient.MySqlDataReader reader;
        String name;
        String userid;
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        protected void siginEventMothod1(object sender, EventArgs e)
        { 
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["webAppConnString"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();
            queryStr = "";
            queryStr = "SELECT * FROM u208625346_derby.user WHERE username='" + usernameTextBox.Text + "' AND password='" + passwordTextBox.Text + "' AND SPIN='" + SPIN2.Text + "'";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            reader = cmd.ExecuteReader();
            name = "";
            while(reader.HasRows && reader.Read())
            {
                name = reader.GetString(reader.GetOrdinal("username")); //+ " " +
                userid =   reader.GetString(reader.GetOrdinal("id"));
                //  reader.GetString(reader.GetOrdinal("password")) + " " +
                // reader.GetString(reader.GetOrdinal("SPIN"));
            }

            if(reader.HasRows)
            {
                Session["uname"] = name;
                Session["id"] = userid;
                Response.BufferOutput = true;
                Response.Redirect("Home.aspx",false);
            }
            else
            {
                Label12.Text = "Login Failed";

            }

            reader.Close();
            conn.Close();
        }

        protected void signupEventMethod(object sender, EventArgs e)
        {
            registerUser();
            //clear textbox
            username.Text = "";
            password.Text = "";
            emailadd.Text = "";
            SPIN.Text = "";
        }

        //database connection
        private void registerUser()
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();

            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();
            queryStr = "";

            queryStr = "INSERT INTO u208625346_derby.user(username,password,EmailAddress,SPIN)" +
                "VALUES('" + username.Text + "','" + password.Text + "','" + emailadd.Text + "','" + SPIN.Text + "')";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            cmd.ExecuteReader();

            conn.Close();

            //throw new NotImplementedException();
        }
    }
}