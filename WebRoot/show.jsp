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
int pageno=Integer.parseInt(request.getParameter("page"));

int tottal=0;
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/BBS?" +
	                                   "user=root&password=yeapp123");
Statement stmt = conn.createStatement();
ResultSet pageRs=stmt.executeQuery("select count(*) from article where pid=0");
pageRs.next();
tottal=(pageRs.getInt(1)/3)+1;
if(pageno<=0){
pageno=1;
}else if(pageno>tottal){
pageno=tottal;
}
ResultSet rs = stmt.executeQuery("select * from article where pid=0 limit "+(pageno-1)*3+",3");
      while(rs.next()){
      if(login){
      	fix="</td><td><a href='delete.jsp?id="+rs.getInt("id")+"&pid="+rs.getInt("pid")+"'>delete<a></td></tr>";
      }
		str+="<tr><td>"+rs.getInt("id")+"</td><td>"+"<a href='showdetail.jsp?id="+rs.getInt("id")+"'>"+rs.getString("cont")+"</a>";
		//fix;
		//fix="";
	} 
	 rs.close();
	stmt.close();
	conn.close();                      
%>
<table border="1">
<%= str %>
</table>
<br>
page <%= pageno%>
<br>
tottal <%= tottal%>
<br>
<a href="show.jsp?page=<%=pageno-1 %>">prepage</a>
<a href="show.jsp?page=<%=pageno+1 %>">nextpage</a>
<br>

<form name="form1" acrion="show.jsp">
<select name="page" onchange="document.form1.submit()">
<%for(int i=1;i<=tottal;i++) {%>
<option value=<%=i%> <%=(i==pageno)?"selected":"" %>>page <%=i %>
<%} %>

</select>
</form>
<br>
<form name="form2" action="show.jsp">
<input name="page" type="text" value="<%=pageno %>">
<input type="submit" value="go" >
</form>
<br>
<%for(int i=1;i<=tottal;i++){ %>
<a href="show.jsp?page=<%=i %>" > <%=i %></a>

<%} %>

<br>
<% str="";%>
<%! 
String str="";
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
