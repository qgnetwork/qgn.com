<%@ include file="dbconnect.jsp" %>
<%@ page import="java.sql.*" %>

<%
    // Get the ID of the row to delete
    String id = request.getParameter("id");

    // Prepare SQL delete query
    String deleteSQL = "DELETE FROM contact_form WHERE id = ?";
  
    PreparedStatement pstmt = null;

    try {
       
        pstmt = conn.prepareStatement(deleteSQL);
        pstmt.setInt(1, Integer.parseInt(id));

        // Execute delete query
        int rowsDeleted = pstmt.executeUpdate();
        if (rowsDeleted > 0) {
            out.println("<script>alert('Record deleted successfully!'); window.location.href = 'adminDashboard.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to delete record!'); window.location.href = 'adminDashboard.jsp';</script>");
        }
    } catch (Exception e) {
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
