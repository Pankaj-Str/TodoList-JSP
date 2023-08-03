<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todo List</title>
</head>
<body>
	<%-- check if the todo list  attribute exists in the session --%>
	<%
		
	if(session.getAttribute("todoList")==null)
	{
		session.setAttribute("todoList", new java.util.ArrayList<String>());
		
	}
	
	%>
	
	<%-- add new todo item to the list  --%>
	
	<% 
	String todoItem = request.getParameter("todoitem"); 
	if(todoItem != null && !todoItem.isEmpty()){
		java.util.ArrayList<String> todoList =(java.util.ArrayList<String>) session.getAttribute("todoList");
		
		todoList.add(todoItem);
		session.setAttribute("todoList", todoList);
	}
	
	
	%>
	
	<%-- Display the todo list --%>
	
	
	<ul>
	
		<%
		java.util.ArrayList<String> todoList = (java.util.ArrayList<String>) session.getAttribute("todoList");
			
				if(todoList != null && !todoList.isEmpty()){
					
					for(String item : todoList){
						{ %>
		                 <li><%= item %></li>
		            	<% 
		               }
					}
				}else{
					%>
		           	 <li>No items in the todo list.</li>
		        	<% 
				}
		
		%>
	
	</ul>
	
	<a href="index.jsp">Go back to add more items</a>
</body>
</html>