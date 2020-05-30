using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing.Printing;
using com.epson.pos.driver;
using System.Management;


namespace SABONG
{
    public partial class Home : System.Web.UI.Page
    {
        //List<int> Names = new List<int>();
        // database register
        MySql.Data.MySqlClient.MySqlConnection conn;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        MySql.Data.MySqlClient.MySqlCommand cmd1;
        String queryStr;
        MySql.Data.MySqlClient.MySqlDataReader reader;
        //
        MySql.Data.MySqlClient.MySqlDataReader reader1;
        String max;
        //
        MySql.Data.MySqlClient.MySqlDataReader reader2;
        String sulno;
        String side2;
        String odds2;
        String betamount2;
        String prize2;
        String totalpayout2;
        String name;
        String sample;
        String odds;
        String id;
        String Betno;
        String userid;
        String barcode1;
        String arenaName;
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["webAppConnString"].ToString();
        //newly added fields

        //hidden fields for db reference
        string sultadaID;
        string fightID;
        string arenaID;


        MySql.Data.MySqlClient.MySqlDataReader reader3;

        //  private System.ComponentModel.Container components = null;

        // Constant variable holding the printer name.
        private const string PRINTER_NAME = "EPSON TM-T88V Receipt";

        // Variables/Objects.
        private StatusAPI m_objAPI;


        public Home()
        {
            //
            // Required for Windows Form Designer support
            //
            // InitializeComponent();

            m_objAPI = new StatusAPI();
            //
            // TODO: Add any constructor code after InitializeComponent call
            //
        }


        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        if (components != null)
        //        {
        //            components.Dispose();
        //        }
        //    }
        //    base.Dispose(disposing);
        //}

        /// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
        //static void Main()
        //{
        //    Page.Application.Run(new Home());
        //

        protected void Page_Load(object sender, EventArgs e)
        {
            //cmdback.Enabled = false;
            BarCode.Focus();
            //Panel4.Visible = false;
            name = (String)(Session["uname"]);
            userid = (String)(Session["id"]);
            lbluser.Text = name;
            //Panel1.Visible = false;
           
       // String connString = System.Configuration.ConfigurationManager.ConnectionStrings["webAppConnString"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            //settings maxlimit
            conn.Open();
            queryStr = "";
            queryStr = "SELECT value FROM u208625346_derby.settings WHERE ID=1";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            reader1 = cmd.ExecuteReader();
            max = "";
            while (reader1.HasRows && reader1.Read())
            {
                max = reader1.GetString(reader1.GetOrdinal("value"));
                lblmaxbet.Text = max;
            }

            reader1.Close();
            conn.Close();

            //suldata no.
            conn.Open();
            queryStr = "";

            //queryStr = "SELECT sultadaNo FROM u208625346_derby.tblsultada WHERE ID=(Select max(ID) from tblsultada)";
            //queryStr = "SELECT max(s.ID) as sultadaID, max(f.FightID) as fightID, s.arenaID as arenaID, max(f.FightNo) as fightNo, a.name as arenaName from tblsultada s left join tblFight f on s.ID = f.SultadaID join tblArena a on s.ArenaID = a.ID";
            //cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            //reader2 = cmd.ExecuteReader();
            //sulno = "";
            //arenaName = "";
            //sultadaID = "";
            //fightID = "";
            //arenaID = "";

            //while (reader2.HasRows && reader2.Read())
            //{
            //    sulno = reader2.GetString(reader2.GetOrdinal("FightNo"));
            //    arenaName  = reader2.GetString(reader2.GetOrdinal("arenaName"));
            //    fightID = reader2.GetString(reader2.GetOrdinal("fightID"));
            //    sultadaID = reader2.GetString(reader2.GetOrdinal("sultadaID"));
            //    arenaID = reader2.GetString(reader2.GetOrdinal("arenaID"));
            //    lblsultada.Text = sulno;
            //    Label38.Text = sultadaID;
            //    Label39.Text = fightID;
            //    Label40.Text = arenaID;
            //    Label30.Text = arenaName;
            //}
            //reader2.Close();
            //conn.Close();

            

            ///-----commenteed 01/19
            //------------------------------------------------------------------------------------------------------------------------------------ID NO.--BET----------------------------------------------------------------
            //conn.Open();
            //queryStr = "";
            //queryStr = "SELECT id FROM u208625346_derby.betsample WHERE ID=(Select max(ID) from betsample)";

            //cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            //reader3 = cmd.ExecuteReader();
            //id = "";
            //while (reader3.HasRows && reader3.Read())
            //{
            //    id = reader3.GetString(reader3.GetOrdinal("id"));
            //    lblid.Text = id;

            //}
            //reader3.Close();
            //conn.Close();
            ///-----commenteed 01/19
            //if (IsPostBack)
            //{
            //    sumClicks.Text = (string)ViewState["sumClicks"];
            //}


        }
        private int i
        {
            get
            {
                if (Session["i"] == null)
                    return 0;

                return (int)Session["i"];

                // Instead of 3 lines in the above, you can use this one too as a short form.
                // return (int?) Session["i"] ?? 0;
            }
            set
            {
                Session["i"] = value;
            }
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Login.aspx");
        }

