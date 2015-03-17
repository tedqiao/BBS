<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%String admin=(String)session.getAttribute("admin");
if(admin==null||!admin.equals("true")){ 
out.println("fuk yiou");
return;}%>

<%! 
String pre="";
private void del(int id,Connection conn2){

Statement stmt=null;
try{
	stmt=conn2.createStatement();
	ResultSet rs=stmt.executeQuery("select * from article where pid="+id);
    while(rs.next()){
    	del(rs.getInt("id"),conn2);
    }
    stmt.executeUpdate("delete from article where id="+id);
	}
catch(SQLException e){
e.printStackTrace();	
}
} 
 %>
<%@ page import="java.sql.*" %>
<%//String query="insert into article values (null,"+Integer.parseInt(request.getParameter("id"))+", 1,'"+Integer.parseInt(request.getParameter("theme"))+"','"+request.getParameter("text").replaceAll("\n", "<br>")+"', now(), 0)"; 
	
	
	String query="select count(*) from article where pid=?";
	int id= Integer.parseInt(request.getParameter("id"));
	int pid=Integer.parseInt(request.getParameter("pid"));
	Connection conn2=null;
	Statement stmt2=null;
	ResultSet rs=null;
	PreparedStatement ps=null;
	Class.forName("com.mysql.jdbc.Driver");
	 conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1/BBS?" +
	                                   "user=root&password=yeapp123");
	stmt2 = conn2.createStatement();
	del(id,conn2);
	try{
	
	ps=conn2.prepareStatement(query);
	ps.setInt(1, pid);
	rs=ps.executeQuery();
	if(rs.next()){
		if(rs.getInt(1)<=0){
			conn2.createStatement().executeUpdate("Update article set isleaf=0 where pid="+pid);
		}
	}
	rs.close();
	}
	catch(SQLException e){
	e.printStackTrace();
	}
	finally{
	ps.close();
	rs.close();
	stmt2.close();
	conn2.close();  
	}
	response.sendRedirect("showtree.jsp");
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
	//String id=request.getParameter("id");
	//String rootid=request.getParameter("rootid");
	//String s1=request.getParameter("theme");
	//String s2=request.getParameter("text");
	
%>
  </head>
  
  <body>
 
  </body>
</html>