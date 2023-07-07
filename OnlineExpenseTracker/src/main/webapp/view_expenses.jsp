<%@page import="java.util.List"%>
<%@page import="javax.persistence.TypedQuery"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Message"%>
<%@page import="com.entities.Expense"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Expenses</title>
</head>
<body style="background-color: #f2f3f5;">
	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="text-center mt-4 mb-4" style="color: #54626F;">
			<h3>All Expense's</h3>
		</div>
		<table class="table" style="background-color: white">
			<thead style="background-color: #dcdcdc;">
				<tr style="color: #3E424B;">
					<th scope="col" style="width: 200px;">Title</th>
					<th scope="col" style="width: 650px;">Content</th>
					<th scope="col" style="width: 100px;">Expense</th>
					<th scope="col" style="width: 150px;">Date</th>
					<th scope="col" style="width: 100px;">Time</th>
					<th scope="col" style="width: 150px;">Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				Session s = FactoryProvider.getFactory().openSession();
				@SuppressWarnings("unchecked")
				TypedQuery<Expense> q = s.createQuery("from Expense order by id desc");
				List<Expense> expense = q.getResultList();

				for (Expense t : expense) {
				%>
				<tr>
					<th scope="row"><%=t.getTitle()%></th>
					<td><%=t.getDescription()%></td>
					<td><%=t.getExpense()%></td>
					<td><%=t.getDate()%></td>
					<td><%=t.getTime()%></td>
					<td><a class="btn-sm btn-primary mr-2 "
						style="text-decoration: none;"
						href="edit_expense.jsp?id=<%=t.getId()%>" role="button">Edit</a><a
						class="btn-sm btn-danger" style="text-decoration: none;"
						href="delete?id=<%=t.getId()%>" role="button">Delete</a></td>
				</tr>
				<%
				}
				s.close();
				%>

			</tbody>
		</table>
	</div>
</body>
</html>