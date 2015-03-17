<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  
  <%String post=request.getParameter("method"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
  <%if(post.equals("post")&&post!=null) {%>
  <%String id= request.getParameter("id"); %>
  <%String pwd= request.getParameter("password"); %>
   <% if (id.equals("1")&&pwd.equals("123")){
   	session.setAttribute("admin", "true");
   	response.sendRedirect("show.jsp?page=1");
   	
   }else{
   	response.sendRedirect("index.html");
   } %>
    <%}
    else{
    %>
    plz login<br>
    <% 
    }
     %>
  </body>
</html>
