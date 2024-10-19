<%@ include file="dbconnect.jsp" %>
<%@ page import="java.sql.*" %>

<%
    // Fetch data from the contact_form table including submission_date
    String query = "SELECT id, name, email, country_code, mobile, subject, message, submission_date FROM contact_form";
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        pstmt = conn.prepareStatement(query);
        rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
            color: #333;
            font-family: 'Arial', sans-serif;
            font-weight: bold;
            text-transform: uppercase;
        }
        .table-container {
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
            background-color: #fff;
            padding: 20px;
        }
        .table {
            margin-top: 20px;
            border-radius: 10px;
        }
        .table thead {
            background-color: #007bff;
            color: white;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .table th {
            font-size: 16px;
            padding: 15px;
        }
        .table td {
            font-size: 14px;
            padding: 12px;
        }
        .btn-danger {
            border-radius: 20px;
        }
        .btn-logout {
            text-align: right;
        }
        .btn-logout button {
            margin-top: 10px;
            background-color: #dc3545;
            color: white;
        }
        .container {
            padding: 30px;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h2 {
            margin: 0;
        }
        .action-buttons form {
            display: inline;
        }
        .card {
            margin-bottom: 20px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="header">
            <h2>Admin Dashboard</h2>
            <!-- Logout Button -->
            <div class="btn-logout">
                <form action="adminpage.html" method="GET">
                    <button type="submit" class="btn btn-danger">Logout</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Table to Display User Submissions -->
    <div class="table-container">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Country Code</th>
                    <th>Mobile</th>
                    <th>Subject</th>
                    <th>Message</th>
                    <th>Submission Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Loop through result set and display data in the table
                    while (rs.next()) {
                        // Get only the date part of the timestamp
                        String submissionDate = rs.getTimestamp("submission_date").toString().split(" ")[0];
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("country_code") %></td>
                    <td><%= rs.getString("mobile") %></td>
                    <td><%= rs.getString("subject") %></td>
                    <td><%= rs.getString("message") %></td>
                    <td><%= submissionDate %></td>
                    <td class="action-buttons">
                        <!-- Delete button for each row -->
                        <form action="deleteEntry.jsp" method="POST" style="display:inline;">
                            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
