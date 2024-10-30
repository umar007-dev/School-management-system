<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance</title>
<link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.4/dist/flowbite.min.css" />
</head>

<body>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://unpkg.com/flowbite@1.5.4/dist/flowbite.js"></script>
  
<div class='mx-5 py-4'>
<nav class="bg-white border-gray-200 px-2 sm:px-4 py-2.5 rounded dark:bg-gray-900">
  <div class="container flex flex-wrap items-center justify-between mx-auto">
    <a href="homepage.html" class="flex items-center">
        <img src="../fast.png" class="h-6 mr-3 sm:h-9" alt="Flowbite Logo" />
        <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">FAST NUCES</span>
    </a>
    <button data-collapse-toggle="navbar-default" type="button" class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-default" aria-expanded="false">
      <span class="sr-only">Open main menu</span>
      <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
    </button>
    <div class="hidden w-full md:block md:w-auto" id="navbar-default">
       <ul class="flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
        <li>
          <a href="TeacherHomepage.jsp" class="block py-2 pl-3 pr-4 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white" aria-current="page">Home</a>
        </li>
        <li>
          <a href="TeacherCourse.jsp"class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Course</a>
        </li>
        <li>
          <a href="Attendance.jsp" class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Attendance</a>
        </li>
         <li>
          <a href="AddAssignment.jsp" class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Assignment</a>
        </li>
       
      </ul>
    </div>
  </div>
</nav>
<aside class="w-[30%] mt-5" aria-label="Sidebar">
   <div class="overflow-y-auto py-4 px-3 bg-gray-50 rounded dark:bg-gray-800">
      <ul class="space-y-2">
<%
	String url = "jdbc:postgresql://localhost:5432/scd";
	String username = "postgres";
	String db_password = "";
	try{
		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection(url,username,db_password);
		Statement statement = con.createStatement();
		String sql ="SELECT c.* FROM public.teacher t JOIN teaches e ON t.teacher_id = e.teacher_id AND t.teacher_id = " + session.getAttribute("id") + " JOIN course c ON c.course_id = e.course_id";
		ResultSet resultSet = statement.executeQuery(sql);
		String cName;
	while(resultSet.next()){
%>

         <li>
            <a href=<%out.print("AssignmentData.jsp?id="+resultSet.getString(2));%> class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
               <svg aria-hidden="true" class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 4a3 3 0 00-3 3v6a3 3 0 003 3h10a3 3 0 003-3V7a3 3 0 00-3-3H5zm-1 9v-1h5v2H5a1 1 0 01-1-1zm7 1h4a1 1 0 001-1v-1h-5v2zm0-4h5V8h-5v2zM9 8H4v2h5V8z" clip-rule="evenodd"></path></svg>
               <span class="flex-1 ml-3 whitespace-nowrap"><%out.print(resultSet.getString(2) + "   " + resultSet.getString(3)); %></span>
            </a>
         </li>

 <%
			}
			con.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
%>
      </ul>
   </div>
</aside>
</div>


</body>
</html>