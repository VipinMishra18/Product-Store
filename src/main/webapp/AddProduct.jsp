<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .dashboard-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 50px;
            width: 80%;
            max-width: 600px;
        }
        
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }
        
        .welcome-message {
            color: #3498db;
            font-size: 1.5em;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
        }
        
        .status-message {
            color: #27ae60;
            background-color: #e8f5e9;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 30px;
        }
        
        .menu {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        
        .menu a {
            display: block;
            text-decoration: none;
            color: white;
            background-color: #3498db;
            padding: 12px 20px;
            border-radius: 5px;
            text-align: center;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        
        .menu a:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .menu a:last-child {
            background-color: #e74c3c;
        }
        
        .menu a:last-child:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <%
        AdminBean ab = (AdminBean)session.getAttribute("abean");
        String msg = (String)request.getAttribute("msg");    
    %>
    
    <div class="dashboard-container">
        <h2 class="welcome-message">Welcome, <%=ab.getfName()%></h2>
        
        <% if(msg != null) { %>
            <h2 class="status-message"><%=msg%></h2>
        <% } %>
        
        <div class="menu">
            <a href="Product.html">Add Product</a>
            <a href="view">View All Products</a>
            <a href="logout">Logout</a>
        </div>
    </div>
</body>
</html>