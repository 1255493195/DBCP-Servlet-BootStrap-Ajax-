package cn.bobozz.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;

import cn.bobozz.bean.UserPro;
import cn.bobozz.service.UserService;



public class queryServlet extends HttpServlet{

	private UserService userservice = new UserService();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<UserPro> users = userservice.queryUserService();
		if("addfresh".equals(request.getParameter("flag"))){
			response.setContentType("text/html;charset=utf-8");
			String data = JSONArray.toJSONString(users);
			response.getWriter().print(data);
		}else {
			request.setAttribute("users", users);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}
}
