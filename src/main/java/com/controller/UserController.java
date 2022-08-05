package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Cart;
import com.bean.Subscriber;
import com.bean.User;
import com.bean.Wishlist;
import com.dao.CartDao;
import com.dao.SubscriberDao;
import com.dao.UserDao;
import com.dao.WishlistDao;
import com.service.Registered;
import com.service.Services;
import com.service.SubscriberService;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("register"))
		{
			boolean flag=UserDao.checkEmail(request.getParameter("email"));
			if(flag==false) 
			{
				if(request.getParameter("password").equals(request.getParameter("cpassword")))
				{
					User u=new User();
					u.setFname(request.getParameter("fname"));
					u.setLname(request.getParameter("lname"));
					u.setEmail(request.getParameter("email"));
					u.setPhone(request.getParameter("phone"));
					u.setPassword(request.getParameter("password"));
					u.setUsertype(request.getParameter("usertype"));
					UserDao.register(u);
					Registered.sendMail(request.getParameter("email"));
					request.setAttribute("email", request.getParameter("email"));
					request.setAttribute("msg", "User Register Successfully");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				else
				{
					request.setAttribute("msg", "Password and Confirm Password Does Not Matched");
					request.getRequestDispatcher("register.jsp").forward(request, response);
				}
			}
			else
			{
				request.setAttribute("msg", "Email Already Registered");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("login"))
		{
			User u=UserDao.login(request.getParameter("email"), request.getParameter("password"));
			if(u==null)
			{
				request.setAttribute("msg", "Email Or Password Is Incorrect");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else if(u.getUsertype().equals("user")) 
			{
				HttpSession session=request.getSession();
				session.setAttribute("u", u);
				List<Wishlist> list=WishlistDao.getWishlistByUser(u.getId());
				session.setAttribute("wishlist_count", list.size());
				List<Cart> list1=CartDao.getCartByUser(u.getId());
				session.setAttribute("cart_count", list1.size());
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else
			{
				HttpSession session=request.getSession();
				session.setAttribute("u", u);
				request.getRequestDispatcher("seller_index.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("change password"))
		{
			HttpSession session=request.getSession();
			User u=(User)session.getAttribute("u");
			if(u.getUsertype().equals("user"))
			{
				if(u.getPassword().equals(request.getParameter("old_password")))
				{
					if(request.getParameter("new_password").equals(request.getParameter("cnew_password")))
					{
						UserDao.changePassword(u.getEmail(), request.getParameter("new_password")); 
						response.sendRedirect("logout.jsp");
					}
					else
					{
						request.setAttribute("msg", "New Password & Confirm New Password Does Not Matched");
						request.getRequestDispatcher("changepassword.jsp").forward(request, response);
					}
				}
				else 
				{
					request.setAttribute("msg", "Old Password Is Incorrect");
					request.getRequestDispatcher("changepassword.jsp").forward(request, response);
				}
			}
			else
			{
				if(u.getPassword().equals(request.getParameter("old_password")))
				{
					if(request.getParameter("new_password").equals(request.getParameter("cnew_password")))
					{
						UserDao.changePassword(u.getEmail(), request.getParameter("new_password")); 
						response.sendRedirect("logout.jsp");
					}
					else
					{
						request.setAttribute("msg", "New Password & Confirm New Password Does Not Matched");
						request.getRequestDispatcher("seller_changepassword.jsp").forward(request, response);
					}
				}
				else 
				{
					request.setAttribute("msg", "Old Password Is Incorrect");
					request.getRequestDispatcher("seller_changepassword.jsp").forward(request, response);
				}
			}
		}
		
		else if(action.equalsIgnoreCase("send otp"))
		{
			boolean flag=UserDao.checkEmail(request.getParameter("email"));
			if(flag==true)
			{
				/*Random t=new Random(1);
				int minRange=1000, maxRange=9999;
				int otp=t.nextInt(maxRange - minRange)+ minRange;
				System.out.println(otp);*/
				Random rand = new Random(1);
			         int otp = rand.nextInt((9999 - 100) + 1) + 10;
			         System.out.println(otp);
				Services.sendMail(request.getParameter("email"), otp);
				request.setAttribute("otp", otp);
				request.setAttribute("email", request.getParameter("email"));
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("msg", "Email Not Registered");
				request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("verify otp"))
		{
			String email=request.getParameter("email");
			if(request.getParameter("otp").equals(request.getParameter("uotp")))
			{
				request.setAttribute("email", email);
				request.getRequestDispatcher("newpassword.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("otp", request.getParameter("otp"));
				request.setAttribute("email", email);
				request.setAttribute("msg", "Invalid OTP");
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("update password"))
		{
			String email=request.getParameter("email");
			if(request.getParameter("new_password").equals(request.getParameter("cnew_password")))
			{
				UserDao.changePassword(email, request.getParameter("new_password"));
				response.sendRedirect("login.jsp");
			}
			else
			{
				request.setAttribute("email", email);
				request.setAttribute("msg", "New Password & Confirm New Password Does Not Matched");
				request.getRequestDispatcher("newpassword.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("subscribe"))
		{
			Subscriber s=new Subscriber();
			s.setName(request.getParameter("name"));
			s.setEmail(request.getParameter("email"));
			SubscriberDao.addToSubscriber(s);
			SubscriberService.sendMail(s.getEmail());
			request.setAttribute("email", request.getParameter("email"));
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
