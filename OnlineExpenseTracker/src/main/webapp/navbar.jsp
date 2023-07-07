<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-money-bill"></i> Expense Tracker</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent"
			style="justify-content: space-between;">
			<div>
				<ul class="navbar-nav ms-auto ">
					<li class="nav-item active"><a class="nav-link"
						href="home.jsp"><i class="fa-solid fa-house "></i> Home <span
							class="sr-only">(current)</span> </a></li>
					<c:if test="${not empty userobj}">
					<li class="nav-item active"><a class="nav-link"
						href="add_expense.jsp">
							<i class="fa-solid fa-plus"></i> Add Expense 
						<span
							class="sr-only">(current)</span> </a></li>
					<li class="nav-item active"><a class="nav-link"
						href="view_expenses.jsp">
							<i class="fa-solid fa-eye"></i> View Expenses
						<span
							class="sr-only">(current)</span> </a></li>

				</c:if></ul>
			</div>

			<div>
				<c:if test="${not empty userobj}">
					<a href="profile.jsp"><button type="button"
							class="btn btn-outline-light mr-2">
							<i class="fa-solid fa-user"></i> ${userobj.getName() }
						</button></a>
					<a href="logout"><button type="button"
							class="btn btn-outline-light">
							<i class="fa-solid fa-right-to-bracket fa-rotate-180"></i> Logout
						</button></a>

				</c:if>
				<c:if test="${ empty userobj}">
				<a href="login.jsp"><button type="button"
						class="btn btn-outline-light mr-2">
						<i class="fa-solid fa-right-to-bracket"></i> Login
					</button></a> <a href="register.jsp"><button type="button"
						class="btn btn-outline-light">
						<i class="fa-solid fa-user-plus"></i> Signup
					</button></a>
					</c:if>
			</div>

		</div>
	</nav>

</body>
</html>