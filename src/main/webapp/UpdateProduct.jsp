<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Admin Dashboard</title>
		<style>
			body {
				font-family: Arial, sans-serif;
				background-color: #f2f2f2;
				margin: 0;
				padding: 20px;
				color: #333;
			}
			
			.welcome-message {
				font-size: 18px;
				margin-bottom: 20px;
				padding: 10px;
				background-color: #fff;
				border-radius: 5px;
				box-shadow: 0 2px 5px rgba(0,0,0,0.1);
			}
			
			.status-message {
				padding: 10px;
				margin-bottom: 20px;
				background-color: #e6f7ff;
				border-left: 4px solid #1890ff;
				border-radius: 4px;
			}
			
			.nav-links {
				display: flex;
				gap: 10px;
				margin-top: 20px;
			}
			
			.nav-link {
				display: inline-block;
				padding: 10px 15px;
				background-color: #1890ff;
				color: white;
				text-decoration: none;
				border-radius: 4px;
				transition: background-color 0.3s;
			}
			
			.nav-link:hover {
				background-color: #096dd9;
			}
			
			.nav-link.logout {
				background-color: #f5222d;
			}
			
			.nav-link.logout:hover {
				background-color: #cf1322;
			}
		</style>
	</head>
	<body>
		<%
			AdminBean ab = (AdminBean)session.getAttribute("abean");
			String msg = (String)request.getAttribute("msg");
			
			// Added null checks to prevent errors
			if(ab != null) {
				out.println("<div class='welcome-message'>Page Belongs To : " + ab.getfName() + "</div>");
			}
			
			if(msg != null) {
				out.println("<div class='status-message'>" + msg + "</div>");
			}
		%>
		
		<div class="nav-links">
			<a href="Product.html" class="nav-link">Add-Product</a>
			<a href="view" class="nav-link">View-All-Products</a>
			<a href="logout" class="nav-link logout">Logout</a>
		</div>
	</body>
</html>