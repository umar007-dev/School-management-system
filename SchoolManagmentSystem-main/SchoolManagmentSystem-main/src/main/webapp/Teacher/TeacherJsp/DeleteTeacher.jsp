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
 String code = request.getParameter("tId");

 // JDBC CONNECTION Details
  String url = "jdbc:postgresql://localhost:5432/scd";
  String username = "postgres";
  String db_password = "";
  
  

//SQL QUERY
String updateQuery = "DELETE FROM public.teacher WHERE teacher_id = ?";            
 try{
// Making Connection and Statement object
 Class.forName("org.postgresql.Driver");
 Connection con = DriverManager.getConnection(url,username,db_password);
 PreparedStatement ps = con.prepareStatement(updateQuery);

 
// Seting Data
 ps.setInt(1,Integer.parseInt(code));
 
 int x = ps.executeUpdate();
 
 if(x>0){
	 out.print("Teacher Deleted Successfully");
	 out.print("<form action='../DeleteTeacher.html' method='get'>");
	 out.print("<button type='submit' class='text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800'>Homepage</button>");
	 out.print("</form>");
		
 }
 else{
	 out.print(x);
	 out.print("<br>");
	 out.print("Course Updation Failed");
 }
 
 }catch(Exception e){
	 out.print("Course Updation Failed");
	 out.print("<br>");
	 out.print(e);
 } 
 %>
 
 
</body>
</html>