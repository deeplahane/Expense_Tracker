package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.entities.Expense;
import com.entities.Message;
import com.entities.User;

public class AddExpenseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			
			String title=req.getParameter("title");
			String description=req.getParameter("description");
			int expense=Integer.parseInt(req.getParameter("expense"));
			String date=req.getParameter("date");
			String time=req.getParameter("time");
			
			HttpSession session=req.getSession();
			User u=(User)session.getAttribute("userobj");
			
			Expense e=new Expense(title,description,expense,date,time,u);
			
			boolean b=ExpenseDao.saveExpense(e);

			if (b) {
				session.setAttribute("userobj", u);
				Message msg = new Message("Expense added successfully...", "alert-success");
				session.setAttribute("msg", msg);
				res.sendRedirect("add_expense.jsp");
			} else {
				Message msg = new Message("Oops! Something went wrong..", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("add_expense.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
