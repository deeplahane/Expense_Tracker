package com.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Expense;
import com.helper.FactoryProvider;

public class ExpenseDao {
	private static SessionFactory factory = null;
	private static Session s = null;
	private static Transaction tx = null;

	public ExpenseDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public static boolean saveExpense(Expense e) {
		boolean f = false;

		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			s.save(e);

			tx.commit();
			f = true;
			s.close();

		} catch (Exception ex) {
			if (tx != null) {
				f = false;
				ex.printStackTrace();
			}
		}

		return f;
	}

	public static boolean updateExpense(Expense e) {
		boolean f = false;
		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			Query q = s.createQuery(
					"update Expense set title=:tit, description=:de, expense=:ex, date=:da, time=:ti where id=:i ");
			q.setParameter("tit", e.getTitle());
			q.setParameter("de", e.getDescription());
			q.setParameter("ex", e.getExpense());
			q.setParameter("da", e.getDate());
			q.setParameter("ti", e.getTime());
			q.setParameter("i", e.getId());

			q.executeUpdate();
			tx.commit();
			f = true;
			s.close();

		} catch (Exception ex) {
			if (tx != null) {
				f = false;
				ex.printStackTrace();
			}
		}
		return f;
	}

	public static boolean deleteExpense(int id) {
		boolean f = false;
		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			Query q = s.createQuery("delete Expense where id=:i ");
			q.setParameter("i", id);

			q.executeUpdate();
			tx.commit();
			f = true;
			s.close();

		} catch (Exception ex) {
			if (tx != null) {
				f = false;
				ex.printStackTrace();
			}
		}
		return f;
	}

}
