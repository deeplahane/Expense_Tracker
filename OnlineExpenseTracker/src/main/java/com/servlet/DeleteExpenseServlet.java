package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.dao.ExpenseDao;
import com.entities.Message;
import com.helper.FactoryProvider;

public class DeleteExpenseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));
			boolean r=ExpenseDao.deleteExpense(id);
			
			HttpSession session = req.getSession();
			if (r) {
				Message msg = new Message("Expense deleted successfully...", "alert-success");
				session.setAttribute("msg", msg);
				res.sendRedirect("view_expenses.jsp");
			} else {
				Message msg = new Message("Oops! Something went wrong...", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("view_expenses.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
