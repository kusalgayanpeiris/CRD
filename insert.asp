<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="dbConnect.inc"-->
<%  

	dim var1,var2,sql
	var1 = request.Form("username")
	var2 = request.Form("password")
	sql = "insert into info(un, psd) values ('" & var1 & "','" & var2 & "')"
	conn.execute(sql)
	Response.Redirect("default.asp?action")
%>
