<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Portal</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        
        .message-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
            width: 90%;
            max-width: 500px;
            text-align: center;
        }
        
        h2 {
            color: #2c3e50;
            margin: 0;
            font-size: 1.3rem;
            padding: 15px 0;
        }
        
        .success {
            color: #28a745;
            background-color: #e8f5e9;
            border-left: 4px solid #28a745;
        }
        
        .error {
            color: #dc3545;
            background-color: #f8d7da;
            border-left: 4px solid #dc3545;
        }
        
        .login-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 90%;
            max-width: 400px;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Segoe+UI:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>
    <%
        String msg = (String)request.getAttribute("msg");
        if(msg != null) {
            String msgClass = msg.toLowerCase().contains("fail") ? "error" : "success";
    %>
            <div class="message-container <%= msgClass %>">
                <h2><%= msg %></h2>
            </div>
    <%
        }
    %>
    
    <div class="login-container">
        <%@include file="AdminLogin.html" %>
    </div>
</body>
</html>