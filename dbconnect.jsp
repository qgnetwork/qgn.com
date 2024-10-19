<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/quantumglobal";
    String username = "root";  // Replace with your MySQL username
    String password = "root";  // Replace with your MySQL password

    Connection conn = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
