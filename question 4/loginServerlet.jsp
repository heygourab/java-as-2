import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get username and password from request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Database connection variables
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl"; // Replace with your DB info
        String dbUser = "your_db_username";
        String dbPassword = "your_db_password";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish connection
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Prepare SQL query to validate user credentials
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            // Execute the query
            rs = pstmt.executeQuery();

            // Check if the user exists
            if (rs.next()) {
                // Successful login
                out.println("<h1>Welcome, " + username + "!</h1>");
            } else {
                // Failed login
                out.println("<h1>Login Failed. Invalid username or password.</h1>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h1>Database connection problem!</h1>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
