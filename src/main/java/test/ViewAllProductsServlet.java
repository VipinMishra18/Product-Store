package test;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@SuppressWarnings("serial")
@WebServlet("/view")
public class ViewAllProductsServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession hs = req.getSession(false);
		
		if(hs==null) {
			req.setAttribute("msg", "Session Expired...<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		} else {
			
			ArrayList<ProductBean> pList = new ViewAllProductsDAO().retrieve();
			hs.setAttribute("plist", pList);
			req.getRequestDispatcher("ViewAllProducts.jsp").forward(req, res);
		}
		
	}
	
}
