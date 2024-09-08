<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cookie List</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Cookies List</h1>
    
    <table>
        <tr>
            <th>Cookie Name</th>
            <th>Cookie Value</th>
        </tr>
        <%
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
        %>
            <tr>
                <td><%= cookie.getName() %></td>
                <td><%= cookie.getValue() %></td>
            </tr>
        <%
            }
        } else {
        %>
            <tr>
                <td colspan="2">No cookies found</td>
            </tr>
        <%
        }
        %>
    </table>
    
    <br>
    <a href="index.jsp">Back to Home</a>
</body>
</html>