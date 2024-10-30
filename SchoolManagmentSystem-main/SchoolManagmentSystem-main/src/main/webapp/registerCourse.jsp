<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 String code = request.getParameter("code");
 String desc = request.getParameter("desc");
 String credit = request.getParameter("credit");


 // JDBC CONNECTION Details
  String url = "jdbc:postgresql://localhost:5432/scd";
  String username = "postgres";
  String db_password = "";
  
  
 //SQL QUERY
//SQL QUERY
String query = "INSERT INTO public.course(course_code, course_name, credits) VALUES (?, ?, ?)";

 try{
// Making Connection and Statement object
 Class.forName("org.postgresql.Driver");
 Connection con = DriverManager.getConnection(url,username,db_password);
 PreparedStatement ps = con.prepareStatement(query);

 
// Seting Data
 ps.setString(1,code);
 ps.setString(2,desc);
 ps.setString(3,credit);
 
 int x = ps.executeUpdate();
 
 if(x>0){
	 out.print("Course Registerd Successfully");
	 out.print("<form action='homepage.html' method=get''>");
	 out.print("<input type='submit'>");
	 out.print("</form>");
 }
 else{
	 out.print("Course Registration Failed");
 }
 
 }catch(Exception e){
	 out.print(e);
 } 
 %>
 
 
</body>
</html>