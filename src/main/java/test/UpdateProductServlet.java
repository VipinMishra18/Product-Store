package test;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/update")
public class UpdateProductServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession hs = req.getSession(false);
		
		if(hs==null) {
			req.setAttribute("msg", "Session Expired...<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		} else {
			
			ArrayList<ProductBean> pList = (ArrayList<ProductBean>) hs.getAttribute("plist");
			String pC = req.getParameter("pcode");
			
			Iterator<ProductBean> pit = pList.iterator();
			
			while(pit.hasNext()) {
				ProductBean pb = pit.next();
				
				if(pC.equals(pb.getCode())) {
					pb.setPrice(Float.parseFloat(req.getParameter("pprice")));
					pb.setQty(Integer.parseInt(req.getParameter("pqty")));
					
					int k = new UpdateProductDAO().update(pb);
					
					if(k>0) {
						req.setAttribute("msg", "Product Updated Successfully...<br>");
						req.getRequestDispatcher("UpdateProduct.jsp").forward(req, res);
					}
					break;
				}
			}
		}
		
	}
	
}
