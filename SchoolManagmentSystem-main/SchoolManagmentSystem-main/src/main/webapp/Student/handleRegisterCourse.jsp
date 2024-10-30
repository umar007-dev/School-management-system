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
	String c  = request.getParameter("cId");
	String sid  = request.getParameter("sId");
	String url = "jdbc:postgresql://localhost:5432/scd";
	String username = "postgres";
	String db_password = "";
	try{
		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection(url,username,db_password);
		String sql = "Select course_id from public.course where course_code = '"+c+"';";
		String sql2 = "INSERT INTO public.studies(course_id, student_id) VALUES (?, ?)";
		Statement statement = con.createStatement();
		ResultSet rs = statement.executeQuery(sql);
		if(rs.next()){
			int cID = rs.getInt("course_id");
			PreparedStatement ps = con.prepareStatement(sql2);
			ps.setInt(1, cID);
			ps.setInt(2,Integer.parseInt(sid));
			int x = ps.executeUpdate();
			if(x > 0){
				out.print("Course Registered");
			}
		}else{
			out.print("AAA");
			out.print("Code = " + c);
		}
	}catch(SQLException e){
		String x = e.getSQLState();
		if(x.equals("23505")){
			out.print("Course Already Registered");
			out.print("<br>");	
		}else{
			out.print(e);
		}
		
	}

%>
</body>
</html>