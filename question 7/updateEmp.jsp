<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Update</title>
</head>
<body>
    <h1>Employee Update Status</h1>

    <%
        // Get form data from the request
        String empid = request.getParameter("empid");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String desg = request.getParameter("desg");
        String salary = request.getParameter("salary");

        // Database connection variables
        String url = "jdbc:mysql://localhost:3306/yourDatabaseName"; // Change with your DB details
        String user = "root"; // Your DB username
        String password = "password"; // Your DB password
        Connection conn = null;
        PreparedStatement stmt = null;
        String message = "Updating Error";

        try {
            // Load JDBC driver (For MySQL)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            conn = DriverManager.getConnection(url, user, password);

            // Prepare SQL UPDATE query
            String sql = "UPDATE Employee SET name=?, age=?, desg=?, salary=? WHERE empid=?";

            stmt = conn.prepareStatement(sql);

            // Set parameters for the prepared statement
            stmt.setString(1, name);
            stmt.setInt(2, Integer.parseInt(age));
            stmt.setString(3, desg);
            stmt.setDouble(4, Double.parseDouble(salary));
            stmt.setInt(5, Integer.parseInt(empid));

            // Execute the update
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                message = "Updating Success";
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }

        // Display the result
        out.println("<h2>" + message + "</h2>");
    %>

    <br><br>
    <a href="index.html">Go Back</a>
</body>
</html>
