<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(request.getParameter("email").equals("admin@admin.com") && request.getParameter("password").equals("adminadmin")){
	response.sendRedirect("homepage.html");
}
else{
	out.print("invalid cred");
}
%>
</body>
</html>