<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="dbConnect.inc"-->
<%
	
	no=request.QueryString("id")
	
	a = request.Form("username")
	b = request.Form("password")
	sql = "update info set un = '"& a & "', psd = '"& b & "' where id="& no 
	set rs = conn.execute(sql)
	Response.redirect("default.asp?action")
%>