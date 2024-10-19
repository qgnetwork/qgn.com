<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    // Hardcoded credentials for demo purposes
    String validEmail = "info@quantumglobalnetworks.com";
    String validPassword = "987654321";

    // Get email and password from form
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if (email != null && password != null) {
        if (email.equals(validEmail) && password.equals(validPassword)) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Login successful!');");
            out.println("window.location.href = 'adminDashboard.jsp';");
            out.println("</script>");
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Invalid credentials! Please try again.');");
            out.println("window.location.href = 'adminLogin.jsp';");
            out.println("</script>");
        }
    }
%>
