<%@ include file="dbconnect.jsp" %>
<%@ page import="java.sql.*" %>

<%
    // Get form values
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String countryCode = request.getParameter("countryCode");
    String mobile = request.getParameter("mobile");
    String subject = request.getParameter("subject");
    String message = request.getParameter("message");

    // Prepare SQL insert statement
    String insertSQL = "INSERT INTO contact_form (name, email, country_code, mobile, subject, message) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement pstmt = null;

    try {
        pstmt = conn.prepareStatement(insertSQL);
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, countryCode);
        pstmt.setString(4, mobile);
        pstmt.setString(5, subject);
        pstmt.setString(6, message);

        // Execute the insert statement
        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            // If insertion is successful, show a dialog box
            out.println("<script type='text/javascript'>");
            out.println("alert('Thank you for getting in touch! Your message has been submitted successfully.');");
            out.println("window.location.href = 'index.html';"); // Optional: Redirect to another page
            out.println("</script>");
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Failed to submit your message. Please try again later.');");
            out.println("window.location.href = 'index.html';"); // Optional: Redirect to another page
            out.println("</script>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
