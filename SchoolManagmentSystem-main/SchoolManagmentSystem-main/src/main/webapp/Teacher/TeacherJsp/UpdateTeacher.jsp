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
 String degree = request.getParameter("degree");
 String password = request.getParameter("password");
 String first_name = request.getParameter("first_name");
 String last_name = request.getParameter("last_name");
 String tId = request.getParameter("teacher_id");

// JDBC CONNECTION Details
 String url = "jdbc:postgresql://localhost:5432/scd";
 String username = "postgres";
 String db_password = "";
 
 
//SQL QUERY
String query = "UPDATE public.teacher SET first_name=?, last_name=?, password=?, email=?, degree=? WHERE teacher_id = ?";

 try{
// Making Connection and Statement object
 Class.forName("org.postgresql.Driver");
 Connection con = DriverManager.getConnection(url,username,db_password);
 PreparedStatement ps = con.prepareStatement(query);
 

// Seting Data
 ps.setString(1,first_name);
 ps.setString(2,last_name);
 ps.setString(3,password);
 ps.setString(4,email);
 ps.setString(5,degree);
 ps.setInt(6,Integer.parseInt(tId));
 
 int x = ps.executeUpdate();
 
 if(x>0){
	 out.print("Update Successfully");
	 out.print("<form action='../UpdateTeacher.html' method='get'>");
	 out.print("<button type='submit' class='text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800'>Retrun</button>");
	 out.print("</form>");
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