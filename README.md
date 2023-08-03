# Simple Todo list using JSP


To create a simple todo list using JSP (JavaServer Pages), you'll need to set up a basic web application with a server like Apache Tomcat and use JSP along with HTML and CSS to implement the frontend. Here's a step-by-step guide to create a basic todo list:

Step 1: Set up your development environment
- Install Apache Tomcat or any other servlet container that supports JSP.
- Create a new folder for your project.

Step 2: Create the project structure
Inside your project folder, create the following structure:

```
- /WEB-INF
    - /classes
    - /lib
- /WEB-INF/web.xml
- /index.jsp
- /todo.jsp
```

Step 3: Configure `web.xml`
In the `web.xml` file, add the following code to configure the JSP servlet:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://java.sun.com/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/javaee
                             http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
         version="3.0">

    <display-name>TodoListApp</display-name>
    
    <!-- Add JSP servlet mapping -->
    <servlet>
        <servlet-name>jsp</servlet-name>
        <servlet-class>org.apache.jasper.servlet.JspServlet</servlet-class>
    </servlet>
    
    <servlet-mapping>
        <servlet-name>jsp</servlet-name>
        <url-pattern>*.jsp</url-pattern>
    </servlet-mapping>
</web-app>
```

Step 4: Create `index.jsp`
In `index.jsp`, we'll create a simple form to submit new todo items. Here's the code:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Todo List</title>
</head>
<body>
    <h1>Todo List</h1>
    <form action="todo.jsp" method="post">
        <input type="text" name="todoItem" placeholder="Enter a new todo item">
        <input type="submit" value="Add">
    </form>
</body>
</html>
```

Step 5: Create `todo.jsp`
In `todo.jsp`, we'll handle the form submission and display the list of todo items. We'll use a session attribute to store the list temporarily. Here's the code:

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Todo List</title>
</head>
<body>
    <h1>Todo List</h1>
    
    <%-- Check if the todo list attribute exists in the session --%>
    <% if (session.getAttribute("todoList") == null) {
        session.setAttribute("todoList", new java.util.ArrayList<String>());
    } %>
    
    <%-- Add new todo item to the list --%>
    <% String todoItem = request.getParameter("todoItem");
    if (todoItem != null && !todoItem.isEmpty()) {
        java.util.ArrayList<String> todoList = (java.util.ArrayList<String>) session.getAttribute("todoList");
        todoList.add(todoItem);
        session.setAttribute("todoList", todoList);
    } %>
    
    <%-- Display the todo list --%>
    <ul>
        <% java.util.ArrayList<String> todoList = (java.util.ArrayList<String>) session.getAttribute("todoList");
        if (todoList != null && !todoList.isEmpty()) {
            for (String item : todoList) { %>
                <li><%= item %></li>
            <% }
        } else { %>
            <li>No items in the todo list.</li>
        <% } %>
    </ul>
    
    <a href="index.jsp">Go back to add more items</a>
</body>
</html>
```

Step 6: Deploy and Run
- Place both `index.jsp` and `todo.jsp` in the root folder of your web application.
- Deploy the application on your Apache Tomcat server.
- Open your web browser and navigate to `http://localhost:<port>/index.jsp`, where `<port>` is the port number for your Apache Tomcat server.

Now you should have a simple todo list application that allows you to add items and displays the list of todos using JSP and a session attribute to store the data temporarily.
