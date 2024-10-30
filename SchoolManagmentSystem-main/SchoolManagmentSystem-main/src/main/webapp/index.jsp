<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 String url = "jdbc:postgresql://localhost:5432/scd";
 String username = "postgres";
 String password = "";
 String query = "SELECT id, name FROM public.test";
 Class.forName("org.postgresql.Driver");
 Connection con = DriverManager.getConnection(url,username,password);
 Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery(query);
 while(rs.next()){
	 out.print("ID = " + rs.getInt(1));
	 out.print("<br>");
	 out.print("Name = " + rs.getString(2));
 }
%>


</body>
</html>