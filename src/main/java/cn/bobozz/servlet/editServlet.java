package cn.bobozz.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bobozz.bean.UserPro;
import cn.bobozz.service.UserService;

public class editServlet extends HttpServlet{

	private UserService userservice = new UserService();
	private UserPro userpro = new UserPro();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userpro.setUid(request.getParameter("uid"));
		userpro.setUsername(request.getParameter("username"));
		userpro.setPassword(request.getParameter("password"));
		userpro.setAddress(request.getParameter("address"));
		userpro.setTel(request.getParameter("tel"));
		userpro.setEmail(request.getParameter("email"));
		boolean r = userservice.editUserService(userpro);
		if(r == true) {
				response.getWriter().print("{'msg':ok}");				
		}
	}
}
