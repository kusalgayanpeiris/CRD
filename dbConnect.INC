<%
	dim conn, strcon
	set conn=server.createobject("adodb.connection")
	strcon = "PROVIDER=MSDASQL;"
	strcon = strcon & "DRIVER={Microsoft Access Driver (*.mdb)};"
	strcon = strcon & "DBQ=" & Server.mappath("web.mdb")&";"
	conn.open=strcon
%>