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

//Get Parameter from registration form
 String code = request.getParameter("code");
 String tcode = request.getParameter("teacherCode");

// JDBC CONNECTION Details
 String url = "jdbc:postgresql://localhost:5432/scd";
 String username = "postgres";
 String db_password = "";
 
 
//SQL QUERY
 String query = "INSERT INTO public.teaches(course_id, teacher_id) VALUES (?, ?)";

 try{
// Making Connection and Statement object
 Class.forName("org.postgresql.Driver");
 Connection con = DriverManager.getConnection(url,username,db_password);
 PreparedStatement ps = con.prepareStatement(query);
 
 int c = Integer.parseInt(code);
 int tc = Integer.parseInt(tcode);
// Seting Data
 ps.setInt(1,c);
 ps.setInt(2,tc);

 
 int x = ps.executeUpdate();
 
 if(x>0)
 {
	 out.print("Registerd Successfully");
	 out.print("<form action='homepage.html' method='get'>");
	 out.print("<button type='submit' class='text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800'>Homepage</button>");
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