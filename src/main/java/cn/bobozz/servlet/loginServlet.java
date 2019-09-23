package cn.bobozz.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bobozz.bean.User;
import cn.bobozz.service.UserService;

/**
 * Servlet implementation class loginServlet
 */
public class loginServlet extends HttpServlet {
	
	private User user = new User();
	private UserService userservice = new UserService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		boolean l = userservice.loginUserService(user);
		if(l == true) {
			
			request.getSession().setAttribute("username", request.getParameter("username"));
			response.sendRedirect("queryServlet");
					
		}else {
			
			response.sendRedirect("/mavenProject/req.jsp");
		}
	}
}
