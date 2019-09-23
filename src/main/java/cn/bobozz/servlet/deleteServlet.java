package cn.bobozz.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bobozz.service.UserService;

public class deleteServlet extends HttpServlet{

	private UserService userservice = new UserService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		userservice.deleteUserService(request.getParameter("uid"));
		System.out.println(request.getParameter("uid"));
		
	}
}
