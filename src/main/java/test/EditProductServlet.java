package test;

import java.util.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/edit")
public class EditProductServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession hs = req.getSession(false); //accessing existing session
		
		if(hs==null) {
			req.setAttribute("msg", "Session Expired...<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		} else {
			
			ArrayList<ProductBean> pList = (ArrayList<ProductBean>)hs.getAttribute("plist");
			String pC = req.getParameter("pcode");
			
			Iterator<ProductBean> pit = pList.iterator();
			
			while(pit.hasNext()) {
				ProductBean pb = pit.next();
				
				if(pC.equals(pb.getCode())) {
					req.setAttribute("pbean", pb);
					req.getRequestDispatcher("EditProduct.jsp").forward(req, res);
					break;
				}
			}
		}
		
	}
	
}
