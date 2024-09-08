<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Intrinsic Object Example</title>
</head>
<body>
    <h1>Values from Intrinsic Objects</h1>

    <h2>Using `request` Object:</h2>
    <%
        // Fetch data from the request object (from the form submission)
        String username = request.getParameter("username");
        String age = request.getParameter("age");

        out.println("Username: " + username + "<br>");
        out.println("Age: " + age + "<br>");
    %>

    <h2>Using `response` Object:</h2>
    <%
        // Set a new response header
        response.setHeader("Custom-Header", "JSP Example");
        out.println("Custom Header: " + response.getHeader("Custom-Header") + "<br>");
    %>

    <h2>Using `session` Object:</h2>
    <%
        // Store user data in session and retrieve it
        session.setAttribute("user", username);
        out.println("Stored Username in Session: " + session.getAttribute("user") + "<br>");
    %>

    <h2>Using `application` Object:</h2>
    <%
        // Store application-level data
        application.setAttribute("appVersion", "1.0");
        out.println("Application Version: " + application.getAttribute("appVersion") + "<br>");
    %>

    <h2>Using `pageContext` Object:</h2>
    <%
        // Access session via pageContext and fetch attributes
        out.println("Username from PageContext Session: " + pageContext.getSession().getAttribute("user") + "<br>");
    %>

    <h2>Using `config` Object:</h2>
    <%
        // Use config to fetch servlet configuration
        out.println("Servlet Name from Config: " + config.getServletName() + "<br>");
    %>

