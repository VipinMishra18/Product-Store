<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, test.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --danger: #f72585;
            --success: #4cc9f0;
            --dark: #212529;
            --light: #f8f9fa;
            --gray: #6c757d;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: var(--dark);
            line-height: 1.6;
        }
        
        .dashboard {
            display: grid;
            grid-template-columns: 250px 1fr;
            min-height: 100vh;
        }
        
        /* Sidebar Styles */
        .sidebar {
            background: var(--dark);
            color: white;
            padding: 20px 0;
        }
        
        .brand {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 20px;
        }
        
        .brand h2 {
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .brand i {
            color: var(--success);
        }
        
        .nav-menu {
            padding: 0 20px;
        }
        
        .nav-item {
            margin-bottom: 10px;
        }
        
        .nav-link {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 12px 15px;
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s;
        }
        
        .nav-link:hover, .nav-link.active {
            background: rgba(255,255,255,0.1);
            color: white;
        }
        
        .nav-link i {
            width: 20px;
            text-align: center;
        }
        
        /* Main Content Styles */
        .main-content {
            padding: 30px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }
        
        /* Product Table Styles */
        .card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            padding: 25px;
            margin-bottom: 30px;
        }
        
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }
        
        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
        }
        
        .btn {
            padding: 8px 16px;
            border-radius: 5px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .btn-primary {
            background: var(--primary);
            color: white;
        }
        
        .btn-primary:hover {
            background: var(--secondary);
        }
        
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .table th {
            text-align: left;
            padding: 12px 15px;
            background: #f8f9fa;
            font-weight: 600;
            color: var(--gray);
        }
        
        .table td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
        }
        
        .table tr:last-child td {
            border-bottom: none;
        }
        
        .table tr:hover td {
            background: #f8f9fa;
        }
        
        .badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        
        .badge-success {
            background: #e6f7f0;
            color: #00a854;
        }
        
        .badge-danger {
            background: #fff1f0;
            color: var(--danger);
        }
        
        .action-btn {
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 0.875rem;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            text-decoration: none;
        }
        
        .action-btn i {
            font-size: 0.75rem;
        }
        
        .btn-edit {
            background: #e6f7ff;
            color: var(--primary);
        }
        
        .btn-edit:hover {
            background: #d0e8ff;
        }
        
        .btn-delete {
            background: #fff1f0;
            color: var(--danger);
        }
        
        .btn-delete:hover {
            background: #ffccc7;
        }
        
        .empty-state {
            text-align: center;
            padding: 40px 20px;
        }
        
        .empty-state i {
            font-size: 3rem;
            color: #ddd;
            margin-bottom: 15px;
        }
        
        .empty-state h3 {
            color: var(--gray);
            margin-bottom: 10px;
        }
        
        .empty-state p {
            color: var(--gray);
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <%
        // Get admin info from session
        AdminBean ab = (AdminBean)session.getAttribute("abean");
        
        // Get product list from session with null check
        ArrayList<ProductBean> pList = (ArrayList<ProductBean>)session.getAttribute("plist");
        if(pList == null) {
            pList = new ArrayList<ProductBean>(); // Initialize empty list if null
        }
    %>
    
    <div class="dashboard">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="brand">
                <h2><i class="fas fa-box-open"></i> ProductMgr</h2>
            </div>
            <div class="nav-menu">
                <div class="nav-item">
                    <a href="#" class="nav-link active">
                        <i class="fas fa-table"></i>
                        <span>Products</span>
                    </a>
                </div>
                <div class="nav-item">
                    <a href="Product.html" class="nav-link">
                        <i class="fas fa-plus-circle"></i>
                        <span>Add Product</span>
                    </a>
                </div>
                <div class="nav-item">
                    <a href="logout" class="nav-link">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <h1>Product Management</h1>
                <div class="user-info">
                    <div class="user-avatar">
                        <% if (ab != null && ab.getfName() != null && !ab.getfName().isEmpty()) { %>
                            <%= ab.getfName().charAt(0) %>
                        <% } else { %>
                            A
                        <% } %>
                    </div>
                    <span>
                        <% if (ab != null && ab.getfName() != null) { %>
                            <%= ab.getfName() %>
                        <% } else { %>
                            Administrator
                        <% } %>
                    </span>
                </div>
            </div>
            
            <div class="card">
                <div class="card-header">
                    <h2 class="card-title">All Products</h2>
                    <a href="Product.html" class="btn btn-primary">
                        <i class="fas fa-plus"></i>
                        Add Product
                    </a>
                </div>
                
                <% if(pList.isEmpty()) { %>
                    <div class="empty-state">
                        <i class="fas fa-box-open"></i>
                        <h3>No Products Available</h3>
                        <p>Get started by adding your first product</p>
                        <a href="Product.html" class="btn btn-primary">
                            <i class="fas fa-plus"></i>
                            Add Product
                        </a>
                    </div>
                <% } else { %>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(ProductBean pb : pList) { %>
                                <tr>
                                    <td><%= pb.getCode() %></td>
                                    <td><%= pb.getName() %></td>
                                    <td>$<%= String.format("%.2f", pb.getPrice()) %></td>
                                    <td><%= pb.getQty() %></td>
                                    <td>
                                        <span class="badge <%= pb.getQty() > 0 ? "badge-success" : "badge-danger" %>">
                                            <%= pb.getQty() > 0 ? "In Stock" : "Out of Stock" %>
                                        </span>
                                    </td>
                                    <td>
                                        <div style="display: flex; gap: 8px;">
                                            <a href='edit?pcode=<%=pb.getCode()%>' class="action-btn btn-edit">
                                                <i class="fas fa-edit"></i>
                                                Edit
                                            </a>
                                            <a href='delete?pcode=<%=pb.getCode()%>' class="action-btn btn-delete">
                                                <i class="fas fa-trash-alt"></i>
                                                Delete
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>