<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.print(session.getAttribute("code"));
int count = (int)session.getAttribute("count");
Integer j = 1;
ArrayList<String> array = new ArrayList<String>();
for(int i =0; i < count; i++){
	array.add(request.getParameter(j.toString()));
	j++;
}
String url = "jdbc:postgresql://localhost:5432/scd";
String username = "postgres";
String db_password = "";
try{
	String sql = "INSERT INTO public.attendance(student_name, student_id, course_code, date, attendance) VALUES ( ?, ?, ?, ?, ?)";
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection(url,username,db_password);
	PreparedStatement ps = con.prepareStatement(sql);
	for(int i = 0; i < count; i++){
		String[] s = array.get(i).split(",");
		String att = s[0];
		String name = s[1]+" "+s[2];
		int id = Integer.parseInt(s[3]);
		ps.setString(1, name);
		ps.setInt(2,id);
		ps.setString(3,(String)session.getAttribute("code"));
		ps.setString(4,request.getParameter("date"));
		ps.setString(5,att);
		
		int x = ps.executeUpdate();
		if(x > 0){
		
		out.println("Attendance Marked");
		out.println("<br>");
		
		}
		else{
			out.print("Attendance Not Marked");
		}
	}
}
catch(Exception e){
 out.print(e);
}
%>
<form action="Attendance.jsp" method='get'>
	<button type='submit'>Return</button>
</form>
</body>
</html>