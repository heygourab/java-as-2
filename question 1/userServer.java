import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();
        
        if ("/hello".equals(servletPath)) {
            String username = request.getParameter("username");
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("startTime", System.currentTimeMillis());
            response.sendRedirect("hello.jsp");
        } else if ("/logout".equals(servletPath)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                long startTime = (Long) session.getAttribute("startTime");
                long duration = (System.currentTimeMillis() - startTime) / 1000; // Convert to seconds
                request.setAttribute("duration", duration);
                session.invalidate();
            }
            request.getRequestDispatcher("logout.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}