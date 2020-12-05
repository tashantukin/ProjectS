<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SABONG.Home" %>


<!DOCTYPE html>
<html xmlns="">
<head runat="server">

    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />

    <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Google Fonts Roboto -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="css/mdb/css/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="css/mdb/css/mdb.min.css">


    <script type="text/javascript">
        function ShowMsg() {
            if (confirm("You have logout succesfully") == true)
                return true;
            else
                return false;
        }
        //var sum = 0;
        //function clickHandler() {
        //    var $target = $(this),z
        //      $span = $target.siblings("span").children(".clickNumber"),
        //      $sum = $("#sumClicks");
        //    $span.text(parseInt($span.text()) + 1);
        //    sum += 1;
        //    $sum.text(sum);
        //}
        //$('button[type="button"]').click(clickHandler);

    </script>
    <style type="text/css">
        .auto-style3 {
            height: 775px;
        }
        .auto-style5 {
            width: 268435488px;
        }
        .auto-style8 {
            margin-left: 0px;

        }
        </style>
</head>
<body>
    <form id="form1" runat="server" defaultfocus="BarCode" class="auto-style3">

<div class="container-fluid">
      <div class="col-md-12">
        <asp:Label ID="Label30" runat="server" Text="--name --" class="lead text-important"></asp:Label>
                 
      </div>
    <div class ="jumbotron no-gutters">
        <div class="row bg-dark text-white no-gutters" style="height:auto;">
         
                  <div class="col-md-3">
                      <asp:Label ID="Label29" runat="server" Text="SULTADA NO.:" class="lead text-important font-weight-bold text-red"></asp:Label>
                         <asp:Label ID="lblsultada" runat="server" Text="000" class="lead text-important bg-warning text-dark font-weight-bold"></asp:Label>
                  </div>

                  <div class="col-md-3">
                     <asp:Label ID="Label8" runat="server" Text="MAXIMUM BET:" class="lead text-important font-weight-bold"></asp:Label>
                      <asp:Label ID="lblmaxbet" runat="server" Text="0" class="lead text-important bg-warning text-dark font-weight-bold"></asp:Label>
                  </div>

                  <div class="col-md-3">
                       <asp:Label ID="Labeluser" runat="server" Text="CURRENT USER:" class="lead text-important font-weight-bold"></asp:Label>
                    <asp:Label ID="lbluser" runat="server" Text="username" class="lead text-important bg-warning text-dark font-weight-bold"></asp:Label>
                  </div>

                <div class="col-md-3">
                     <asp:Button ID="Button11" runat="server"  OnClick="Button11_Click" Text="LOGOUT" class="btn btn-danger btn-block" />
                    <%--onClientClick="return ShowMsg();"--%>
                 </div>

       </div>

      <div class="row rounded">
          <div class ="col-md-6">
        
               <asp:Panel ID="Panel2" runat="server">
                    <asp:Panel ID="Panel3" runat="server" >
                        <asp:Button ID="cmdmeron" runat="server"  OnClick="Button16_Click" Text="MERON" class="btn btn-danger" />
                        <asp:Label ID="lblside" runat="server" Font-Size="35pt" Text="-"></asp:Label>
                        <asp:Button ID="cmdwala" runat="server"  OnClick="Button17_Click" Text="WALA" class="btn btn-primary" />
                    </asp:Panel>
              </asp:Panel>
  
            <p class="note note-success"><strong>Redeem Tickets</strong> 
               Redeemable winning tickets are allowed with (n) days of winning date.
            </p>
      <p id="status">
        
               </p>
        <br />
               <%--<asp:Panel ID="Panel4" runat="server" Height="482px" Width="392px">--%>

              <div class="md-form mb-4 pink-textarea active-pink-textarea">
                  <i class="fas fa-barcode prefix"></i>
                    <asp:TextBox ID="BarCode" runat="server"  EnableViewState="False" Font-Size="30pt" OnTextChanged="BarCode_TextChanged" class="form-control font-weight-bold"></asp:TextBox>
                  <%--<textarea id="form21" class="md-textarea form-control" rows="3"></textarea>--%>
                  <label for="Barcode">Scanned ticket barcode</label>
              </div>

            <asp:Label ID="sbarcode" runat="server" Text="---"></asp:Label>
  
            <table class="table table-bordered" >
                  <thead class="thead-dark">
                    <tr>
                      <th scope="col">SULTADA</th>
                      <th scope="col">Side</th>
                      <th scope="col">Odds</th>
                      <th scope="col">Bet Amount</th>
                      <th scope="col">Prize</th>
                      <th scope="col">Total Payout</th>      
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td ID="sultada" runat="server"></td>
                      <td ID="lblside2"  runat="server">Otto</td>
                      <td ID="lblodds2"  runat="server">@mdo</td>
                      <td ID="lblbetamount2"  runat="server">@mdo</td> 
                      <td ID="lblprize2" runat="server">@mdo</td>  
                      <td ID="lbltotalpayout2"  runat="server">@mdo</td>    

                    </tr>
                    
                  </tbody>
            </table>


            <%--&nbsp;Sultada #:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>            <%--<asp:Label ID="sultada" runat="server" Text="0"></asp:Label>--%>            <%--<br />--%>            <%--&nbsp;Side:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>            <%--<asp:Label ID="lblside2" runat="server" Text="---"></asp:Label>--%>            <%--<br />--%>            <%--&nbsp;Odds:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>            <%--<asp:Label ID="lblodds2" runat="server" Text="---"></asp:Label>--%>            <%--<br />--%>            <%--&nbsp;Bet Amount:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>            <%--<asp:Label ID="lblbetamount2" runat="server" Text="0"></asp:Label>--%>            <%--<br />--%>            <%--&nbsp;Prize:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>            <%--<asp:Label ID="lblprize2" runat="server" Text="0"></asp:Label>--%>            <%--<br />--%>            <%--&nbsp;Total Payout:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>            <%--<asp:Label ID="lbltotalpayout2" runat="server" Text="0"></asp:Label>--%>            <%--<br />
            <br />--%>            <%--&nbsp;&nbsp;&nbsp;--%>

          <div class ="row container-fluid no-gutters">
                <div class="col-md-3 col-xs-3" style="height:100px;">
                   
                        <asp:Button ID="cmdcomfirm" runat="server" class="btn-block btn-success btn-rounded h-100 font-weight-bold" Text="COMFIRM"  OnClick="cmdcomfirm_Click" />
                 </div>
               <div class="col-md-3 col-xs-3" style="height:100px;">
                        <asp:Button ID="cmdrefund" runat="server" class="btn-block btn-warning btn-rounded h-100 font-weight-bold" Text="REFUND" OnClick="cmdrefund_Click"  />
               </div>
                  <div class="col-md-3 col-xs-3" style="height:100px;">  
                        <asp:Button ID="cmdnewbet" runat="server" class="btn-block btn-primary btn-rounded h-100 font-weight-bold" Text="NEW BET"  />
                 </div>
               <div class="col-md-3 col-xs-3" style="height:100px;">
                        <asp:Button ID="cmdback" runat="server" class="btn-block btn-blue-gray btn-rounded h-100 font-weight-bold" Text="BACK"  OnClick="cmdback_Click" />
                 </div>
                     
            </div>

               <asp:Label ID="Label37" runat="server" Text="LAST REDEEM:"></asp:Label>
               <%--</div>--%>        <%--</asp:Panel>--%>              <%--  --%>

              <asp:Label ID="lblredeem" runat="server" Text="0"></asp:Label>

          </div>
 <%--<asp:Panel ID="betpanel" runat="server">--%>
     <div class="col-md-6" id ="betdiv">
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick">
                        </asp:Timer>
        
          <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                          <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                        </Triggers>
                   <ContentTemplate>
                       <asp:Label ID="Label1" runat="server" Text="SULTADA NO.:" class="lead text-important font-weight-bold text-red"></asp:Label>
                         <asp:Label ID="Label2" runat="server" Text="000" class="lead text-important bg-warning text-dark font-weight-bold"></asp:Label>
                          <asp:Label ID="status1" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="Label39" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="Label38" runat="server" Text="Label"></asp:Label>
                       <%--//<span id="status1" runat="server"> </span>--%>
                        <%--  <asp:Label ID="oddsmeron" runat="server" Text="Label"></asp:Label> 
                          <asp:Label ID="oddswala" runat="server" Text="Label"></asp:Label> --%> 
                        <asp:Label ID="Label40" runat="server" Text="Label"></asp:Label>
                   </ContentTemplate>
         </asp:UpdatePanel> 

              <asp:Label ID="lblodds" runat="server" Text="odds"></asp:Label>
              <%--<asp:Panel ID="Panel1" runat="server" Height="662px" Width="794px" Direction="LeftToRight" Enabled="False">--%>
      
            <p class="note note-light"><strong>Select Bet Amount</strong> 
               Total PAYOUT will be computed based on the current ODDS from the ADMIN. Please check the printed TICKET to verify.
            </p>
              <%--<asp:Label ID="Label1" runat="server" TabIndex="1" Text="SELECT AMOUNT" class="lead"></asp:Label>--%>
    
       
       
    
      <%--<asp:TextBox ID="textBox_Result" runat="server" Font-Size="25pt" Height="62px" OnTextChanged="textBox_Result_TextChanged" TabIndex="1" Width="522px"></asp:TextBox>--%>
       
      
             <div class="col-md-12">
                 <div class="row bg-dark text-white">
                 <div class="col-md-.5">
                     <asp:Label ID="Label10" runat="server" Font-Size="50pt" Text="₱" ></asp:Label> 
                 </div>
                   
                     <div class="col-md-9 " style="padding-top: 10px; padding-bottom:10px;">
            <asp:TextBox ID="txtamount" runat="server"  OnTextChanged="result_TextChanged" Font-Size="40pt"  class="form-control font-weight-bold"></asp:TextBox>
                         </div>
             </div>
          
   
           </div>
          
            <hr />

         <%--AMOUNT BUTTONS--%>
         <div class ="row container-fluid mr-1 pt-2 pb-2 rounded" style="background-color:lightslategrey">
             
               <div class="col-md-6 col-xs-6 mb-1 mt-1" style="height:100px;">
                   
                    <asp:Button ID="cmd10" runat="server" Font-Size="25pt" OnClick="Button18_Click" Text="10" class="btn-block btn-primary btn-rounded h-100 font-weight-bold mr-5" />
                  </div>
                  <%--  --%>
             
             
               <div class="col-md-6 col-xs-6 mb-1 mt-1" style="height:100px;">
                       <asp:Button ID="cmd20" runat="server" Font-Size="25pt"  OnClick="Button19_Click" Text="20" class="btn-block btn-primary btn-rounded h-100 font-weight-bold mr-1" />
                </div>  

            
               <div class="col-md-6 col-xs-6 mb-1 mt-1" style="height:100px;">
                  <asp:Button ID="cmd50" runat="server" Font-Size="25pt"  OnClick="Button20_Click" Text="50"  class="btn-block  btn-lg btn-primary btn-rounded h-100 font-weight-bold" />
               </div>

               <div class="col-md-6 col-xs-6 mb-1 mt-1" style="height:100px;">
                <asp:Button ID="cmd100" runat="server" Font-Size="25pt" OnClick="Button21_Click" Text="100"  class="btn-block  btn-lg btn-primary  btn-rounded h-100 font-weight-bold" />
             </div>

            
               <div class="col-md-6 col-xs-6 mb-1 mt-1" style="height:100px;">
                 <asp:Button ID="cmd200" runat="server" Font-Size="25pt" OnClick="Button22_Click" Text="200"  class="btn-block  btn-lg btn-primary btn-rounded h-100 font-weight-bold" />

             </div>

              
               <div class="col-md-6 col-xs-6 mb-1 mt-1" style="height:100px;">
                <asp:Button ID="cmd500" runat="server" Font-Size="25pt"  OnClick="Button23_Click" Text="500" class="btn-block  btn-lg btn-primary btn-rounded h-100 font-weight-bold" />

             </div>

             
               <div class="col-md-6 col-xs-6 mb-1 mt-1" style="height:100px;">
                  <asp:Button ID="cmd1000" runat="server" Font-Size="25pt"  OnClick="Button24_Click" Text="1000"  class="btn-block  btn-lg btn-primary btn-rounded h-100 font-weight-bold" />
             </div>

              
               <div class="col-md-6 col-xs-6 mb-1 mt-1" style="height:100px;">
                   <asp:Button ID="cmd5000" runat="server" Font-Size="25pt" OnClick="Button25_Click" Text="5000" class="btn-block  btn-lg btn-primary btn-rounded h-100 font-weight-bold"  />
             </div>
            
               <div class="col-md-6 col-xs-6 mb-1 mt-1" style="height:100px;">
               <asp:Button ID="Button1" runat="server" Font-Size="25pt" Height="70px" OnClick="cmdprint_Click" TabIndex="1" Text="PRINT" class="btn-block  btn-lg btn-success btn-rounded h-100 font-weight-bold "  />
             </div>
             
               <div class="col-md-6 col-xs-6 mb-1 mt-1" style="height:100px;">
               <asp:Button ID="Button3" runat="server" Font-Size="25pt" Height="70px" OnClick="Button10_Click1" TabIndex="1" Text="CLEAR" class="btn-block  btn-lg btn-danger btn-rounded h-100 font-weight-bold"  />
             </div>
         </div>
            
          
        <%--<button id="updateClick8" type="button" class="auto-style7" style="font-size: xx-large">5000</button>--%>             <%--<span ><asp:TextBox ID="sumClicks" runat="server" /> </span>--%>
        <script src='//static.codepen.io/assets/common/stopExecutionOnTimeout-41c52890748cd7143004e05d3c5f786c66b19939c4500ce446314d1748483e13.js'>
        </script><script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script>

    var count1 = 0;
    var count2 = 0;
    var count3 = 0;
    var count4 = 0;
    var count5 = 0;
    var count6 = 0;
    var count7 = 0;
    var count8 = 0;
    var sum = 0;

    $(document).ready(function () {
        console.log('here');

       // function myFunction() {
        setInterval(function () {
            checkstatus()
        }, 1000);
          // setTimeout(checkstatus, 3000);
       // }

        function checkstatus() {
            var g = $('#<%=status1.ClientID%>').text();
            console.log(g);
            if (g == "Betting is Closed") {
                console.log("islcose");
                $('#betdiv :input').attr("disabled", true);
            } else {
                $('#betdiv :input').attr("disabled", false);
            }
        }
        });
             
    $('#updateClick1').click(function () {
        count1 += 10;
        sum += 10;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    $('#updateClick2').click(function () {
        count2 += 50;
        sum += 50;
        $(this).siblings().children('.clickNumber').html(count2);
        $('#sumClicks').val(sum);
    });
    $('#updateClick3').click(function () {
        count3 += 200;
        sum += 200;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    $('#updateClick4').click(function () {
        count4 += 1000;
        sum += 1000;
        $(this).siblings().children('.clickNumber').html(count2);
        $('#sumClicks').val(sum);
    });
    $('#updateClick5').click(function () {
        count5 += 20;
        sum += 20;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    $('#updateClick6').click(function () {
        count6 += 100;
        sum += 100;
        $(this).siblings().children('.clickNumber').html(count2);
        $('#sumClicks').val(sum);
    });
    $('#updateClick7').click(function () {
        count7 += 500;
        sum += 500;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    //$('#updateClick8').click(function () {
      //  count8 += 5000;
      //  sum += 5000;
      //  $(this).siblings().children('.clickNumber').html(count2);
      //  $('#sumClicks').val(sum);
   // });

//# sourceURL=pen.js
</script>
  
      
<%--</asp:Panel>--%>

          </div>
    
          <%--</asp:Panel>--%>
      </div>
<table>
<tr>
    <%--colspan="2" rowspan="2" style="margin:auto; width:45%"--%>
<td > 
    <%--&nbsp;<asp:Label ID="Label30" runat="server" Text="--name --" Style="left: 50%; margin-left: 68px;"></asp:Label>--%> 
<%--    Style="left: 50%; margin-left: 68px;--%>    <%--&nbsp;<asp:Label ID="Label29" runat="server" Text="SULTADA No.:"></asp:Label>--%>    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblsultada" runat="server" Text="000"></asp:Label>--%>
    <asp:Label ID="lblid" runat="server" Text="0000"></asp:Label>
    <%--<asp:Panel ID="Panel2" runat="server" Width="401px" Height="613px" Direction="LeftToRight" Style="left: 50%; margin-left: 68px;">
        <asp:Panel ID="Panel3" runat="server" Height="67px" Width="394px" BorderStyle="Outset" HorizontalAlign="Center">
            <asp:Button ID="cmdmeron" runat="server" CssClass="auto-style8" Font-Size="24pt" Height="67px" OnClick="Button16_Click" Text="MERON" Width="185px" />
            <asp:Label ID="lblside" runat="server" Font-Size="35pt" Text="-"></asp:Label>
            <asp:Button ID="cmdwala" runat="server" Font-Size="24pt" Height="67px" OnClick="Button17_Click" Text="WALA" Width="184px" />
        </asp:Panel>--%>       
    <%--</asp:Panel>--%>
</td></tr>
<tr><td class="auto-style5" >
    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label8" runat="server" Text="MAXIMUM BET:"></asp:Label>--%>    <%--&nbsp;&nbsp;&nbsp; <asp:Label ID="lblmaxbet" runat="server" Text="0"></asp:Label>--%>    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblodds" runat="server" Text="odds"></asp:Label>--%>    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lbluser" runat="server" Text="username"></asp:Label>--%> 


    <%--<asp:Panel ID="Panel1" runat="server" Height="662px" Width="794px" Direction="LeftToRight" Enabled="False">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" TabIndex="1" Text="SELECT AMOUNT"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;<br />
        <asp:Label ID="Label39" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label38" runat="server" Text="Label"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:Label ID="Label40" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Font-Size="40pt" Text="₱"></asp:Label>
        &nbsp;   
        <%--<asp:TextBox ID="textBox_Result" runat="server" Font-Size="25pt" Height="62px" OnTextChanged="textBox_Result_TextChanged" TabIndex="1" Width="522px"></asp:TextBox>--%>       <%-- <asp:TextBox ID="txtamount" runat="server" Height="66px" OnTextChanged="result_TextChanged" Width="554px" Font-Size="30pt"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="cmd10" runat="server" Font-Size="25pt" Height="70px" OnClick="Button18_Click" Text="10" Width="340px" />
        &nbsp;&nbsp;&nbsp;<asp:Button ID="cmd20" runat="server" Font-Size="25pt" Height="70px" OnClick="Button19_Click" Text="20" Width="340px" />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="cmd50" runat="server" Font-Size="25pt" Height="70px" OnClick="Button20_Click" Text="50" Width="340px" />
        &nbsp;&nbsp;
        <asp:Button ID="cmd100" runat="server" Font-Size="25pt" Height="70px" OnClick="Button21_Click" Text="100" Width="340px" />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="cmd200" runat="server" Font-Size="25pt" Height="70px" OnClick="Button22_Click" Text="200" Width="340px" />
        &nbsp;&nbsp;
        <asp:Button ID="cmd500" runat="server" Font-Size="25pt" Height="70px" OnClick="Button23_Click" Text="500" Width="340px" />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%-- &nbsp;&nbsp;--%>    <%--&nbsp;<asp:Button ID="cmd1000" runat="server" Font-Size="25pt" Height="70px" OnClick="Button24_Click" Text="1000" Width="340px" />--%>
     <%--   &nbsp;&nbsp;&nbsp;<asp:Button ID="cmd5000" runat="server" Font-Size="25pt" Height="70px" OnClick="Button25_Click" Text="5000" Width="340px" />
       
        <%-- <button id="updateClick8" type="button" class="auto-style7" style="font-size: xx-large">5000</button>--%><%--<div>
    <span ><asp:TextBox ID="sumClicks" runat="server" /> </span>
        </div>--%>
        <%--<script src='//static.codepen.io/assets/common/stopExecutionOnTimeout-41c52890748cd7143004e05d3c5f786c66b19939c4500ce446314d1748483e13.js'>
</script><script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script >
    
    var count1 = 0;
    var count2 = 0;
    var count3 = 0;
    var count4 = 0;
    var count5 = 0;
    var count6 = 0;
    var count7 = 0;
    var count8 = 0;
    var sum = 0;

    $('#updateClick1').click(function () {
        count1 += 10;
        sum += 10;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    $('#updateClick2').click(function () {
        count2 +=50;
        sum += 50;
        $(this).siblings().children('.clickNumber').html(count2);
        $('#sumClicks').val(sum);
    });
    $('#updateClick3').click(function () {
        count3 += 200;
        sum += 200;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    $('#updateClick4').click(function () {
        count4 += 1000;
        sum += 1000;
        $(this).siblings().children('.clickNumber').html(count2);
        $('#sumClicks').val(sum);
    });
    $('#updateClick5').click(function () {
        count5 += 20;
        sum += 20;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    $('#updateClick6').click(function () {
        count6 += 100;
        sum += 100;
        $(this).siblings().children('.clickNumber').html(count2);
        $('#sumClicks').val(sum);
    });
    $('#updateClick7').click(function () {
        count7 += 500;
        sum += 500;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    //$('#updateClick8').click(function () {
      //  count8 += 5000;
      //  sum += 5000;
      //  $(this).siblings().children('.clickNumber').html(count2);
      //  $('#sumClicks').val(sum);
   // });

//# sourceURL=pen.js
</script>--%>&nbsp;<%-- <button id="updateClick8" type="button" class="auto-style7" style="font-size: xx-large">5000</button>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
       <%-- <asp:Button ID="cmdprint" runat="server" Font-Size="25pt" Height="70px" OnClick="cmdprint_Click" TabIndex="1" Text="PRINT" Width="340px" />
        &nbsp;&nbsp;
        <asp:Button ID="cmdclear" runat="server" Font-Size="25pt" Height="70px" OnClick="Button10_Click1" TabIndex="1" Text="CLEAR" Width="340px" />
        <br />
        <br />--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label7" runat="server" Text="TOTAL PAYOUT:"></asp:Label>
        &nbsp;&nbsp;&nbsp;<asp:Label ID="lblpayout" runat="server" Text="0"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="LAST CHANGE:"></asp:Label>

        <asp:Label ID="lblchange" runat="server" Text="0"></asp:Label>
   
        <asp:Label ID="Label27" runat="server" Text="© 2018 VERSION 0.1"></asp:Label>
     
        <%--<div>
    <span ><asp:TextBox ID="sumClicks" runat="server" /> </span>
        </div>--%>        <%--<script src='//static.codepen.io/assets/common/stopExecutionOnTimeout-41c52890748cd7143004e05d3c5f786c66b19939c4500ce446314d1748483e13.js'>
</script><script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script >
    
    var count1 = 0;
    var count2 = 0;
    var count3 = 0;
    var count4 = 0;
    var count5 = 0;
    var count6 = 0;
    var count7 = 0;
    var count8 = 0;
    var sum = 0;

    $('#updateClick1').click(function () {
        count1 += 10;
        sum += 10;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    $('#updateClick2').click(function () {
        count2 +=50;
        sum += 50;
        $(this).siblings().children('.clickNumber').html(count2);
        $('#sumClicks').val(sum);
    });
    $('#updateClick3').click(function () {
        count3 += 200;
        sum += 200;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    $('#updateClick4').click(function () {
        count4 += 1000;
        sum += 1000;
        $(this).siblings().children('.clickNumber').html(count2);
        $('#sumClicks').val(sum);
    });
    $('#updateClick5').click(function () {
        count5 += 20;
        sum += 20;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    $('#updateClick6').click(function () {
        count6 += 100;
        sum += 100;
        $(this).siblings().children('.clickNumber').html(count2);
        $('#sumClicks').val(sum);
    });
    $('#updateClick7').click(function () {
        count7 += 500;
        sum += 500;
        $(this).siblings().children('.clickNumber').html(count1);
        $('#sumClicks').val(sum);
    });

    //$('#updateClick8').click(function () {
      //  count8 += 5000;
      //  sum += 5000;
      //  $(this).siblings().children('.clickNumber').html(count2);
      //  $('#sumClicks').val(sum);
   // });

//# sourceURL=pen.js
</script>--%>

        
    </td></tr>
</table> 
            </div>

</div>
    </form>

</body>
</html>
