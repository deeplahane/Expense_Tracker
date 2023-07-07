package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.UserDao;
import com.entities.Message;
import com.entities.User;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String about = req.getParameter("about");

			User user = new User(name, email, password, about);

			boolean b = UserDao.saveUser(user);

			HttpSession session = req.getSession();
			if (b) {
				Message msg = new Message("Congrats! Signup successfull...", "alert-success");
				session.setAttribute("msg", msg);
				res.sendRedirect("login.jsp");
			} else {
				Message msg = new Message("Oops! Something went wrong...", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
