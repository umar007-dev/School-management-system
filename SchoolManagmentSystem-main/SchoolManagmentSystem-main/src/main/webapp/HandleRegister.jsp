<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<%

//Get Parameter from registration form
String email = request.getParameter("email");
String password = request.getParameter("password");
String repeat_password = request.getParameter("repeat_password");
String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");

// JDBC CONNECTION Details
 String url = "jdbc:postgresql://localhost:5432/scd";
 String username = "postgres";
 String db_password = "";
 
 
//SQL QUERY
String query = "INSERT INTO public.student(email, first_name, last_name, password) VALUES (?, ?, ?, ?)";

 try{
// Making Connection and Statement object
 Class.forName("org.postgresql.Driver");
 Connection con = DriverManager.getConnection(url,username,db_password);
 PreparedStatement ps = con.prepareStatement(query);
 

// Seting Data
 ps.setString(1,email);
 ps.setString(2,first_name);
 ps.setString(3,last_name);
 ps.setString(4,password);
 
 int x = ps.executeUpdate();
 
 if(x>0){
	 out.print("Registerd Successfully");
	 response.sendRedirect("http://localhost:8080/ScdProject/login.html");
 }
 else{
	 out.print("Registration Failed");
 }
 
 }catch(Exception e){
	 out.print(e);
 }


%>



</body>
</html>