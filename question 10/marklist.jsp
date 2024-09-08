<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Mark List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Mark List</h1>
        <%
            String regNumber = request.getParameter("regNumber");
            
            // JDBC connection parameters
            String url = "jdbc:mysql://localhost:3306/your_database_name";
            String user = "your_username";
            String password = "your_password";
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                
                String sql = "SELECT * FROM students WHERE reg_number = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, regNumber);
                
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
        %>
                    <table>
                        <tr>
                            <th>Register Number</th>
                            <td><%= rs.getString("reg_number") %></td>
                        </tr>
                        <tr>
                            <th>Name</th>
                            <td><%= rs.getString("name") %></td>
                        </tr>
                        <tr>
                            <th>Subject 1</th>
                            <td><%= rs.getInt("subject1") %></td>
                        </tr>
                        <tr>
                            <th>Subject 2</th>
                            <td><%= rs.getInt("subject2") %></td>
                        </tr>
                        <tr>
                            <th>Subject 3</th>
                            <td><%= rs.getInt("subject3") %></td>
                        </tr>
                        <tr>
                            <th>Total</th>
                            <td><%= rs.getInt("subject1") + rs.getInt("subject2") + rs.getInt("subject3") %></td>
                        </tr>
                    </table>
        <%
                } else {
        %>
                    <p class="error">No student found with the given register number.</p>
        <%
                }
            } catch(Exception e) {
                out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { /* ignored */ }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { /* ignored */ }
                if (conn != null) try { conn.close(); } catch (SQLException e) { /* ignored */ }
            }
        %>
    </div>
</body>
</html>