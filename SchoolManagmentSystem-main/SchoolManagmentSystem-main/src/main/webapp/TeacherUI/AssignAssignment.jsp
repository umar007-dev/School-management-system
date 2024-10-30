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
	String aName = request.getParameter("assignment_name");
	String cName = request.getParameter("course_code");
	String date = request.getParameter("date");
	String url = "jdbc:postgresql://localhost:5432/scd";
	String username = "postgres";
	String db_password = "";
	try{
		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection(url,username,db_password);
		String sql = "INSERT INTO public.assignment(assignment_name, course_code, date) VALUES (?, ?, ?)";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1,aName);
		statement.setString(2,cName);
		statement.setString(3,date);
		int x = statement.executeUpdate();
		if(x>0){	
%>
<form action='AddAssignment.jsp' method='get'>
	Assignment Added
	<button type='submit'>Return</button>
</form>
<%
		}
	}catch(Exception e){
		out.print(e);
	}
%>
</body>
</html>