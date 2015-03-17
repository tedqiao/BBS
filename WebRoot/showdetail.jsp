<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>
  
 <Script>
  	
      function loadjsp(id,rootid){
      	var xmlhttp;
     	var myid=id;
			if (window.XMLHttpRequest)
 			 {// code for IE7+, Firefox, Chrome, Opera, Safari
				  xmlhttp=new XMLHttpRequest();
  			}
			else
 			 {// code for IE6, IE5
 				 xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
 			 }
 			 xmlhttp.onreadystatechange=function()
  				{
  				if (xmlhttp.readyState==4 && xmlhttp.status==200)
   					 {
   						 document.getElementById("test").innerHTML=xmlhttp.responseText;				
   					 }
   					else
 				 {
 				 document.getElementById("test").innerHTML="error";
 				 }
 				 }
 				 
			xmlhttp.open("GET","repley.jsp?id="+myid+"&rootid="+rootid,true);
		    xmlhttp.send();
		    
		   
      } 
 
  	</Script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showdetail.jsp' starting page</title>
    
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
  <table border="1">

  <%//show data
    Class.forName("com.mysql.jdbc.Driver");
	Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1/BBS?" +
	                                   "user=root&password=yeapp123");
	Statement stmt2 = conn2.createStatement();
	ResultSet rs2 = stmt2.executeQuery("select * from article where id="+request.getParameter("id"));
	
	%>
	<%!int id;
  	int rootid;
  %>
	<tr><td>ID</td><td>context</td></tr>
  <% 	
  		if(rs2.next()){
  		id=rs2.getInt("id");
  		rootid=rs2.getInt("rootid");
  %>
  		<tr>
  		
  			<td><%= id %></td>
 
  			<td><%= rs2.getString("cont") %></td>
  		</tr>	
  	
		
  <%
		}  
	rs2.close();
	stmt2.close();
	conn2.close();   
  %>
  	</table>
  	
 <button type="button" name="jsploader" onclick="loadjsp(<%=id %>,<%=rootid %>)" value="clickme">click me </button>
  <div id="test" name="test">show here</div>
   <br>
  </body>
</html>
