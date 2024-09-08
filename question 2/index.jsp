<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cookie Lister</title>
</head>
<body>
    <h1>Cookie Lister</h1>
    <form action="listCookies.jsp" method="post">
        <input type="submit" value="List Cookies">
    </form>
    
    <%-- Let's add some sample cookies for demonstration purposes --%>
    <%
        Cookie cookie1 = new Cookie("SampleCookie1", "Value1");
        Cookie cookie2 = new Cookie("SampleCookie2", "Value2");
        Cookie cookie3 = new Cookie("SampleCookie3", "Value3");
        
        response.addCookie(cookie1);
        response.addCookie(cookie2);
        response.addCookie(cookie3);
    %>
</body>
</html>