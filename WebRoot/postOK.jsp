<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>
<%//String query="insert into article values (null,"+Integer.parseInt(request.getParameter("id"))+", 1,'"+Integer.parseInt(request.getParameter("theme"))+"','"+request.getParameter("text").replaceAll("\n", "<br>")+"', now(), 0)"; 
	String action=request.getParameter("action");
	if(action.equals("post")&&action!=null){
	String query="insert into article values (null,0,?,?,?, now(),0)";
	
	String theme=request.getParameter("theme");
	String content=request.getParameter("text");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1/BBS?" +
	                                   "user=root&password=yeapp123");
	conn2.setAutoCommit(false);
	Statement stmt2 = conn2.createStatement();
	PreparedStatement ps=conn2.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
	ps.setInt(1, -1);
	ps.setString(2, theme);
	ps.setString(3, content);
	ps.executeUpdate();
	/*ResultSet rs=stmt2.executeQuery("select isleaf from article where id="+pid);
	if(rs.next()){
		if(rs.getInt("isleaf")==0)
		stmt2.executeUpdate("update article set isleaf=1 where id="+pid);
	}*/
	
	
	
	ResultSet key=ps.getGeneratedKeys();
	key.next();
	int keys=key.getInt(1);
	stmt2.executeUpdate("update article set rootid="+keys+" where id="+keys);
	//rs.close();
	key.close();
	conn2.commit();
	conn2.setAutoCommit(true);
	stmt2.close();
	ps.close();
	conn2.close();  
	response.sendRedirect("show.jsp?page=1");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'repleyOK.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<% 
	String id=request.getParameter("id");
	String rootid=request.getParameter("rootid");
	String s1=request.getParameter("theme");
	String s2=request.getParameter("text");
	
%>
  </head>
  
  <body>
  <table border="1">
    <tr><td><%=id %></td><td><%=rootid %></td></tr>
    <tr><td><%=s2.replaceAll("\n", "<br>")%></td></tr>
    <br>
  </table>
  </body>
</html>
