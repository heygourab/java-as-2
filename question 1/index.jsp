
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <h2>Welcome! Please enter your name:</h2>
    <form action="hello" method="post">
        <input type="text" name="username" required>
        <input type="submit" value="Submit">
    </form>
</body>
</html>