        protected void BarCode_TextChanged(object sender, EventArgs e)
       {
            cmdback.Enabled = true;
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["webAppConnString"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            //sample.
            conn.Open();
            queryStr = "";
            queryStr = "SELECT f.FightNo as fight, b.Side as Side, b.Odds as Odds, b.BetAmount as BetAmount, b.Price as Price, b.TotalWinAmount as TotalWinAmount FROM u208625346_derby.tblBet b left join tblFight f on f.SultadaID = b.SultadaID WHERE b.Barcode='" + BarCode.Text + "' and b.Status = '1' and b.ClaimStatus = '0' and b.WinStatus = '1'";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            reader = cmd.ExecuteReader();
            sample = "";
            side2 = "";
            odds2 = "";
            betamount2 = "";
            prize2 = "";
            totalpayout2 = "";

            while (reader.HasRows && reader.Read())
            {
                sample = reader.GetString(reader.GetOrdinal("fight"));
                //side
                side2 = reader.GetString(reader.GetOrdinal("Side"));
                //odds
                odds2 = reader.GetString(reader.GetOrdinal("Odds"));
                //bet amount
                betamount2 = reader.GetString(reader.GetOrdinal("BetAmount"));
                //prize
                prize2 = reader.GetString(reader.GetOrdinal("Price"));
                //total payout
                totalpayout2 = reader.GetString(reader.GetOrdinal("TotalWinAmount"));
            }
            if (reader.HasRows)
            {
                sultada.InnerText = sample;
                lblside2.InnerText = side2;
                lblodds2.InnerText = odds2;
                lblbetamount2.InnerText = betamount2;
                lblprize2.InnerText = prize2;
                lbltotalpayout2.InnerText = totalpayout2;
               // BarCode.Text = "";

            }
            else
            {
                BarCode.Text = "Invalid barcode";
                lblside2.InnerText = "";
                lblodds2.InnerText = "";
                lblbetamount2.InnerText = "";
                lblprize2.InnerText = "";
                lbltotalpayout2.InnerText = "";
               // BarCode.Text = "";

            }

            reader.Close();
            conn.Close();

        }

        protected void Button17_Click(object sender, EventArgs e)
        {
          //  Panel1.Enabled = true;
            cmdwala.Visible = false;
            cmdmeron.Visible = false;
            lblside.Text = "WALA";

            //odds.
            //conn.Open();
            queryStr = "";
            queryStr = "SELECT value FROM u208625346_derby.settings WHERE ID= 4";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            reader2 = cmd.ExecuteReader();
            odds = "";
            while (reader2.HasRows && reader2.Read())
            {
                odds = reader2.GetString(reader2.GetOrdinal("value"));
                lblodds.Text = odds;
            }
            reader2.Close();
            conn.Close();
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
           // Panel1.Enabled = true;
            cmdwala.Visible = false;
            cmdmeron.Visible = false;
            lblside.Text = "MERON";

            //odds.
            //conn.Open();
            queryStr = "";
            queryStr = "SELECT value FROM u208625346_derby.settings WHERE ID= 3";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            reader2 = cmd.ExecuteReader();
            odds = "";
            while (reader2.HasRows && reader2.Read())
            {
                odds = reader2.GetString(reader2.GetOrdinal("value"));
                lblodds.Text = odds;
            }
            reader2.Close();
            conn.Close();
        }
        #region "inputAmount"
        protected void result_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button10_Click1(object sender, EventArgs e)
        {
            i = 0;
            txtamount.Text = i.ToString();
        }

        protected void Button18_Click(object sender, EventArgs e)
        {
            i += 10;
            txtamount.Text = i.ToString();
        }

        protected void Button19_Click(object sender, EventArgs e)
        {
            i += 20;
            txtamount.Text = i.ToString();
        }

        protected void Button20_Click(object sender, EventArgs e)
        {
            i += 50;
            txtamount.Text = i.ToString();
        }

        protected void Button21_Click(object sender, EventArgs e)
        {
            i += 100;
            txtamount.Text = i.ToString();
        }

        protected void Button22_Click(object sender, EventArgs e)
        {
            i += 200;
            txtamount.Text = i.ToString();
        }

        protected void Button23_Click(object sender, EventArgs e)
        {
            i += 500;
            txtamount.Text = i.ToString();
        }

        protected void Button24_Click(object sender, EventArgs e)
        {
            i += 1000;
            txtamount.Text = i.ToString();
        }

        protected void Button25_Click(object sender, EventArgs e)
        {
            i += 5000;
            txtamount.Text = i.ToString();
        }
        #endregion

        protected void cmdprint_Click(object sender, EventArgs e)
        {

            int maxbet =   Convert.ToInt32(lblmaxbet.Text);
            int betamount = Convert.ToInt32(txtamount.Text);
            if (maxbet <= betamount )
            {
              
            }else
            {
                PrintDocument pdPrint = new PrintDocument();
                pdPrint.PrintPage += new PrintPageEventHandler(pdPrint_PrintPage);
                pdPrint.PrinterSettings.PrinterName = PRINTER_NAME;

                try
                {
                    // Open a printer status monitor for the selected printer.
                    if (m_objAPI.OpenMonPrinter(OpenType.TYPE_PRINTER, PRINTER_NAME) == ErrorCode.SUCCESS || m_objAPI.OpenMonPrinter(OpenType.TYPE_PRINTER, PRINTER_NAME) == ErrorCode.ERR_OPENED)

                    {
                        // Change the printer to the indicated printer.
                        pdPrint.PrinterSettings.PrinterName = PRINTER_NAME;

                        if (pdPrint.PrinterSettings.IsValid)
                        {
                            pdPrint.DocumentName = "Testing";
                            // Start printing
                            pdPrint.Print();

                            // Check printing status.
                            StatusMonitoring();
                        }
                        else

                        // Always close the Status Monitor after using the Status API.
                        if (m_objAPI.CloseMonPrinter() != ErrorCode.SUCCESS)
                        {                  //       MessageBox.Show("Failed to close printer status monitor.", "Program07", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                        else
                        {
                            //   MessageBox.Show("Failed to open printer status monitor.", "Program07", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                    }
                }
                catch (Exception ex)
                {
                    ex.Message.ToString();
                    // MessageBox.Show("Failed to open StatusAPI.", "Program07", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
           
        }


            private void pdPrint_PrintPage(object sender, PrintPageEventArgs e)
        {

            string date = DateTime.Now.ToString("yyyyMMddHHmmss");
            string date2= DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss");
            //DateTime myDate = DateTime.Now;
            int Betno = (Convert.ToInt32(lblid.Text)) + 1;
            lblid.Text = Betno.ToString();
            int multiplier = (Convert.ToInt32(txtamount.Text))/ 100;
            string sulno = Label2.Text;
            int payout = multiplier * (Convert.ToInt32(lblodds.Text));
            int prize = payout - (Convert.ToInt32(txtamount.Text));
            string barcode1 = sulno + userid + Betno + date; //temporary changed barcode format, 
            //string barcode1 = Label2.Text + Betno;
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["webAppConnString"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();
            queryStr = "";

            //queryStr = "INSERT INTO u208625346_derby.betsample(barcode,suldataNO,userID,betamount,prize,tpayment,odds,side,date,status)" +
            //    "VALUES('" + barcode1 + "','" + sulno + "','" + userid + "','" + txtamount.Text + "','" + prize + "','" + payout+ "', '" + lblodds.Text + "', '" + lblside.Text + "','" + date + "','" + 'A' + "')";

            queryStr = "INSERT INTO u208625346_derby.tblBet(SultadaID,FightID,Barcode,UserID,Side,BetAmount,Odds, Price,TotalWinAmount,Date)" +
               "VALUES('" + Label38.Text + "', '" + Label39.Text + "', '" + barcode1 + "', '" + userid + "','" + lblside.Text + "', '" + txtamount.Text + "', '" + lblodds.Text + "','" + prize + "','" + payout + "', '" + date + "')";


            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            cmd.ExecuteReader();

            conn.Close();
            //Response.Write("<script>alert('bet added.')</script>");


            float x, y, lineOffset;
            // Instantiate font objects used in printing.
            System.Drawing.Font printFont = new System.Drawing.Font("Arial Narrow", 9, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point); // Substituted to FontA Font
            System.Drawing.Font barcodeFont = new System.Drawing.Font("Courier New", 9); //Substituted to Barcode1 Font

            e.Graphics.PageUnit = System.Drawing.GraphicsUnit.Point;
            // Draw the bitmap012345678905012345678901
            // x = 79;
            //  y = 0;
            //e.Graphics.DrawImage(pbImage.Image, x, y, pbImage.Image.Width - 13, pbImage.Image.Height - 10);  uncomment the image if needed

            // Print the receipt text
            lineOffset = printFont.GetHeight(e.Graphics) - (float)2.5;
            x = 10;
            y = 0 + lineOffset;
            e.Graphics.DrawString(arenaName + ' '+ '-' + date2, printFont, System.Drawing.Brushes.Black, x, y);
            // y += lineOffset;
            y = y + (lineOffset * (float)3.5);
            e.Graphics.DrawString("SULTADA No                                 " + Label2.Text, printFont, System.Drawing.Brushes.Black, x, y);
            y += lineOffset;
            // y = y + (lineOffset * (float)5);
            e.Graphics.DrawString("SIDE                                              "+ lblside.Text, printFont, System.Drawing.Brushes.Black, x, y);
            y += lineOffset;
            e.Graphics.DrawString("ODDS                                            " + lblodds.Text, printFont, System.Drawing.Brushes.Black, x, y);
            y += lineOffset;
            e.Graphics.DrawString("BET AMOUNT                                " + txtamount.Text, printFont, System.Drawing.Brushes.Black, x, y);
            y += lineOffset;
            e.Graphics.DrawString("PRIZE                                     " + prize, printFont, System.Drawing.Brushes.Black, x, y);
            y += lineOffset;
            e.Graphics.DrawString("TOTAL PAYOUT                              " + payout, printFont, System.Drawing.Brushes.Black, x, y);
            y += lineOffset;
            e.Graphics.DrawString("Cashier                                   " + lbluser.Text, printFont, System.Drawing.Brushes.Black, x, y);
            //y += (lineOffset * (float)3.5);      
            y += lineOffset;
            e.Graphics.DrawString("1.Ang ticket na ito ay para sa Sultada No na nakasulat sa taas.", printFont, System.Drawing.Brushes.Black, x, y);
            y += lineOffset;
            e.Graphics.DrawString("2.Ang premyo ng ticket ng ticket na ito ay dapat i claim sa loob ng 72 oras pagkatapos ng sultada..", printFont, System.Drawing.Brushes.Black, x, y);
            y += lineOffset;
            e.Graphics.DrawString(".........", printFont, System.Drawing.Brushes.Black, x, y);
            y += lineOffset;
           // e.Graphics.DrawString(sulno + userid + Betno + date, barcodeFont, System.Drawing.Brushes.Black, x + 11, y + 10); //temporary changed
            e.Graphics.DrawString(barcode1, barcodeFont, System.Drawing.Brushes.Black, x + 5, y + 10);
            //y += (lineOffset * (float)3.5);s
            //e.Graphics.DrawString("Tax     5.0%                 $10.00", printFont, Brushes.Black, x, y);
            //y += lineOffset;
            //e.Graphics.DrawString("___________________________________", printFont, Brushes.Black, x, y);

            printFont = new System.Drawing.Font("Arial Narrow", 9, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            lineOffset = printFont.GetHeight(e.Graphics) - 3;
            y += lineOffset;
            //e.Graphics.DrawString("Total     $210.00", printFont, Brushes.Black, x - 1, y);

            // printFont = new Font("Lucida Console", (float)8, FontStyle.Regular, GraphicsUnit.Point);
            // lineOffset = printFont.GetHeight(e.Graphics);
            //  y = y + lineOffset + 1;
            //  e.Graphics.DrawString("Customer's payment         $250.00", printFont, Brushes.Black, x, y);
            //    y += lineOffset;
            // e.Graphics.DrawString("Change                      $40.00", printFont, Brushes.Black, x, y - 2);

            //  012345678901

            // Draw the barcode using the Barcode device font
            // y += lineOffset;
            // e.Graphics.DrawString("012345678901", barcodeFont, Brushes.Black, x + 11, y + 10);

            // Indicate that no more data to print, and the Print Document can now send the print data to the spooler.
            e.HasMorePages = false;
        }
      
        //private void add()
        //{
        //    String connString = System.Configuration.ConfigurationManager.ConnectionStrings["webAppConnString"].ToString();
        //    conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
        //    conn.Open();
        //    queryStr = "";

        //    queryStr = "INSERT INTO DBsabong.betsample(barcode,sultadaNO)" +
        //        "VALUES('" + userid + "','" + sulno + "')";
        //    cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

        //    cmd.ExecuteReader();

        //    conn.Close();
        //    Response.Write("<script>alert('Item Already Exists')</script>");
        //}
       
        // Checks the printer status.
        private void StatusMonitoring()
        {
            Boolean isFinish = false, cancelErr = false;
            ASB printerStatus;

            do
            {
                printerStatus = m_objAPI.Status;

                // Notify printing completion.
                if (printerStatus.ToString().Contains(ASB.ASB_PRINT_SUCCESS.ToString()))
                {
                    // MessageBox.Show("Printing complete.", "Program07", MessageBoxButtons.OK, MessageBoxIcon.Information);
                  
                    isFinish = true;
                    //BiCloseMonPrinter
                }
       
                else
                {
                    // Notify any errors that occur.
                    if (printerStatus.ToString().Contains(ASB.ASB_COVER_OPEN.ToString()))
                    {
                      //  MessageBox.Show("Cover is open.", "Program07", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        isFinish = true;
                        cancelErr = true;
                    }
                    else if (printerStatus.ToString().Contains(ASB.ASB_AUTOCUTTER_ERR.ToString()))
                    {
                      //  MessageBox.Show("Autocutter error occurred.", "Program07", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        isFinish = true;
                        cancelErr = true;
                    }
                    else if (printerStatus.ToString().Contains(ASB.ASB_NO_RESPONSE.ToString()))
                    {
                        //MessageBox.Show("No response.", "Program07", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        isFinish = true;
                        cancelErr = true;
                    }
                    else if (printerStatus.ToString().Contains(ASB.ASB_PAPER_END.ToString()))
                    {
                      //  MessageBox.Show("Roll paper end sensor: paper not present.", "Program07", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        isFinish = true;
                        cancelErr = true;
                    }

                    // If an error occured, call BiCancelError or BiResetPrinter.
                    if (cancelErr)
                        m_objAPI.CancelError();
                }
            } while (!isFinish);

            i = 0;
            txtamount.Text = i.ToString();

        }

        protected void cmdback_Click(object sender, EventArgs e)
        {
            // clear redeem data
            sultada.InnerText = "0";
            lblside2.InnerText = "---";
            lblodds2.InnerText = "---";
            lblbetamount2.InnerText = "0";
            lblprize2.InnerText = "0";
            lbltotalpayout2.InnerText = "0";
            BarCode.Text = "";

        }

        protected void cmdcomfirm_Click(object sender, EventArgs e)
        {
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            //update claim status to 1
            conn.Open();
            queryStr = "";
            queryStr = "Update tblbet set ClaimStatus = '1' where Barcode = '" + BarCode.Text +"'";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            reader1 = cmd.ExecuteReader();
            reader1.Close();
            conn.Close();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            //settings maxlimit
            conn.Open();
            queryStr = "";
            queryStr = "SELECT value FROM u208625346_derby.settings WHERE ID=2";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            reader1 = cmd.ExecuteReader();
            max = "";
            while (reader1.HasRows && reader1.Read())
            {   
                //betswitch
                max = reader1.GetString(reader1.GetOrdinal("value"));
                status1.Text = max;
                if (max == "0")
                {
                    status1.Text = "Betting is Closed";
                }
                else
                {
                    status1.Text = "Betting is Open";
                }
            }
            reader1.Close();
            conn.Close();

            conn.Open();
            queryStr = "SELECT max(s.ID) as sultadaID, max(f.FightID) as fightID, s.arenaID as arenaID, max(f.FightNo) as fightNo, a.name as arenaName from tblsultada s left join tblFight f on s.ID = f.SultadaID join tblArena a on s.ArenaID = a.ID";
            cmd1 = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            reader2 = cmd1.ExecuteReader();
            sulno = "";
            arenaName = "";
            sultadaID = "";
            fightID = "";
            arenaID = "";

            while (reader2.HasRows && reader2.Read())
            {
                sulno = reader2.GetString(reader2.GetOrdinal("FightNo"));
                arenaName = reader2.GetString(reader2.GetOrdinal("arenaName"));
                fightID = reader2.GetString(reader2.GetOrdinal("fightID"));
                sultadaID = reader2.GetString(reader2.GetOrdinal("sultadaID"));
                arenaID = reader2.GetString(reader2.GetOrdinal("arenaID"));
                Label2.Text = sulno;
                Label38.Text = sultadaID;
                Label39.Text = fightID;
                Label40.Text = arenaID;
                Label30.Text = arenaName;
            }

            reader2.Close();
            conn.Close();
             

        }

        protected void cmdrefund_Click(object sender, EventArgs e)
        {
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            //update refund status to 1
            conn.Open();
            queryStr = "";
            queryStr = "Update tblbet set RefundStatus = '1', ClaimStatus = '1' where Barcode = '" + BarCode.Text + "'";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            reader1 = cmd.ExecuteReader();
            reader1.Close();
            conn.Close();
        }

        //protected void Button26_Click(object sender, EventArgs e)
        //{
        //    String connString = System.Configuration.ConfigurationManager.ConnectionStrings["webAppConnString"].ToString();
        //    conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
        //    conn.Open();
        //    queryStr = "";

        //    queryStr = "INSERT INTO DBsabong.betsample(barcode,suldataNO)" +
        //        "VALUES('" + barcode1 + "','" + sulno + "')";
        //    cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

        //    cmd.ExecuteReader();

        //    conn.Close();
        //    Response.Write("<script>alert('Item Already Exists')</script>");

        //}
    } }




