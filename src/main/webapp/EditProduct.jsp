<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Update Product</title>
		<style>
			body {
				font-family: 'Arial', sans-serif;
				background-color: #f5f5f5;
				margin: 0;
				padding: 20px;
				color: #333;
			}
			
			.container {
				max-width: 800px;
				margin: 0 auto;
				background: #fff;
				padding: 30px;
				border-radius: 8px;
				box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
			}
			
			h1 {
				color: #2c3e50;
				text-align: center;
				margin-bottom: 30px;
				font-size: 24px;
			}
			
			.welcome-message {
				text-align: right;
				color: #7f8c8d;
				margin-bottom: 20px;
				font-style: italic;
			}
			
			.form-group {
				margin-bottom: 20px;
			}
			
			.form-group label {
				display: block;
				margin-bottom: 8px;
				font-weight: bold;
				color: #2c3e50;
			}
			
			.form-group input[type="text"] {
				width: 100%;
				padding: 10px;
				border: 1px solid #ddd;
				border-radius: 4px;
				font-size: 16px;
				box-sizing: border-box;
			}
			
			.form-group input[type="text"]:focus {
				border-color: #3498db;
				outline: none;
				box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
			}
			
			.btn {
				background-color: #3498db;
				color: white;
				border: none;
				padding: 12px 20px;
				font-size: 16px;
				border-radius: 4px;
				cursor: pointer;
				transition: background-color 0.3s;
				display: block;
				width: 100%;
				margin-top: 20px;
			}
			
			.btn:hover {
				background-color: #2980b9;
			}
			
			.hidden {
				display: none;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<h1>Update Product Details</h1>
			
			<div class="welcome-message">
				<%
					AdminBean ab = (AdminBean)session.getAttribute("abean");
					out.println("Welcome, " + ab.getfName());
				%>
			</div>
			
			<%
				ProductBean pb = (ProductBean)request.getAttribute("pbean");
			%>
			
			<form action="update" method="post">
				<input type="hidden" name="pcode" value="<%= pb.getCode() %>" class="hidden">
				
				<div class="form-group">
					<label for="pprice">Product Price:</label>
					<input type="text" id="pprice" name="pprice" value="<%= pb.getPrice() %>">
				</div>
				
				<div class="form-group">
					<label for="pqty">Product Quantity:</label>
					<input type="text" id="pqty" name="pqty" value="<%= pb.getQty() %>">
				</div>
				
				<button type="submit" class="btn">Update Product</button>
			</form>
		</div>
	</body>
</html>