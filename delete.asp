<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="dbConnect.inc"-->
<%
	no=request.QueryString("id")
	sql="delete from info where id=" &no
	set rs=conn.execute(sql)
	response.redirect("default.asp?action")
%>