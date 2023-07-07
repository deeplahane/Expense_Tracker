package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Expense {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private String description;
	private int expense;
	private String date;
	private String time;
	@ManyToOne
	private User user;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getExpense() {
		return expense;
	}
	public void setExpense(int expense) {
		this.expense = expense;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Expense() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Expense(String title, String description, int expense, String date, String time, User user) {
		super();
		this.title = title;
		this.description = description;
		this.expense = expense;
		this.date = date;
		this.time = time;
		this.user = user;
	}
	
	public Expense(int id,String title, String description, int expense, String date, String time) {
		super();
		this.id=id;
		this.title = title;
		this.description = description;
		this.expense = expense;
		this.date = date;
		this.time = time;
	}
	
	
}
