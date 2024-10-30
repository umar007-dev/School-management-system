<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Courses</title>
<link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.4/dist/flowbite.min.css" />
</head>

<body>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://unpkg.com/flowbite@1.5.4/dist/flowbite.js"></script>
  
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
          <a href="StudentHomepage.jsp" class="block py-2 pl-3 pr-4 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white" aria-current="page">Home</a>
        </li>
        <li>
          <a href="StudentCourses.jsp"class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Course</a>
        </li>
         <li>
          <a href="StudentRegisterCourse.jsp"class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Register Course</a>
        </li>
        <li>
          <a href="ViewAssignments.jsp" class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">View Assignment</a>
        </li>
         <li>
          <a href="viewFee.jsp" class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">View Fees</a>
        </li>
       
      </ul>
    </div>
  </div>
</nav>
<div class='flex flex-col space-y-6 justify-center items-center min-h-screen'>
<h1 class="text-5xl font-extrabold">Courses</h1>
<div class="overflow-x-auto relative shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="py-3 px-6">
                    Course Code
                </th>
                <th scope="col" class="py-3 px-6">
                    <div class="flex items-center">
                       Course Name
                        <a href="#"><svg xmlns="http://www.w3.org/2000/svg" class="ml-1 w-3 h-3" aria-hidden="true" fill="currentColor" viewBox="0 0 320 512"><path d="M27.66 224h264.7c24.6 0 36.89-29.78 19.54-47.12l-132.3-136.8c-5.406-5.406-12.47-8.107-19.53-8.107c-7.055 0-14.09 2.701-19.45 8.107L8.119 176.9C-9.229 194.2 3.055 224 27.66 224zM292.3 288H27.66c-24.6 0-36.89 29.77-19.54 47.12l132.5 136.8C145.9 477.3 152.1 480 160 480c7.053 0 14.12-2.703 19.53-8.109l132.3-136.8C329.2 317.8 316.9 288 292.3 288z"/></svg></a>
                    </div>
                </th>
            </tr>
        </thead>
        <tbody>
			<%
			String studentId = (String)session.getAttribute("st_id");
			 String url = "jdbc:postgresql://localhost:5432/scd";
			 String username = "postgres";
			 String db_password = "";
			 String sql = "SELECT c.course_code ,c.course_name From student s Join studies t ON s.user_id = t.student_id And s.user_id = " +studentId + "Join course c ON c.course_id = t.course_id";
			 try{
				Class.forName("org.postgresql.Driver");
				Connection con = DriverManager.getConnection(url,username,db_password);
				Statement statement = con.createStatement();
				ResultSet resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
			%>
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
				<td scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"><%=resultSet.getString(1) %></td>
				<td scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"><%=resultSet.getString(2) %></td>
			</tr>
        </tbody>
        <%
			}
			con.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
    </table>
</div>
</div>
</body>
</html>