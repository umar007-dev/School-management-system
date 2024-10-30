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


// JDBC CONNECTION Details
 String url = "jdbc:postgresql://localhost:5432/scd";
 String username = "postgres";
 String db_password = "";
 
 
//SQL QUERY
String query = "SELECT teacher_id FROM public.teacher WHERE email = " + "'" +email + "'" + " AND password = "+"'"+password+"'";

 try{
// Making Connection and Statement object
 Class.forName("org.postgresql.Driver");
 Connection con = DriverManager.getConnection(url,username,db_password);
 Statement statement = con.createStatement();
 

// Seting Data


 ResultSet rs = statement.executeQuery(query);
 
 if(rs.next()){
	 out.print("Login successfully");
	 session.setAttribute("id",rs.getInt(1));
	 response.sendRedirect("http://localhost:8080/ScdProject/TeacherUI/TeacherHomepage.jsp");
 }
 
 
 }catch(Exception e){
	 out.print(email);
	 out.print(password);
	 out.print(e);
	 out.print(e.getMessage());
}


%>
 <form action="TeacherLogin.html" method="post">
 <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Retry</button>
 </form>


</body>
</html>