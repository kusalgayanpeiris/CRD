
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Simple Database Application using ASP</title>
</head>
<script type="text/javascript">
function validateForm()
{ 
  var un=document.test.username.value;
  var pd=document.test.password.value;
  if(un=="" && pd!="")
  {	  
  document.getElementById("errorMessage").innerHTML="Please enter username";return false;	}
  if(un!="" && pd=="")
  {	   document.getElementById("errorMessage").innerHTML="Please enter password"; return false;	}
  if(un=="" && pd=="")
	  {	 document.getElementById("errorMessage").innerHTML="Please enter username & password";return false;	}
	}
</script>
<body>
<h2>Simple Database Application using ASP</h2>
<%
dim ac
idno=request.QueryString("id")
ac=request.QueryString("action")
nm=request.QueryString("uname")
pd=request.QueryString("pass")

if ac="edit" then

%>
<form name="test" method="post" action="update.asp?id=<% =idno %>" onSubmit="return validateForm();" >
<table border="1" ">
<tr>
<td>UserName:</td><td><input type="text" id="username" name="username" value="<% =nm %>"  /></td>
</tr><tr>
<td>Password:</td><td><input type="password" id="password" name="password" value="<% =pd %>" /></td></tr>
<tr>
<td colspan="2"><input type="submit" value="submit" /></td></tr></table>
</form>
<% 
else
%>
<form name="test" method="post" action="insert.asp"  onSubmit="return validateForm();">
<table border="1"">
<tr>
<td>UserName:</td><td><input type="text" id="username" name="username"  value=""  /></td>
</tr><tr>
<td>Password:</td><td><input type="password" id="password" name="password"  value="" /></td></tr>
<tr>
<td colspan="2"><input type="submit" value="submit" /></td></tr></table>
</form>
<%
end if %>
<p id="errorMessage" style="color:#C00; font-style:italic;"></p>

<!--#include file="dbConnect.inc"-->
<%
	sql = "select * from info"
	set rs = conn.execute(sql)
	Response.Write("<table border=1><tr><td><b>S. No</td><td><b>User Name</td><td><b>Password</td></tr>")
	i=1
	do while not rs.eof
		d=rs("id")
		uname=rs("un")
		pass=rs("psd")
		Response.Write("<tr><td>" & i & "</td><td>" & rs("un") & "</td><td>" & rs("psd") & "</td><td><a href='default.asp?id="& d &"&action=edit&uname="& uname &"&pass="& pass &"'>Edit </a>" & "</td><td><a href='delete.asp?id="& d &"&action=edit&uname="& uname &"&pass="& pass &"'>Delete </a>" & "</td></tr>")
		rs.movenext
		i=i+1
    Loop 
	Response.Write("</table>")
%>

</body>
</html>
