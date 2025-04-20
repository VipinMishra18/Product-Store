<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Logout Successful</title>
		<style>
			body {
				font-family: 'Arial', sans-serif;
				background-color: #f5f5f5;
				margin: 0;
				padding: 0;
				display: flex;
				flex-direction: column;
				align-items: center;
				justify-content: center;
				min-height: 100vh;
				color: #333;
			}
			
			.logout-container {
				background: #fff;
				padding: 40px;
				border-radius: 8px;
				box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
				text-align: center;
				max-width: 500px;
				width: 90%;
				margin-bottom: 30px;
			}
			
			.logout-message {
				font-size: 24px;
				color: #2c3e50;
				margin-bottom: 20px;
				padding: 15px;
				border-bottom: 1px solid #eee;
			}
			
			.success-icon {
				color: #27ae60;
				font-size: 48px;
				margin-bottom: 20px;
			}
			
			.return-home {
				margin-top: 30px;
				font-size: 16px;
				color: #7f8c8d;
			}
			
			.continue-shopping {
				display: inline-block;
				margin-top: 20px;
				padding: 12px 24px;
				background-color: #3498db;
				color: white;
				text-decoration: none;
				border-radius: 4px;
				transition: background-color 0.3s;
			}
			
			.continue-shopping:hover {
				background-color: #2980b9;
			}
		</style>
	</head>
	<body>
		<div class="logout-container">
			<div class="success-icon">✓</div>
			<div class="logout-message">
				<%
					session.invalidate();
					out.println("You have been successfully logged out");
				%>
			</div>
			<div class="return-home">
				Thank you for visiting our store.
			</div>
			<a href="Home.html" class="continue-shopping">Continue Shopping</a>
		</div>
		
		<%@include file="Home.html" %>
	</body>
</html>