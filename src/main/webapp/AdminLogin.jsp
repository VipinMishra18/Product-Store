<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
        
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
            width: fit-content;
        }
        
        h3 {
            margin: 15px 0;
            width: 100%;
            text-align: center;
        }
        
        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
            min-width: 200px;
            text-align: center;
        }
        
        a:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        a[href="logout"] {
            background-color: #e74c3c;
            margin-top: 30px;
        }
        
        a[href="logout"]:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <%
        AdminBean ab = (AdminBean)session.getAttribute("abean");
    %>
    <h2>Welcome App-Admin <%=ab.getfName()%></h2>
    
    <h3><a href="Product.html">Add-Product</a></h3>
    <h3><a href="view">View-All-Product</a></h3>
    <h3><a href="logout">Logout</a></h3>
</body>
</html>