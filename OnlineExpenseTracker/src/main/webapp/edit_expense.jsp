<%@page import="com.entities.Expense"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Expense</title>
</head>
<body style="background-color: #f2f3f5">
	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>">
		<%=m.getContent()%></div>
	<%
	}
	session.removeAttribute("msg");
	%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<%
	int id=Integer.parseInt(request.getParameter("id"));
	Session s=FactoryProvider.getFactory().openSession();
	Expense e=s.get(Expense.class,id);
    s.close();
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card mt-4 pb-0 "
					style="box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-header text-center">
						<h3>
							<i class="fa-solid fa-pen-to-square"></i> Edit Expense
						</h3>
					</div>
					<div class="card-body">
						<form action="update_expense" method="post">
						<input type="hidden" value="<%=e.getId()  %>" name="id"/>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Title</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Rent" name="title" value="<%=e.getTitle()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Description</label>
								<textarea rows="3" class="form-control"
									id="exampleInputPassword1" placeholder="Paid the house rent."
									name="description"><%=e.getDescription()%></textarea>
							</div>
							<div class=""
								style="display: flex; align-items: center; justify-content: flex-start;">
								<div class="form-group col-md-4">
									<label for="exampleInputPassword1">Enter Expense</label> <input
										type="number" class="form-control" id="exampleInputPassword1"
										placeholder="500" name="expense" value="<%=e.getExpense()%>">
								</div>
								<div class="form-group col-md-4">
									<label for="exampleInputPassword1">Enter Date</label> <input
										type="date" class="form-control" id="exampleInputPassword1"
										name="date" value="<%=e.getDate()%>">
								</div>
								<div class="form-group col-md-4">
									<label for="exampleInputPassword1">Enter Time</label> <input
										type="time" class="form-control" id="exampleInputPassword1"
										name="time" value="<%=e.getTime()%>">
								</div>
							</div>
							<button type="submit" class="btn btn-primary col-md-12">Save
								Expense</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>