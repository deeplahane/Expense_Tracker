<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="all_css.jsp"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
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
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-2 pb-0 " style="box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-header text-center">
						<h4>
							<i class="fa-solid fa-user-plus"></i> Signup page
						</h4>
					</div>
					<div class="card-body">
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="jhon Doe" name="name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="jhondoe@gmail.com"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="JhonDoe@123" name="password">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">About</label> <textarea
									rows="3" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="I am a software developer..." name="about"></textarea>
							</div> 
							<div class="text-center">
								<button type="submit" class="btn btn-primary col-md-12">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>