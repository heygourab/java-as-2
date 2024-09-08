<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout Page</title>
</head>
<body>
    <h2>Thank You, <%= session.getAttribute("username") %>!</h2>
    <p>You used the application for <%= request.getAttribute("duration") %> seconds.</p>
    
    <a href="index.jsp">Back to Login</a>
</body>
</html>