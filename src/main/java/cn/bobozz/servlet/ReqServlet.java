package cn.bobozz.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bobozz.bean.UserPro;
import cn.bobozz.service.UserService;

/**
 * Servlet implementation class ReqServlet
 */

public class ReqServlet extends HttpServlet {
	
	private UserPro userpro = new UserPro();
	private UserService userservice = new UserService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag = request.getParameter("flag");
		userpro.setUid(request.getParameter("uid"));
		userpro.setUsername(request.getParameter("username"));
		userpro.setPassword(request.getParameter("password"));
		userpro.setAddress(request.getParameter("address"));
		userpro.setTel(request.getParameter("tel"));
		userpro.setEmail(request.getParameter("email"));
		boolean r = userservice.reqUserService(userpro);
		if(r == true) {
			if("add".equals(flag)) {
				response.getWriter().print("{'msg':ok}");
			}else {
				response.sendRedirect("/mavenProject/login.jsp");
			}
				
		}else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("注册失败");
			
		}
		
	}

}
