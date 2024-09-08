<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hello Page</title>
    <style>
        .top-right {
            position: absolute;
            top: 10px;
            right: 10px;
        }
    </style>
</head>
<body>
    <div class="top-right">
        Start time: <%= new Date((Long)session.getAttribute("startTime")) %>
    </div>
    
    <h2>Hello, <%= session.getAttribute("username") %>!</h2>
    
    <form action="logout" method="post">
        <input type="submit" value="Logout">
    </form>
</body>
</html>