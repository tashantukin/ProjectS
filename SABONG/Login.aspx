<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SABONG.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/ui-lightness/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<link href="css/keyboard.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.keyboard.js"></script>
    <script src="js/jquery.keyboard.extension-typing.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#usernameTextBox').keyboard({
        autoAccept:true
    })
     .addTyping();

        $('#passwordTextBox').keyboard({
            autoAccept: true
        })
     .addTyping();

        $('#SPIN2').keyboard({
            autoAccept: true
        })
       .addTyping();

        //$('#txtNumkeyboard').keyboard({
        //    layout: 'num',
        //    restrictInput: true,
        //    preventPaste: true,
        //    autoAccept: true
        //})
        //.addTyping();
    });
</script>

    <link rel="Stylesheet" href="/css/master.css" type="text/css" />

<style type="text/css">
   body{
	margin:0;
	color:#6a6f8c;
	background:#c8c8c8;
	font:600 16px/18px 'Open Sans',sans-serif;
}
   *,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
	width:100%;
	margin:auto;
	max-width:525px;
	min-height:670px;
	position:relative;
    background:url(image/background.png) no-repeat center;
	/*background:url(https://raw.githubusercontent.com/khadkamhn/day-01-login-form/master/img/bg.jpg) no-repeat center;*/
	box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
	width:100%;
	height:100%;
	position:absolute;
	padding:90px 70px 50px 70px;
	background:rgba(40,57,101,.9);
}
.login-html .sign-in-htm,
.login-html .sign-up-htm{
	top:0;
	left:0;
	right:0;
	bottom:0;
	position:absolute;
	transform:rotateY(180deg);
	backface-visibility:hidden;
	transition:all .4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
	display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
	text-transform:uppercase;
}
.login-html .tab{
	font-size:22px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
	color:#fff;
	border-color:#1161ee;
}
.login-form{
	min-height:345px;
	position:relative;
	perspective:1000px;
	transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
}
.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
	/*text-security:circle;
	-webkit-text-security:circle;*/
}
.login-form .group .label{
	color:#aaa;
	font-size:12px;
}
.login-form .group .button{
	background:#1161ee;
}
.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
	top:6px;
	right:0;
	transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
	transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
	transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
	transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}

</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="login-wrap">
	<div class="login-html">

        <div style="margin-left: auto; margin-right: auto; text-align: center;">
           <asp:Label ID="Label" runat="server" Text="STAKEBOY" Font-Bold="true" Font-Size="X-Large"
        CssClass="StrongText" /></div><br /><br />
        
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					<label for="user" class="label">username</label>
					<asp:TextBox ID="usernameTextBox" Text="" CssClass="input" runat ="server" AutoCompleteType="Disabled" />
				</div>
				<div class="group">
					<label for="pass" class="label">password</label>
					<asp:TextBox ID="passwordTextBox" TextMode="password" CssClass="input" runat ="server" AutoCompleteType="Disabled" />
				</div>
                <div class="group">
					<label for="spin" class="label">SPIN</label>
					<asp:TextBox ID="SPIN2" TextMode="password" CssClass="input" runat ="server" AutoCompleteType="Disabled" />
				</div>
				<div class="group">
					<%--<input id="check" type="checkbox" class="check" checked>--%>
                    <asp:Label ID="Label12" runat="server" Text=" " ForeColor="red"></asp:Label>
					<%--<label for="check"><span class="icon"></span> Keep me Signed in</label>--%>
				</div>
				<div class="group">
					<asp:Button ID="sign_in" Cssclass="button" Text="Sign In" runat ="server" OnClick="siginEventMothod1"/>
				</div>
				<%--<div class="hr"></div>--%>
				<div class="foot-lnk">
					<%--<a href="#forgot">Forgot Password?</a>--%>
				</div>
			</div>
			<div class="sign-up-htm">
				<div class="group">
					<label for="user" class="label">Username</label>
					<asp:TextBox ID="username" Text="" CssClass ="input" runat ="server" AutoCompleteType="Disabled" />
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<asp:TextBox ID="password" TextMode ="Password" CssClass="input" runat ="server" AutoCompleteType="Disabled" />
				</div>
				<%--<div class="group">
					<label for="pass" class="label">Repeat Password</label>
					<input id="pass" type="password" class="input" data-type="password">
				</div>--%>
				<div class="group">
					<label for="email" class="label">Email Address</label>
                    <asp:TextBox ID="emailadd" runat ="server" CssClass="input" AutoCompleteType="Disabled"/>
				</div>
                <div class="group">
					<label for="spin" class="label">SPIN</label>
					<asp:TextBox ID="SPIN" runat ="server" CssClass="input" AutoCompleteType="Disabled" />
				</div>
				<div class="group">
					<asp:Button ID="sin_up" CssClass="button" Text="Sign Up"  runat ="server" Onclick ="signupEventMethod" />
                     
				</div>
				<%--<div class="hr"></div>--%>
				<div class="foot-lnk">
					<%--<label for="tab-1">Already Member?</a>--%>
				</div>
			</div>
		</div>
	</div>
</div>
    </div>
    </form>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
</body>
</html>
