package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/add")
public class AddProductServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession hs = req.getSession(false);
		
		if(hs==null) {
			req.setAttribute("msg", "Session Expired...<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		} else {
			ProductBean pb = new ProductBean();
			pb.setCode(req.getParameter("pcode"));
			pb.setName(req.getParameter("pname"));
			pb.setPrice(Float.parseFloat(req.getParameter("pprice")));
			pb.setQty(Integer.parseInt(req.getParameter("pqty")));
			
			int k = new AddProductDAO().insert(pb);
			
			if(k>0) {
				req.setAttribute("msg", "Product Added Successfully...<br>");
				req.getRequestDispatcher("AddProduct.jsp").forward(req, res);
			}
		}
		
	}
	
}
