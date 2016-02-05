package com.hanains.mysite.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hanains.mysite.service.UserService;
import com.hanains.mysite.vo.UserVo;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserVo vo = new UserVo();
		vo.setEmail(email);
		vo.setPassword(password);
		
		// listener가 만든 Root Application Container를 가져온다
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		
		UserService userService = applicationContext.getBean( UserService.class );
		UserVo authUser = userService.login(vo);
		if(authUser==null){
			response.sendRedirect(request.getContextPath()+"/user/loginform?result=fail");
			return false;
		}
		
		HttpSession session = request.getSession( true );
		session.setAttribute("authUser", authUser);
		response.sendRedirect(request.getContextPath());		
		return false;
	}
	
}
