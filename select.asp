<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="dbConnect.inc"-->
<%
	sql = "select * from info"
	set rs = conn.execute(sql)
	Response.Write("<table border=1><tr><td><b>S. No</td><td><b>User Name</td><td><b>Password</td></tr>")
	i=1
	do while not rs.eof
		d=rs("id")
		Response.Write("<tr><td>" & i & "</td><td><a href=edit.asp?id=" & d & ">" & rs("un") & "</a></td><td>" & rs("psd") & "</td></tr>")
		rs.movenext
		i=i+1
    Loop 
	Response.Write("</table>")
%>
<p><a href="Default.asp">Home</a></p>
