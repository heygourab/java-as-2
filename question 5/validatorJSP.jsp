<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Email Validation Result</title>
</head>
<body>
    <h1>Email Validation Result</h1>

    <%
        // Get the email parameter from the form
        String email = request.getParameter("email");

        // Method to validate email according to the provided criteria
        boolean isValid = false;

        if (email != null && email.contains("@") && email.contains(".")) {
            // Split email into two parts: before and after "@"
            String[] parts = email.split("@");

            if (parts.length == 2) {
                String localPart = parts[0]; // Before "@"
                String domainPart = parts[1]; // After "@"

                // Ensure there is exactly one "@" symbol, and domain contains a "."
                if (domainPart.contains(".")) {
                    String[] domainParts = domainPart.split("\\.");

                    if (domainParts.length >= 2) {
                        String betweenAtAndDot = domainParts[0]; // Part between "@" and "."
                        String afterDot = domainParts[1]; // Part after the last "."

                        // Check conditions:
                        // - At least 2 characters between "@" and "."
                        // - At least 2 characters after the last "."
                        if (betweenAtAndDot.length() >= 2 && afterDot.length() >= 2) {
                            isValid = true;
                        }
                    }
                }
            }
        }

        // Output the result
        if (isValid) {
            out.println("<h2>Email is valid!</h2>");
        } else {
            out.println("<h2>Invalid email format!</h2>");
        }
    %>

    <br><br>
    <a href="index.html">Go Back</a>
</body>
</html>
