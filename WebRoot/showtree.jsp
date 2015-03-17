<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>

<%@ page import="java.sql.*" %>
<%!boolean login=false; %>
<%String admin=(String)session.getAttribute("admin");
	
	if(admin!=null&&admin.equals("true")){
	 login=true;
	}

 %>
<%!String fix=""; 
%>
<% 

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/BBS?" +
	                                   "user=root&password=yeapp123");
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from article where pid=0");
      while(rs.next()){
      if(login){
      	fix="</td><td><a href='delete.jsp?id="+rs.getInt("id")+"&pid="+rs.getInt("pid")+"'>delete<a></td></tr>";
      }
		str+="<tr><td>"+rs.getInt("id")+"</td><td>"+"<a href='showdetail.jsp?id="+rs.getInt("id")+"'>"+rs.getString("cont")+"</a>"+
		fix;
		if(rs.getInt("isleaf")!=0){
			tree(conn,rs.getInt("id"),1);
		}
		//fix="";
	} 
	 rs.close();
	stmt.close();
	conn.close();                      
%>
<table border="1">
<%= str %>

</table>
<% str="";%>
<%! 

String str="";
private void tree(Connection conn, int id, int lvl ){
	
	Statement stmt=null;
	ResultSet rs=null;
	String prstr="";
	for(int i=0;i<lvl;i++)
	{
		prstr+="----";
	}
	try{
	stmt=conn.createStatement();
	rs=stmt.executeQuery("select * from article where pid="+id);
	while(rs.next()){
	if(login){
	     fix="</td><td><a href='delete.jsp?id="+rs.getInt("id")+"&pid="+rs.getInt("pid")+"'>delete<a></td></tr>";
		}
		str+="<tr><td>"+rs.getInt("id")+"</td><td>"+prstr+"<a href='showdetail.jsp?id="+rs.getInt("id")+"'>"+rs.getString("cont")+"</a>"+
		fix;
		if(rs.getInt("isleaf")!=0){
			tree(conn,rs.getInt("id"),lvl+1);
		}
	}
	}
	catch(SQLException e){
	e.printStackTrace();
	}
	finally{
		try{
			if(rs!=null){
			rs.close();
			rs=null;
			}
			if(stmt!=null){
			stmt.close();
			stmt=null;
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
} 

%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showtree.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<a href="Post.jsp" type=button onclick="postxml()" name="post">post</a>
	<br>
 	<button type=button onclick="Post.jsp">Post</button>
  </body>
</html>
