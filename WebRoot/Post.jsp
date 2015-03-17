<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'repley.jsp' starting page</title>
    
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
   <form action="postOK.jsp" method="post">
   	<input type="hidden" name="action" value="post">

   	<table border="1">
   
   		<tr>
   			<td>theme</td><td><input name="theme" type="text" name="title" value="type theme here"></td>
   		</tr>
   		<tr>
   			<td>repley</td><td><textarea name="text" tpye="text" cols="80" rows="12" value="type context here"></textarea></td>
   		</tr>
   		<tr>
   			<td></td><td><input type="submit"  value="submit"></td>
   		</tr>
   	</table>
   
   </form> <br>
  </body>
</html>
