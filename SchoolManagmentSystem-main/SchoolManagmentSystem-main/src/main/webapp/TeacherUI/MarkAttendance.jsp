<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.4/dist/flowbite.min.css" />
</head>

<body>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://unpkg.com/flowbite@1.5.4/dist/flowbite.js"></script>
  <script src="https://unpkg.com/flowbite@1.5.4/dist/datepicker.js"></script>
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
<%
    	String url = "jdbc:postgresql://localhost:5432/scd";
    	String username = "postgres";
    	String db_password = "";
    	int count = 0;
    	session.setAttribute("code",request.getParameter("id"));
    	try{
    		Class.forName("org.postgresql.Driver");
    		Connection con = DriverManager.getConnection(url,username,db_password);
    		Statement statement = con.createStatement();
    		String sql ="SELECT a.user_id,a.first_name,a.last_name FROM public.course c JOIN studies s ON c.course_id = s.course_id AND c.course_code = " +"'"+request.getParameter("id")+"'"+ "JOIN student a ON s.student_id = a.user_id";
    		ResultSet resultSet = statement.executeQuery(sql);
          	
   %>

 <div class="flex flex-col items-center justify-center mt-3 space-y-8">
 <h1 class="text-3xl font-semibold text-blue-700">Programming Fundamentals</h1>
 <form action="mark.jsp" action="get">
 
<div class="mb-4">
 <h1 class='text-xl'>Select the date</h1>
 <div class="relative">
  <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
    <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
  </div>
  <input name="date" datepicker type="text" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Select date">
</div>
</div>
 
 <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="py-3 px-6">
                    Student Id 
                </th>
                <th scope="col" class="py-3 px-6">
                    <div class="flex items-center">
                       Student Name
                        <a href="#"><svg xmlns="http://www.w3.org/2000/svg" class="ml-1 w-3 h-3" aria-hidden="true" fill="currentColor" viewBox="0 0 320 512"><path d="M27.66 224h264.7c24.6 0 36.89-29.78 19.54-47.12l-132.3-136.8c-5.406-5.406-12.47-8.107-19.53-8.107c-7.055 0-14.09 2.701-19.45 8.107L8.119 176.9C-9.229 194.2 3.055 224 27.66 224zM292.3 288H27.66c-24.6 0-36.89 29.77-19.54 47.12l132.5 136.8C145.9 477.3 152.1 480 160 480c7.053 0 14.12-2.703 19.53-8.109l132.3-136.8C329.2 317.8 316.9 288 292.3 288z"/></svg></a>
                    </div>
                </th>
                <th scope="col" class="py-3 px-6">
                    <div class="flex items-center">
                        Attendance
                        <a href=""><svg xmlns="http://www.w3.org/2000/svg" class="ml-1 w-3 h-3" aria-hidden="true" fill="currentColor" viewBox="0 0 320 512"><path d="M27.66 224h264.7c24.6 0 36.89-29.78 19.54-47.12l-132.3-136.8c-5.406-5.406-12.47-8.107-19.53-8.107c-7.055 0-14.09 2.701-19.45 8.107L8.119 176.9C-9.229 194.2 3.055 224 27.66 224zM292.3 288H27.66c-24.6 0-36.89 29.77-19.54 47.12l132.5 136.8C145.9 477.3 152.1 480 160 480c7.053 0 14.12-2.703 19.53-8.109l132.3-136.8C329.2 317.8 316.9 288 292.3 288z"/></svg></a>
                    </div>
                </th>
             
         
            </tr>
        </thead>
      	<tbody>
      	<%
     
    	while(resultSet.next()){
    		count++;
      	%>
      	 <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
				<td scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"><%=resultSet.getString(1) %></td>
				<td scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"><%=resultSet.getString(2) + "  " + resultSet.getString(3) %></td>
				<td scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
				<div class="flex items-center mb-4">
    				<input id="p" type="radio" checked value=<%out.print("P," + resultSet.getString(2) + "," + resultSet.getString(3)+","+resultSet.getString(1)); %> name=<%out.print(count);%> class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600 ">
   					<label for="p" class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">Present</label>
				</div>
				<div class="flex items-center mb-4">
    				<input id="a" type="radio" value=<%out.print("A," + resultSet.getString(2) + "," + resultSet.getString(3)+","+resultSet.getString(1)); %> name=<%out.print(count);%> class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600 ">
   					<label for="a" class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">Absent</label>
				</div>
				</td>
		</tr>
      	</tbody>
      	  <%
      	  
			}
    	    session.setAttribute("count",count);
			con.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
    	
		%>
		
		
  </table>
  
  <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Mark Attendance</button>
 </form>
 
 </div>

</body>
</html>