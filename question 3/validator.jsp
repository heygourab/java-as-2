<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Validation Result</title>
</head>
<body>
    <%
        // Get form input
        String name = request.getParameter("name");
        String ageStr = request.getParameter("age");
        int age = Integer.parseInt(ageStr);

        // Age validation
        if (age < 18) {
    %>
        <h1>Hello <%= name %>, you are not authorized to visit the site.</h1>
    <%
        } else {
    %>
        <h1>Welcome <%= name %> to this site!</h1>
    <%
        }
    %>
</body>
</html>
